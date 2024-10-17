{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "bottom";
        mod = "dock";
        height = 28;
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        reload_style_on_change = true;

        modules-left = ["custom/padd" "custom/l_end" "cpu" "memory" "custom/cpuinfo" "custom/gpuinfo" "custom/r_end" "custom/l_end" "idle_inhibitor" "clock" "custom/r_end" "custom/l_end" "hyprland/workspaces" "custom/r_end" "custom/padd"];
	    modules-center = ["custom/padd" "custom/l_end" "hyprland/window" "custom/r_end" "custom/padd"];
	    modules-right = ["custom/padd" "custom/l_end" "backlight" "network" "pulseaudio" "pulseaudio#microphone" "custom/updates" "custom/keybindhint" "custom/r_end" "custom/l_end" "privacy" "tray" "battery" "custom/r_end" "custom/l_end" "custom/wallchange" "custom/theme" "custom/wbar" "custom/cliphist" "custom/power" "custom/r_end" "custom/padd"];

   "cpu" = {
    interval = 10;
    format = "󰍛 {usage}%";
    rotate = 0;
    format-alt = "{icon0}{icon1}{icon2}{icon3}";
    format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
};

"memory" = {
    states = {
        c = 90;
        h = 60; 
        m = 30;  
    };
    interval = 30;
    format = "󰾆 {used}GB";
    rotate = 0;
    format-m = "󰾅 {used}GB";
    format-h = "󰓅 {used}GB";
    format-c = " {used}GB";
    format-alt = "󰾆 {percentage}%";
    max-length = 10;
    tooltip = true;
    tooltip-format = "󰾆 {percentage}%\n {used:0.1f}GB/{total:0.1f}GB";
};

"custom/cpuinfo" = {
    exec = "cpuinfo.sh";
    return-type = "json";
    format = "{}";
    rotate = 0;
    interval = 5; 
    tooltip = true;
    max-length = 1000;
};

"custom/gpuinfo" = {
    exec = "gpuinfo.sh";
    return-type = "json";
    format = "{}";
    rotate = 0;
    interval = 5; 
    tooltip = true;
    max-length = 1000;
    on-click = "gpuinfo.sh --toggle";
};

"custom/gpuinfo#nvidia" = {
    exec = "gpuinfo.sh --use nvidia";
    return-type = "json";
    format = "{}";
    rotate = 0;
    interval = 5;
    tooltip = true;
    max-length = 1000;
};

"custom/gpuinfo#amd" = {
    exec = "gpuinfo.sh --use amd";
    return-type = "json";
    format = "{}";
    rotate = 0;
    interval = 5;
    tooltip = true;
    max-length = 1000;
};

"custom/gpuinfo#intel" = {
    exec = "gpuinfo.sh --use intel";
    return-type = "json";
    format = "{}";
    rotate = 0;
    interval = 5;
    tooltip = true;
    max-length = 1000;
};

"idle_inhibitor" = {
    format = "{icon}";
    rotate = 0;
    format-icons = {
        activated = "󰥔";
        deactivated = "";
    };
};

"clock" = {
    format = "{:%R 󰃭 %d·%m·%y}";
    rotate = 0;
    format-alt = "{:%R 󰃭 %d·%m·%y}";
    tooltip-format = "<span>{calendar}</span>";
    calendar = {
        mode = "month";
        mode-mon-col = 3;
        on-scroll = 1;
        on-click-right = "mode";
        format = {
            months = "<span color='#ffead3'><b>{}</b></span>";
            weekdays = "<span color='#ffcc66'><b>{}</b></span>";
            today = "<span color='#ff6699'><b>{}</b></span>";
        };
    };
    actions = {
        on-click-right = "mode";
        on-click-forward = "tz_up";
        on-click-backward = "tz_down";
        on-scroll-up = "shift_up";
        on-scroll-down = "shift_down";
    };
};

"hyprland/workspaces" = {
    disable-scroll = true;
    rotate = 0;
    all-outputs = true;
    active-only = false;
    on-click = "activate";
    on-scroll-up = "hyprctl dispatch workspace -1";
    on-scroll-down = "hyprctl dispatch workspace +1";
    persistent-workspaces = {};
};

"hyprland/window" = {
    format = "  {}";
    rotate = 0;
    separate-outputs = true;
    rewrite = {
        "hisui@archlinux:(.*)" = "$1 ";
        "(.*) — Mozilla Firefox" = "$1 󰈹";
        "(.*)Mozilla Firefox" = "Firefox 󰈹";
        "(.*) - Visual Studio Code" = "$1 󰨞";
        "(.*)Visual Studio Code" = "Code 󰨞";
        "(.*) — Dolphin" = "$1 󰉋";
        "(.*)Spotify" = "Spotify 󰓇";
        "(.*)Steam" = "Steam 󰓓";
    };
    max-length = 1000;
};

"backlight" = {
    device = "intel_backlight";
    rotate = 0;
    format = "{icon} {percent}%";
    format-icons = ["" "" "" "" "" "" "" "" ""];
    on-scroll-up = "brightnessctl set 1%+";
    on-scroll-down = "brightnessctl set 1%-";
    min-length = 6;
};

"network" = {
    tooltip = true;
    format-wifi = " ";
    rotate = 0;
    format-ethernet = "󰈀 ";
    tooltip-format = "Network: <big><b>{essid}</b></big>\nSignal strength: <b>{signaldBm}dBm ({signalStrength}%)</b>\nFrequency: <b>{frequency}MHz</b>\nInterface: <b>{ifname}</b>\nIP: <b>{ipaddr}/{cidr}</b>\nGateway: <b>{gwaddr}</b>\nNetmask: <b>{netmask}</b>";
    format-linked = "󰈀 {ifname} (No IP)";
    format-disconnected = "󰖪 ";
    tooltip-format-disconnected = "Disconnected";
    format-alt = "<span foreground='#99ffdd'> {bandwidthDownBytes}</span> <span foreground='#ffcc66'> {bandwidthUpBytes}</span>";
    interval = 2;
};

"pulseaudio" = {
    format = "{icon} {volume}";
    rotate = 0;
    format-muted = "婢";
    on-click = "pavucontrol -t 3";
    on-click-right = "volumecontrol.sh -s ''";
    on-click-middle = "volumecontrol.sh -o m";
    on-scroll-up = "volumecontrol.sh -o i";
    on-scroll-down = "volumecontrol.sh -o d";
    tooltip-format = "{icon} {desc} // {volume}%";
    scroll-step = 5;
    format-icons = {
        headphone = "";
        hands-free = "";
        headset = "";
        phone = "";
        portable = "";
        car = "";
        default = ["" "" ""];
    };
};

"pulseaudio#microphone" = {
    format = "{format_source}";
    rotate = 0;
    format-source = "";
    format-source-muted = "";
    on-click = "pavucontrol -t 4";
    on-click-middle = "volumecontrol.sh -i m";
    on-scroll-up = "volumecontrol.sh -i i";
    on-scroll-down = "volumecontrol.sh -i d";
    tooltip-format = "{format_source} {source_desc} // {source_volume}%";
    scroll-step = 5;
};

"custom/updates" = {
    exec = "systemupdate.sh";
    return-type = "json";
    format = "{}";
    rotate = 0;
    on-click = "hyprctl dispatch exec 'systemupdate.sh up'";
    interval = 86400;
    tooltip = true;
    signal = 20;
};

"custom/keybindhint" = {
    format = " ";
    rotate = 0;
    on-click = "keybinds_hint.sh";
};

"privacy" = {
    icon-size = 12;
    icon-spacing = 5;
    transition-duration = 250;
    modules = [
        {
            type = "screenshare";
            tooltip = true;
            tooltip-icon-size = 24;
        }
        {
            type = "audio-in";
            tooltip = true;
            tooltip-icon-size = 24;
        }
    ];
};

"tray" = {
    icon-size = 16;
    rotate = 0;
    spacing = 5;
};

battery = {
    states = {
        good = 95;
        warning = 30;
        critical = 20;
    };
    format = "{icon} {capacity}%";
    format-charging = " {capacity}%";
    format-plugged = " {capacity}%";
    format-alt = "{time} {icon}";
    format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
};

wallchange = {
    format = "{}";
    exec = "echo ; echo 󰆊 switch wallpaper";
    on-click = "swwwallpaper.sh -n";
    on-click-right = "swwwallpaper.sh -p";
    on-click-middle = "sleep 0.1 && swwwallselect.sh";
    interval = 86400; # once every day
    tooltip = true;
};

theme = {
    format = "{}";
    exec = "echo ; echo 󰟡 switch theme";
    on-click = "themeswitch.sh -n";
    on-click-right = "themeswitch.sh -p";
    on-click-middle = "sleep 0.1 && themeselect.sh";
    interval = 86400; # once every day
    tooltip = true;
};

wbar = {
    format = "{}"; #    //
    exec = "echo ; echo  switch bar //  dock";
    on-click = "wbarconfgen.sh n";
    on-click-right = "wbarconfgen.sh p";
    on-click-middle = "sleep 0.1 && quickapps.sh kitty firefox spotify code dolphin";
    interval = 86400;
    tooltip = true;
};

cliphist = {
    format = "{}";
    exec = "echo ; echo 󰅇 clipboard history";
    on-click = "sleep 0.1 && cliphist.sh c";
    on-click-right = "sleep 0.1 && cliphist.sh d";
    on-click-middle = "sleep 0.1 && cliphist.sh w";
    interval = 86400; # once every day
    tooltip = true;
};

power = {
    format = "{}";
    exec = "echo ; echo  logout";
    on-click = "logoutlaunch.sh 2";
    on-click-right = "logoutlaunch.sh 1";
    interval = 86400; # once every day
    tooltip = true;
};

      };
    };
  
    style = 
      ''
    * {
    border: none;
    border-radius: 0px;
    font-family: "JetBrainsMono Nerd Font";
    font-weight: bold;
    font-size: 10px;
    min-height: 10px;
}

@define-color bar-bg rgba(0, 0, 0, 0);

@define-color main-bg #11111b;
@define-color main-fg #cdd6f4;

@define-color wb-act-bg #a6adc8;
@define-color wb-act-fg #313244;

@define-color wb-hvr-bg #f5c2e7;
@define-color wb-hvr-fg #313244;

window#waybar {
    background: @bar-bg;
}

tooltip {
    background: @main-bg;
    color: @main-fg;
    border-radius: 7px;
    border-width: 0px;
}

#workspaces button {
    box-shadow: none;
	text-shadow: none;
    padding: 0px;
    border-radius: 8px;
    margin-top: 2px;
    margin-bottom: 2px;
    margin-left: 0px;
    padding-left: 2px;
    padding-right: 2px;
    margin-right: 0px;
    color: @main-fg;
    animation: ws_normal 20s ease-in-out 1;
}

#workspaces button.active {
    background: @wb-act-bg;
    color: @wb-act-fg;
    margin-left: 2px;
    padding-left: 11px;
    padding-right: 11px;
    margin-right: 2px;
    animation: ws_active 20s ease-in-out 1;
    transition: all 0.4s cubic-bezier(.55,-0.68,.48,1.682);
}

#workspaces button:hover {
    background: @wb-hvr-bg;
    color: @wb-hvr-fg;
    animation: ws_hover 20s ease-in-out 1;
    transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
}

#taskbar button {
    box-shadow: none;
	text-shadow: none;
    padding: 0px;
    border-radius: 8px;
    margin-top: 2px;
    margin-bottom: 2px;
    margin-left: 0px;
    padding-left: 2px;
    padding-right: 2px;
    margin-right: 0px;
    color: @wb-color;
    animation: tb_normal 20s ease-in-out 1;
}

#taskbar button.active {
    background: @wb-act-bg;
    color: @wb-act-color;
    margin-left: 2px;
    padding-left: 11px;
    padding-right: 11px;
    margin-right: 2px;
    animation: tb_active 20s ease-in-out 1;
    transition: all 0.4s cubic-bezier(.55,-0.68,.48,1.682);
}

#taskbar button:hover {
    background: @wb-hvr-bg;
    color: @wb-hvr-color;
    animation: tb_hover 20s ease-in-out 1;
    transition: all 0.3s cubic-bezier(.55,-0.68,.48,1.682);
}

#tray menu * {
    min-height: 16px
}

#tray menu separator {
    min-height: 10px
}

#backlight,
#battery,
#bluetooth,
#custom-cliphist,
#clock,
#custom-cpuinfo,
#cpu,
#custom-gpuinfo,
#idle_inhibitor,
#custom-keybindhint,
#language,
#memory,
#mpris,
#network,
#custom-notifications,
#custom-power,
#privacy,
#pulseaudio,
#custom-spotify,
#taskbar,
#custom-theme,
#tray,
#custom-updates,
#custom-wallchange,
#custom-wbar,
#window,
#workspaces,
#custom-l_end,
#custom-r_end,
#custom-sl_end,
#custom-sr_end,
#custom-rl_end,
#custom-rr_end {
    color: @main-fg;
    background: @main-bg;
    opacity: 1;
    margin: 3px 0px 3px 0px;
    padding-left: 4px;
    padding-right: 4px;
}

#workspaces,
#taskbar {
    padding: 0px;
}

#custom-r_end {
    border-radius: 0px 19px 19px 0px;
    margin-right: 8px;
    padding-right: 0px;
}

#custom-l_end {
    border-radius: 19px 0px 0px 19px;
    margin-left: 8px;
    padding-left: 0px;
}

#custom-sr_end {
    border-radius: 0px;
    margin-right: 8px;
    padding-right: 0px;
}

#custom-sl_end {
    border-radius: 0px;
    margin-left: 8px;
    padding-left: 0px;
}

#custom-rr_end {
    border-radius: 0px 7px 7px 0px;
    margin-right: 8px;
    padding-right: 0px;
}

#custom-rl_end {
    border-radius: 7px 0px 0px 7px;
    margin-left: 8px;
    padding-left: 0px;
}

      '';
  };
}
