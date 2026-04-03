
Debian
====================
This directory contains files used to package bitcoinbased/bitcoinbase-qt
for Debian-based Linux systems. If you compile bitcoinbased/bitcoinbase-qt yourself, there are some useful files here.

## bcb: URI support ##


bitcoinbase-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install bitcoinbase-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your bitcoinbase-qt binary to `/usr/bin`
and the `../../share/pixmaps/dash128.png` to `/usr/share/pixmaps`

bitcoinbase-qt.protocol (KDE)

