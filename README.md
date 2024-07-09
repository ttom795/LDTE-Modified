# Toy Pad Emulator for Lego Dimensions (modified by ttom795)

<a href="https://www.buymeacoffee.com/Berny23" title="Donate to this project using Buy Me A Coffee"><img src="https://img.shields.io/badge/buy%20me%20a%20coffee-donate-yellow.svg" alt="Buy Me A Coffee donate button" /></a>
</span>

Allows you to connect an emulated Toy Pad to your PC or video-game console. Developed primarily by Berny23 (support them above!), modified by myself to make it easier for people to use. 

Keep in mind, this one-stop solution has only been tested by myself on an Ubuntu 22.04.4 (LTS) machine. However, it's significantly easier to use than the original set-up.

#### Usage

1. Run the following commands
   ```
   npm install
   sudo bash ./usb_script.sh
   ```

2. Type `http://localhost` in a browser to use the emulator.

   If you want to turn it off, just press `Ctrl + C` in the terminal, then use the command `sudo shutdown now` to power off the virtual machine or just pause it from the host. To restart it, only use the usb_script.sh command.
   
3. Finally, start your console emulator and the game itself (e.g. Cemu).

## License
[MIT](https://choosealicense.com/licenses/mit/)
