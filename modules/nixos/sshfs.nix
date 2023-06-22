{ config, pkgs, ... }: 
{
  # SSHFS 
  services.openssh.allowSFTP = true;
}
