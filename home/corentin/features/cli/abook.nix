{
  programs.abook = {
    enable = true;
    extraConfig =
      ''
      set add_email_prevent_duplicates=true
      set autosave=true
      set index_format=" {name:50} {email:40} {mobile:20} {groups:30}"
      ''
      ;
  };
}
