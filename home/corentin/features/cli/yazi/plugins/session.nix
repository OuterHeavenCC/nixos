{
  xdg.configFile."yazi/plugins/session.yazi/init.lua" = {
    text = ''
      require("session"):setup {
        sync_yanked = true,
      }
    '';
  };
}
