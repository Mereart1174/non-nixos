{ config, lib, inputs, pkgs, ...}:

{
    home.username = "mere";
    home.homeDirectory = "/home/mere";

    nixpkgs.config.allowUnfree = true;

    home.stateVersion = "22.11";

    programs.home-manager.enable = true;

    imports = [ ./config/default.nix ];

    home.packages = with pkgs; [
        # Command Line
        hyfetch
        exa ripgrep bat fd btop neofetch du-dust ranger
        minizip # unrar unzip neovim 
        git easyeffects
        zsh starship
        alacritty
            # doas openssh

        # Development Tools
            # rustup
            # llvm
            # qemu_full

        # Desktop Application
        hyprland waybar
        swaylock wlogout
        wl-clipboard wlsunset
            # firefox
        rofi wofi mako mpv imv swaybg mpvpaper
        # brightnessctl
            # wayfire wf-config wlroots
            # vulkan-tools
            # virt-manager
    ];
}
