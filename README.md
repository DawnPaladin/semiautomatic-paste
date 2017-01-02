# Semiautomatic Paste

This is an automation tool that reads a series of files from disk, copies them to the clipboard, and pastes them one at a time. It's written in [AutoHotkey](http://ahkscript.net/), which must be installed to use it.

## Setup

1. Set the working directory on line 2 
2. Edit the list of files that starts on line 5
3. Set the number of files you'll be looping through on line 14

## Usage

Place the cursor where you want the file to be pasted, hold down the Windows key, and press V. Everything in that textbox will be replaced with the contents of your file. You can then press Win-V again to paste the next file, and the next, and so forth.

If it doesn't work, try uncommenting `SendMode Play` on line 1. This changes the way in which AutoHotkey imitates your keyboard. For more information, see the [AutoHotkey docs](https://autohotkey.com/docs/commands/SendMode.htm).

