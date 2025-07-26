{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.userSettings = {
      "workbench.colorTheme" = "wallbash";
      "window.menuBarVisibility" = "toggle";
      "editor.fontSize" = 12;
      "editor.scrollbar.vertical" = "hidden";
      "editor.scrollbar.verticalScrollbarSize" = 0;
      "security.workspace.trust.untrustedFiles" = "newWindow";
      "security.workspace.trust.startupPrompt" = "never";
      "security.workspace.trust.enabled" = false;
      "editor.minimap.side" = "left";
      "editor.fontFamily" = "'CaskaydiaCove Nerd Font Mono', 'Maple Mono', 'monospace', monospace";
      "extensions.autoUpdate" = false;
      "workbench.statusBar.visible" = false;
      "terminal.external.linuxExec" = "kitty";
      "terminal.explorerKind" = "both";
      "terminal.sourceControlRepositoriesKind" = "both";
      "telemetry.telemetryLevel" = "off";
      "update.mode" = "none";
      "workbench.activityBar.location" = "top";
      "workbench.layoutControl.enabled" = false;
      "window.commandCenter" = false;
      "window.customTitleBarVisibility" = "never";
      "window.titleBarStyle" = "native";
      "git.confirmSync" = false;
      "git.enableSmartCommit" = true;
      "git.openRepositoryInParentFolders" = "always";
      "git.autofetch" = true;
    };
  };
}
