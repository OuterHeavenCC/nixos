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

      "geo.provider.use_geoclue" = false;
      "intl.accept_languages" = "en-US, en";
      "javascript.use_us_english_locale" = true;
      
      "extensions.getAddons.showPane" = false;
      "extensions.htmlaboutaddons.recommandations.enabled" = false;
      "browser.discovery.enabled" = false;


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

      # Other 
      "captivedetect.canonicalURL" = false;
      "network.captive-portal-service.enabled" = false;
      "network.connectivity-service.enabled" = false;

      # Safe browsing
      "browser.safebrowsing.downloads.remote.enabled" = false;

      # Block implicit outbound
      "network.prefetch-next" = false;
      "network.dns.disablePrefetch" = true;
      "network.predictor.enabled" = false;
      "network.predictor.enable-prefetch" = false;
      "network.http.speculative-parallel-limit" = "0";
      "browser.places.speculativeConnect.enabled" = false;


      # DNS / DoH / PROXY / SOCKS / IPv6
      "network.dns.disableIPv6" = true;
      "network.proxy.socks_remote_dns" = true;
      "network.file.disable_unc_paths" = true;
      "network.gio.supported-protocols" = "";

    extensions = 
    with addons; [
      ublock-origin
      sponsorblock
      vimium
      stylus
      browserpass
    ];};
      id = 0;
      isDefault = true;
      name = "0";
    };

  };

  programs.browserpass = {
    enable = true;
    browsers = [
      "firefox"
    ];
  };

}
