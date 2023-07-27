{ pkgs, config, lib, ... }:

{
  services.searx.enable = true;
  services.searx.package = pkgs.searxng;
  services.searx.runInUwsgi = true;
  services.searx.uwsgiConfig = let inherit (config.services.searx) settings; in {
    socket = "${lib.quoteListenAddr settings.server.bind_address}:${toString settings.server.port}";
  };
  services.searx.environmentFile = /var/lib/searx/searx.env;
  services.searx.settings = {
    use_default_settings = true;
    search = {
        safe_search = 0;
        autocomplete = "duckduckgo"; # dbpedia, duckduckgo, google, startpage, swisscows, qwant, wikipedia - leave blank to turn off
        default_lang = ""; # leave blank to detect from browser info or use codes from languages.py
    };

    server = {
      port = 8888;
      bind_address = "::1";
      secret_key = "@SEARX_SECRET_KEY@";
      base_url = "https://search.chaminand.com/";
      image_proxy = true;
      default_http_headers = {
        X-Content-Type-Options = "nosniff";
        X-XSS-Protection = "1; mode=block";
        X-Download-Options = "noopen";
        X-Robots-Tag = "noindex, nofollow";
        Referrer-Policy = "no-referrer";
      };
    };
    outgoing = {
      request_timeout = 5.0;       # default timeout in seconds, can be override by engine
      max_request_timeout = 15.0;  # the maximum timeout in seconds
      pool_connections = 100;      # Maximum number of allowable connections, or null
      pool_maxsize = 10;           # Number of allowable keep-alive connections, or null
      enable_http2 = true;         # See https://www.python-httpx.org/http2/
    };
  };
  # workaround for a bug, will probably get fixed upstream some day
  services.uwsgi.instance.vassals.searx.pythonPackages = lib.mkForce (self: [ pkgs.searxng self.pytomlpp ]);

}
