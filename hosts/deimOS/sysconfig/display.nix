{
  services.xserver = {
    enable = true;
    layout = "fr";
    displayManager.lightdm.enable = false;
    libinput.touchpad = {
      middleEmulation = true;
      tapping = true;
      disableWhileTyping = true;
    };
  };
  hardware = {
    opengl.enable = true;
  };
}
