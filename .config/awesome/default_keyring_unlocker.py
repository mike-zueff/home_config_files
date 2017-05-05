#!/usr/bin/env python2

import gnomekeyring, os, time

time.sleep(10)
gnomekeyring.unlock_sync(None, open("default_keyring_password").read()[:-1])

os.system("notify-send --icon=/usr/share/icons/Tango/scalable/apps/utilities-" \
    "terminal.svg Keyring 'Default keyring has been unlocked.'")
