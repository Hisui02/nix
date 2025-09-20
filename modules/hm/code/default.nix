{ pkgs, ... }:
{
  /*
    1. We need to manually install Wallbash Theme, we can do it via downloading and installing the .vsix file
      https://marketplace.visualstudio.com/items?itemName=TheHyDEProject.wallbash&ssr=false#overview
    2. We can download the .vsix file constructing the URL as follows:
      https://marketplace.visualstudio.com/_apis/public/gallery/publishers/${publisher}/vsextensions/${extension}/${version}/vspackage
      Example of a complete download link, we should replace the version with the last one published:
      https://marketplace.visualstudio.com/_apis/public/gallery/publishers/thehydeproject/vsextensions/wallbash/0.3.7/vspackage
    3. When the file is downloaded we can install it vie terminal with the command:
      codium --install-extension <fileName>.vsix
    4. We might need to reopen VSCodium or even rebuild the system for this to apply.
  */

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default.userSettings = {
      "workbench.colorTheme" = "Wallbash";
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
      "terminal.external.linuxExec" = "zsh";
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
      "terminal.integrated.fontLigatures.enabled" = true;
    };
  };
}
