{
  inputs,
  pkgs,
  lib,
  systemSettings,
  ...
}:
let
  extension = shortId: guid: {
    name = guid;
    value = {
      install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
      installation_mode = "normal_installed";
    };
  };

  prefs = {
    # Check these out at about:config
    "extensions.autoDisableScopes" = 0;
    "extensions.pocket.enabled" = false;
    "zen.tabs.ctrl-tab.ignore-essential-tabs" = false;
    "zen.view.sidebar-expanded" = false;
    "zen.view.use-single-toolbar" = false;
    "zen.tabs.show-newtab-vertical" = false;
    "zen.view.show-newtab-button-top" = false;
    "zen.pinned-tab-manager.restore-pinned-tabs-to-pinned-url" = true;
    "dom.forms.autocomplete.formautofill" = true;
    "extensions.formautofill.addresses.enabled" = false;
    "extensions.formautofill.creditCards.enabled" = false;
    "signon.management.page.breach-alerts.enabled" = false; # No alerts when passwords breached
    "signon.rememberSignons" = false; # No offer to save passwords
    "zen.welcome-screen.seen" = true;
		"browser.search.separatePrivateDefault" = false; # Use the same Search engine in private browsing
		"zen.view.window.scheme" = 0; # Dark mode
		"toolkit.legacyUserProfileCustomizations.stylesheets" = true; # Enabling Noctalia Color Scheme
	};

  extensions = [
    # To add additional extensions, find it on addons.mozilla.org, find
    # the short ID in the url (like https://addons.mozilla.org/en-US/firefox/addon/!SHORT_ID!/)
    # Then go to https://addons.mozilla.org/api/v5/addons/addon/!SHORT_ID!/ to get the guid
    (extension "ublock-origin" "uBlock0@raymondhill.net")
    (extension "bitwarden-password-manager" "{446900e4-71c2-419f-a6a7-df9c091e268b}")
    (extension "istilldontcareaboutcookies" "idcac-pub@guus.ninja")
    (extension "karakeep" "addon@karakeep.app")
  ];

in
{
  environment.systemPackages = [
    (pkgs.wrapFirefox inputs.zen-browser.packages.${systemSettings.system}.zen-browser-unwrapped {
      extraPrefs = lib.concatLines (
        lib.mapAttrsToList (
          name: value: "lockPref(${lib.strings.toJSON name}, ${lib.strings.toJSON value});"
        ) prefs
      );
      extraPolicies = {
        DisableTelemetry = true;
        ExtensionSettings = builtins.listToAttrs extensions;
        SearchEngines = {
          Default = "ddg";
          Add = [
            {
              Name = "nixpkgs packages";
              URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
              IconURL = "https://wiki.nixos.org/favicon.ico";
              Alias = "@np";
            }
            {
              Name = "NixOS options";
              URLTemplate = "https://search.nixos.org/options?query={searchTerms}";
              IconURL = "https://wiki.nixos.org/favicon.ico";
              Alias = "@no";
            }
            {
              Name = "NixOS Wiki";
              URLTemplate = "https://wiki.nixos.org/w/index.php?search={searchTerms}";
              IconURL = "https://wiki.nixos.org/favicon.ico";
              Alias = "@nw";
            }
          ];
        };
      };
    })
  ];
}
