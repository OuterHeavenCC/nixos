{
  programs.newsboat = {
    enable = true;
    autoReload = true;
    urls = [

      {
        title = "Mediapart";
        tags = [ "news" ];
        url = "https://www.mediapart.fr/articles/feed";
      }
      {
        title = "Le Telegramme";
        tags = [ "news" ];
        url = "https://www.letelegramme.fr/rss.xml";
      }
      {
        title = "Stronger By Science";
        tags = [
          "sciences"
          "sport"
        ];
        url = "https://strongerbyscience.com/articles/feed";
      }
      {
        title = "Revolution Permanente";
        tags = [ "politique" "news" ];
        url = "https://www.revolutionpermanente.fr/spip.php?page=backend_portada";
      }
      {
        title = "Science étonnante";
        tags = [
          "sciences"
          "tech"
        ];
        url = "https://scienceetonnante.com/feed/";
      }
      {
        title = "The Linux Experiment";
        tags = [ "tech" ];
        url = "https://thelinuxexp.com/feed.xml";
      }
      {
        title = "La Quadrature du Net";
        tags = [
          "tech"
          "news"
        ];
        url = "https://www.laquadrature.net/feed/";
      }
      {
        title = "Gestion de la douleur en thérapie manuelle";
        tags = [
          "sciences"
          "travail"
        ];
        url = "https://gestiondeladouleurenthrapiemanuelle.wordpress.com/rss";
      }
    ];

    extraConfig = ''
      bind-key j down
      bind-key k up
      bind-key j next articlelist
      bind-key k prev articlelist
      bind-key J next-feed articlelist
      bind-key K prev-feed articlelist
      bind-key G end
      bind-key g home
      bind-key d pagedown
      bind-key u pageup
      bind-key l open
      bind-key h quit
      bind-key a toggle-article-read
      bind-key n next-unread
      bind-key N prev-unread
      bind-key D pb-download
      bind-key U show-urls
      bind-key x pb-delete

      color listnormal         color15 default
      color listnormal_unread  color2  default
      color listfocus_unread   color2  color0
      color listfocus          default color0
      color background         default default
      color article            default default
      color end-of-text-marker color8  default
      color info               color4  color8
      color hint-separator     default color8
      color hint-description   default color8
      color title              color14 color8

      highlight article "^(Feed|Title|Author|Link|Date): .+" color4 default bold
      highlight article "^(Feed|Title|Author|Link|Date):" color14 default bold

      highlight article "\\((link|image|video)\\)" color8 default
      highlight article "https?://[^ ]+" color4 default
      highlight article "\[[0-9]+\]" color6 default bold
    '';
  };
}
