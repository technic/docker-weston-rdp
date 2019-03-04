#!/bin/bash
export XDG_RUNTIME_DIR="/run/user/developer"
export QT_QPA_PLATFORM=wayland-egl
export GDK_BACKEND=wayland
export CLUTTER_BACKEND=wayland
export SDL_VIDEODRIVER=wayland
export $(dbus-launch)
winpr-makecert -rdp secret
exec weston --backend=rdp-backend.so --rdp4-key=secret.key --width=1920 --height=1080