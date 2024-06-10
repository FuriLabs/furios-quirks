#!/bin/bash

if [ ! -e "${USER}/.local/share/keyrings" ]; then
	echo -n 1234 | gnome-keyring-daemon --unlock
fi

touch "${HOME}/.config/keyring-setup-done"
