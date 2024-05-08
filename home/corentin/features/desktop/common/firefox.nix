{ pkgs, inputs, ... }:

let
  addons = inputs.firefox-addons.packages.${pkgs.system};
in
{
  home.sessionVariables.BROWSER = "firefox";

  programs.firefox = {
    enable = true;
    profiles."0.default" = {
      settings = {

        "privacy.trackingprotection.enabled" = true;
        "browser.aboutConfig.showWarning" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;

        # Telemetry
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.server" = "data:,";
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.updatePing.enable" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.coverage.opt-out" = true;
        "toolkit.coverage.endpoint.base" = "";
        "browser.ping-centre.telemetry" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "app.shield.optoutstudies.enabled" = false;
        "app.normandy.enabled" = false;
        "app.normandy.api_url" = "";

        # Crash Reports
        "breakpad.reportURL" = "";
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;

        # Hardware acceleration
        "media.ffmpeg.vaapi.enabled" = true;

        extensions = with addons; [
          ublock-origin
          sponsorblock
          vimium
          stylus
          browserpass
        ];
      };
      id = 0;
      isDefault = true;
      name = "0";
    };
  };

  programs.browserpass = {
    enable = true;
    browsers = [ "firefox" ];
  };
}
