{
  # Keyd
  services.keyd = {
    enable = true;
    settings = { main = { capslock = "overload(meta, esc)"; }; };
  };
}
