# E3D-ToolChanger-Configuration

# About the Machine

This config belongs to an [E3D Tool Changer](https://e3d-online.com/pages/toolchanger) running 4 custom direct drive tools of my [own design](https://github.com/garethky/Slice-Mosquito-Direct-Tool-Head) and a custom magnetic build surface with swappable spring steel build plates. The Duet hardware is a Duet 3 + expansion board with attached Raspberry Pi SBC. Currently running firmware 3.1.1.

The goal here is to enhance the ease of use of the machine so it becomes my favorite printer. Ideally these improvements will find their way back into the E3D Tool changer community and help Duet with their software.

# What Works

## globals.g

The file `globals.g` is where all of the global variable assignment takes place. This is a single file to define the machine's tool configuration. It stores things like tool parameters (position, size, z offset etc). The goal is to allow a tool swap or tweak by editing a single file. But beware hacks inside...

## "Prusa style" filament loading and unloading

It will prompt you to heat up and has a loop to purge filament as required by the user. This is centralized in 2 macros so adding new filaments is quick and easy, requiring just a couple lines of GCode.

## [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) Tool changes

Tool changes use 3 macros and the data stored in globals.g to execute tool changes. No duplicate scripting is needed per-tool. globals.g drives the X and Y offsets of the tools in the dock. Also the actual movement speeds and lengths have been tweaked to be more gentle and optimize for safety and less wasted travel moves between tools.

## "Adjust Live Z"

The baby stepping value is saved per-tool. Every time a tool is put back in the dock the value is saved and every time. a tool it grabbed the value for that tool is loaded. The values are peristed with `M500` and loaded on startup with `M501`.

## Noise

A number of tweaks have been made to reduce printing noise. These include running at reduced aceleration and jerk, reduced motor current, tewaked Trinamic driver settings, switching to 0.9 degree steppers and changes to the tool heads. Its not as quiet as my Prusa MK3 but it is something I can sit next to while I work.

## Direct Drive Tool Heads
The tools are my own design using Bondtech BMG gears, Slice Engineering Mosquito hot end and quiet fans.

# What Needs Work

This is the list of high priority items that I need to implement or fix to feel confident using the printer for day-to-day print jobs.

## Use the same Fialment in Multiple tools
Currently there is an artifical restriction in Duet's firmware that stops the same Filament type being loaded into multiple tools. This is a pretty straightforward thing to remove from the firmware and GUI.

## Live Z test print

Be able to heat the tool based on the configured filament and then print (ideally based on nozzle diameter) a test pattern that allows the user to tune the live Z of the tool visually from the control panel.

## Inductive probing & mesh bed leveling of the magnetic bed

The mechanical switch used for Z-probing has limitations. I have had one physical failure which resulted in a Z crash. I dont feel that the printer can do homing or mesh bed leveling safely while unattended. The switches are rated for 1M opperations at 30/minute but mesh bed probing is closer to 300/minute if the same point is probed 3 times.

Inductive probing a magnetic bed requires a custom set of probe points to avoid magnetic interference. This isnt a capability of Duet's mesh bed leveling. I've filed an [issue](https://github.com/Duet3D/RepRapFirmware/issues/445) with Duet about this but I gather its unlikely to be addressed in firmware due to processing limitations. It should be possible to offload the bed calculations to the SBC with a Python script, similar to how [DuetLapse](https://github.com/DanalEstes/DuetLapse) works. Then the probing grid can be any set of points required by the bed geometry. The Python script would then generate a synthetic heightmap file that the Duet can use with its existing linear interpolation algorithm.

## Z Axis Stall Detection

Currently this is not enabled. If there is a failure that causes the Z-switch not to trigger (z-switch broken, x/y position incorrect) the head can crash into the bed. This puts a lot of strain on the gantry and the bed, knocking the bnd out of tram. A z-stall detect should stop the print and, ideally, cause Z to back up so the printer isn't halted in the strained/crashed state.

## Validate printer tool configuration at job start

This is the feature that prevents "Bozo" from visiting the workshop.

* All objects in the print should be assigned a Tool number. ("Default" is dangerous)
* The nozzle diameter requested in the print should match the nozzle diameter for the tools involved in the print
* The filament type requested in the print should match the filament type loaded for each tool involved in the print

If any of these things don't match the print should abort with an error explaining the mismatch, such as "Tool 3 required PLA but you have ABS loaded" or "Tool 1 required a 0.4mm nozzle but you have a 0.6mm installed"

## Purging and Wiping
If a tool is selected and it has a configured active temprature it should do a purge and wipe before going to the print bed. Without this I can do purge into lines for single tool prints but cant reliably print with multiple tools.

# Wishlist

This is a list of things I wish I could implement but are probably a long way off.

## Guided Nozzle Swapping

Ideally swapping nozzles would be accomplished via the GUI and would execute user macros. Nozzle swap procedure would look like this:

* Grab the tool
* Heat the tool to the configured filament temp to soften the plastic
* Let the user know when the tool is hot
* User swaps the nozzle
* Heat the tool head for hot tightenting
* Ask the user if they want to run a Live Z calibration now

## Customizable Build Plate offsets

With a magnetic bed each build plate will need a customized live Z value. I might be able to make use of the filament system and a fake tool to accomplish storing and displaying the current build plate to the user. Also a uniquely g-code file can be written for each plate that saves the offset at the end of a print.


# Beware: Hacks Inside
This repo contains hacks that will likely not be supported forever by Duet. Specifically Duet doesn't yet have variables implemented. And even when they do, its not clear that variables can be associated with a tool, or persist between reboots. As such various hacks are used to get those effects. Hacks have side effects, the primary one being that the code is tied to the exact hardware configuration of my printer. The other main side effect is extra axes, tools and thermistors appearing in the UI. Filaments assigned to a tool can be saved and restored between restarts so this is the only way to persist a settings like nozzle size or bed configuration.

