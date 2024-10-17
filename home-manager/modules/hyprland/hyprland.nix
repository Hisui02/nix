{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$scrPath" = "$HOME/.local/share/bin";
      "$mainMod" = "SUPER";

      monitor = [
        ",preferred,auto,1.2"
        "HDMI-A-1,highres@highrr,auto-up,1.2"
      ];

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_SIZE,36"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,~/screens"
        "LIBVA_DRIVER_NAME,nvidia"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "WLR_NO_HARDWARE_CURSORS,1"
      ];

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      # device {
      #   name = epic mouse V1;
      #   sensitivity = -0.5;
      # }

      xwayland = {
        force_zero_scaling = true;
      };

      input = {
        kb_layout = "es";
        follow_mouse = 1;

        touchpad = {
          natural_scroll = true;
        };

        sensitivity = 0;
      };

      dwindle = {
        pseudotile = true; 
        preserve_split = true; 
      };

      master = {
        new_status = "master";
      };

      misc = {
        vrr = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
      };

      animations = {
        enabled = true;

        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];

        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, loop"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };

     

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };



      windowrule = [
        "opacity 0.90 0.90,class:^(Brave-browser)$"
        "opacity 0.80 0.80,class:^(code-oss)$"
        "opacity 0.80 0.80,class:^(kitty)$"
        "opacity 0.80 0.80,class:^(org.kde.dolphin)$"
        "opacity 0.80 0.70,class:^(org.pulseaudio.pavucontrol)$"
        "opacity 0.70 0.70,class:^(Spotify)$"
        "opacity 0 Option .80 0.80,class:^(discord)$"
        "float,class:^(org.kde.dolphin)$,title:^(Progress Dialog — Dolphin)$"
        "float,class:^(org.kde.dolphin)$,title:^(Copying — Dolphin)$"
        "float,class:^(kitty)$,title:^(top)$"
        "float,class:^(kitty)$,title:^(btop)$"
        "float,class:^(kitty)$,title:^(htop)$"
      ];

      layerrule = [

      ];

      exec-once = [
        # "swww init"
        # "swww img ~/Downloads/nixos-chan.png"
        "waybar"
        # "wl-paste --type text --watch cliphist store"
        # "wl-paste --type image --watch cliphist store"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];

      bind = [
        # Window/Session actions
        "$mainMod, Q, exec, $scrPath/dontkillsteam.sh" # close focused window
        "Alt, F4, exec, $scrPath/dontkillsteam.sh" # close focused window
        "$mainMod, Delete, exit," # kill hyprland session
        "$mainMod, W, togglefloating," # toggle the window between focus and float
        "$mainMod, G, togglegroup," # toggle the window between focus and group
        "Alt, Return, fullscreen," # toggle the window between focus and fullscreen
        "$mainMod, L, exec, swaylock" # launch lock screen
        "$mainMod+Shift, F, exec, $scrPath/windowpin.sh" # toggle pin on focused window
        "$mainMod, Backspace, exec, $scrPath/logoutlaunch.sh" # launch logout menu
        "Ctrl+Alt, W, exec, pkill waybar || waybar" # toggle waybar

        # Application shortcuts
        "$mainMod, T, exec, kitty"
        "$mainMod, E, exec, dolphin"
        "$mainMod, C, exec, codium"
        "$mainMod, B, exec, brave"
        "$mainMod, O, exec, obsidian"
        "$mainMod, S, exec, kitty btop"
        "Ctrl+Shift, Escape, exec, $scrPath/sysmonlaunch.sh" # launch system monitor (htop/btop or fallback to top)

        # Rofi menus
        "$mainMod, A, exec, pkill -x rofi || $scrPath/rofilaunch.sh d" # launch application launcher
        "$mainMod, Tab, exec, pkill -x rofi || $scrPath/rofilaunch.sh w" # launch window switcher

        # Move/Change window focus
        "$mainMod, Left, movefocus, l"
        "$mainMod, Right, movefocus, r"
        "$mainMod, Up, movefocus, u"
        "$mainMod, Down, movefocus, d"
        "Alt, Tab, movefocus, d"

        # Switch workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Switch workspaces to a relative workspace
        "$mainMod+Ctrl, Right, workspace, r+1"
        "$mainMod+Ctrl, Left, workspace, r-1"

        # Resize windows
        "$mainMod+Shift, Right, resizeactive, 30 0"
        "$mainMod+Shift, Left, resizeactive, -30 0"
        "$mainMod+Shift, Up, resizeactive, 0 -30"
        "$mainMod+Shift, Down, resizeactive, 0 30"

        # Move focused window to a workspace
        "$mainMod+Shift, 1, movetoworkspace, 1"
        "$mainMod+Shift, 2, movetoworkspace, 2"
        "$mainMod+Shift, 3, movetoworkspace, 3"
        "$mainMod+Shift, 4, movetoworkspace, 4"
        "$mainMod+Shift, 5, movetoworkspace, 5"
        "$mainMod+Shift, 6, movetoworkspace, 6"
        "$mainMod+Shift, 7, movetoworkspace, 7"
        "$mainMod+Shift, 8, movetoworkspace, 8"
        "$mainMod+Shift, 9, movetoworkspace, 9"
        "$mainMod+Shift, 0, movetoworkspace, 10"

        # Move focused window to a relative workspace
        "$mainMod+Ctrl+Alt, Right, movetoworkspace, r+1"
        "$mainMod+Ctrl+Alt, Left, movetoworkspace, r-1"

        # Scroll through existing workspaces
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Move/Resize focused window
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizeactive"
        "$mainMod, Z, movewindow"
        "$mainMod, X, resizeactive"

        # Move/Switch to special workspace (scratchpad)
        "$mainMod+Alt, period, movetoworkspacesilent, special"
        "$mainMod, period, togglespecialworkspace,"

        # Toggle focused window split
        "$mainMod, J, togglesplit"

        # Move focused window to a workspace silently
        "$mainMod+Alt, 1, movetoworkspacesilent, 1"
        "$mainMod+Alt, 2, movetoworkspacesilent, 2"
        "$mainMod+Alt, 3, movetoworkspacesilent, 3"
        "$mainMod+Alt, 4, movetoworkspacesilent, 4"
        "$mainMod+Alt, 5, movetoworkspacesilent, 5"
        "$mainMod+Alt, 6, movetoworkspacesilent, 6"
        "$mainMod+Alt, 7, movetoworkspacesilent, 7"
        "$mainMod+Alt, 8, movetoworkspacesilent, 8"
        "$mainMod+Alt, 9, movetoworkspacesilent, 9"
        "$mainMod+Alt, 0, movetoworkspacesilent, 10"
      ];

      bindd = [
        "$mainMod+Shift, P,Color Picker , exec, hyprpicker -a" # Pick color (Hex) >> clipboard# 
      ];
    };
  };
}
