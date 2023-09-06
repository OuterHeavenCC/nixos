{ pkgs, config, ... }: 

let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  programs.zsh.enable = true;

  users.users = {
    corentin = {
      isNormalUser = true;
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [ 
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDcfXCW+A4kFk6bMgPCRxflinAxPxOJYUIAXi040cK+hJJdz/TorlYBYiCOJ8LrG3uvxf5w2jhK81HX/E9DCybI+kyBJRm6cN64qAyvtpCrckLXubcFe2LkAcEc9+X1hdhniPsV5EHtBI4zeULjOVws1hx48zP0FPhpMcrRHtc6YOO+S01I7SmSisV1OwPkEoCx1f2hDdjws7cF2ZwBotuxc7jpBjAhvZx9+r5uXaDChZhaTjIiyxE4YIa58Ufd6fV2akQoyAnJUG0pkeRvAk+de396e5Rp0o3LejHo7iLL/rs5ihJv0YqJ1gNIdySg13vWPPB9QaaWI5VLfmYbZqG4CPr9sQsF27mEE8Red/5XDPDax61HVd2LvG32055PE45KmR+97TKnC94WE1d8PvtL6sP4QkgpB3kQ2/lv9lMpXHo3wrV+/IHf3vrJUWgA/VqGCvbE2LdHTQtdXAMmd0Ig9goeAplRJM2ce4sZYOBp162L+tYyIg1j1Kd2F77aB4U= corentin@archp" 
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCV2Yl+CWkG/trL/iBnnOSTp7HXBUId6ztXCzPEjkagWJH5lDD+ivRbiGblryquxzcurnIUorNq10oiYByf0Euc23c0IL904Z67o4yH/Jogg20xloPxDbvFw1Pj3TI1bY9CjotQBQ9AqSoOQ10qFa8feVFIdaCCL4zR73z6DyMLsRQ6qsJCQwDl6mIToEDp/kIqr2IVZ1UEqeN7sGX/8CehQSWxBJA7vF1hTMf5jx0dAWMIYj70TA2O0Ubb22MfTJoOYek9ZvAsgomaEAeqx+ms4cs1CGuQzdKRo7Ki8rPGE0UKcT0MufAtT2Sdu4wm+JigSUICZm8cUtYAuEJS7Xw57NQ+ZDCuM4DbSbtMpVNqU5SxxTTchXGZ0T6LvELZOJQBB/w8e5X0I6j5JaU6nppGql5PrX+XySnfWlJJwdcJ5b9+IuEhGkKyY+dEwDJBs4Mrc+9Et/hADQx3t9vwdzj9liROcgF4InPKT/juexdyzP39UWOMFhvq57K0q+JOR8U= u0_a679@localhost"
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCf9gm2fU4GpFwY4uWgI87Hqs+cja/jvOl4sPkP3LE1EfkD/G1Pgo3Cffn0Y7Mdqy243iVu8JFVY4t/c0JN4fFhda0nTHu6FC8ejvYjDaQNbtHMevVRLMizob1e1S5CptbqPRkRKIGg6DdE0CgoFImAh7Mb7OPuSQ01WT7k5ZrfXhkal4Q4GRWOGx+CojjYHTj8eZKSjMgci5S7Dj2A5IsD1qesM4GVhwUcoYp2azXSzurEW4l2YsCz++yQ2vc3cloi/a2a96wrodslVvgfYVry/0VW1uREA/mOsaHNf/PGdiOWl+5bTGvl9lTcB42+ITTtT+7bsfRbRbrlggbp/3jmGFylD/+MwZLwbLowrtV5rlPIDom9v2XzPlQYk90dfO3hKrdG/cSZnMA4aR2jSy/2xkP161xkOjxMBVcO/y81N3+NuQypjtmqha7w4HtbACl0gXQybwbsd36CuI5RASRDJVHt1eG7usT1eOS2vFxCMn5n+IkCx5hGIiK3cDDWJB8= corentin@arch" 
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuNunSAvazstNsDL652dYwIiBDVz0LvLVuMD7ld9yehChMWVCMuFXLp7ceARDe7+XT1b2MdA++SBavwgj6LRtRoXfh2oKxB2pNOdVNyfw5QbKRktcAqlQXJM3bSuCx9YHOX5yb6QyX3fEyOpFzUdQjRA394ie7ikh7pyjYMzw0NaBHGJv2+EhGVtndqwEdL93fw6JekvQfKML33bCdT+vr1pall7X2B4lgZSyfKbpQnWJgTs3EvrGUP9w5sxrO1RoxJv8CxcRuJTV9L9Ap02D9OHuAH1eTArFmGpz64UIy/JcCbvrv+cZJIbbOuDbFPtwLcViw+dyehop/nvgumjntXy/HUj2Cfe/SF74yN8/Y4mpvvp2YY52ijoEWsVYptStPeX0bRsFkzluOo2YcvmnXZDXsK44P13udN/wzQ6Ig1VyJ9YojaWYKJcgnjc+PTL1oPXbzcjglbA8n4GiqOJI2vvu14Nzdi6TEmChCs/Wa/16yqN6Pj5D5UAum3WEyumc= corentin@nixp"
      ];
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
      extraGroups = [ 
        "video" 
        "audio" 
      ] ++ ifTheyExist [
        "networkmanager"
        "network"
        "mpd"
        "seat"
        "git"
        "lp"
        "lpadmin"
        "libvirtd"
        "rfkill"
        "minecraft"
        "games"
        "wheel"
      ];
    };
  };
  home-manager.users.corentin = import ../../../../home/corentin/${config.networking.hostName}.nix;
}
