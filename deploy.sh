#!/bin/sh

 doas nixos-rebuild switch --flake .#${HOST}
