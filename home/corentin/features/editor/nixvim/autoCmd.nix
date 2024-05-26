{
  programs.nixvim = {
    autoGroups.yankhighlight.clear = true;
    autoCmd = [
    {
      event = [ "TextYankPost" ];
      pattern = [ "*" ];
      group = "yankhighlight";
      callback = {__raw = "function() vim.highlight.on_yank \{ higroup = \"Search\", timeout = 100\} end";};
      desc = "Highlight text on yank";
    }
    ];
  };
}
