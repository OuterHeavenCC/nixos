{
  programs.nixvim.keymaps = [
    {
        key = "<";
        mode = "v";
        action = "<gv";
    }
    {
      key = ">";
      mode = "v";
      action = ">gv";
    }
  ];
}
