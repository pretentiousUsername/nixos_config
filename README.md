# My NixOS config
This is my main config file for any NixOS system I will be using in the future
(hopefully). All you need to do is run `update-files.sh`, and it should install
everything just how you might want.

If you need this to run on your system, you will need to create a symlink
between your hardware configuration in the `/etc/nixos` directory and `src/`
in this directory. I did this in order to make sure that my configuration is
essentially hardware-agnostic.

<!--Right now I'm just trying to see if git will sign this.-->
