# E3D-ToolChanger-Configuration

# About the Machine

This config belongs to an [E3D Tool Changer](https://e3d-online.com/pages/toolchanger) running 4 custom direct drive tools of my [own design](https://github.com/garethky/Slice-Mosquito-Direct-Tool-Head) and a custom magnetic build surface with swappable spring steel build plates. The Duet hardware is a Duet 3 + expansion board with attached Raspberry Pi SBC. Currently running firmware 3.1.1.

The goal here is to enhance the ease of use of the machine so it becomes my favorite printer. Ideally these improvements will find their way back into the E3D Tool changer community and help Duet with their software.

# What Works

## globals.g
The file `globals.g` is where all of the global variable assignment takes place. This is a single file to define the machines tool configuration. It stores things like tool parameters (position, size, z offset etc). The goal is to allow a tool swap or z tune by editing a single file. But beware hacks inside...


## "Prusa style" filament loading and unloading
It will prompt you to heat up and has a loop to purge filament as required by the user. This is centralized in 2 macros so adding new filaments is quick and easy, requiring just a couple lines of GCode.

## [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) Tool changes
Tool changes use 3 macros and the data stored in globals.g to execute tool changes. No duplicate scripting is needed per-tool. globals.g drives the X and Y offsets of the tools in the dock.


# What Needs Work

## Live Z tuning print

Be able to heat the tool based on the configured filament and then print (ideally based on nozzle diameter) a test pattern that allows the user to tune the live Z of the tool visually from the control panel.


## Inductive probing & mesh bed leveling of the magnetic bed

I've filed an [issue](https://github.com/Duet3D/RepRapFirmware/issues/445) with Duet about this. It should be possible to offload the bed calculations to the SBC with a python script, similar to how [DuetLapse](https://github.com/DanalEstes/DuetLapse) works. Then the probing grid can be any set of points required by the bed geometry. The Python script would then generate the 


## Customizable Build Plate offsets

With a magnetic bed each build plate will need a customized live Z value. I might be able to make use of the filament system and a fake tool to accomplish storing and displaying the current build plate to the user. Also a uniquely g-code file can be written for each plate that saves the offset at the end of a print.

## Validate printer configuration at job start

* The nozzle diameter requested in the print should match the nozzle diameter for the tools involved in the print
* The filament type requested in the print should match the filament type loaded for each tool involved in the print

If any of these things don't match the print should abort with an error explaining the mismatch, such as "Tool 3 required PLA but you have ABS loaded" or "Tool 1 required a 0.4mm nozzle but you have a 0.6mm installed"

# Beware: Hacks Inside
This repo contains hacks that will likely not be supported forever by Duet. Specifically Duet doesn't yet have variables implemented. And even when they do, its not clear that variables can be associated with a tool, or persist between reboots. As such various hacks are used to get those effects. Hacks have side effects, the primary one being that the code is tied to the exact hardware configuration of my printer. The other main side effect is extra axes, tools and thermistors appearing in the UI. Filaments assigned to a tool can be saved and restored between restarts so this is the only way to persist a settings like nozzle size or bed configuration.

