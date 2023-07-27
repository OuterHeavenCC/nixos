{ config, ... }:

let
  cfg = config.xdg;
in
{
  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = 1;
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    CUDA_CACHE_PATH = "${cfg.cacheHome}/nv";
  };

  wayland.windowManager.hyprland = {
    enableNvidiaPatches = true;
  };


}
