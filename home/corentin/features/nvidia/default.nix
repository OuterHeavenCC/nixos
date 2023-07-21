{
  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = 1;
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
  };

  wayland.windowManager.hyprland = {
    enableNvidiaPatches = true;
  };

}
