alsactl --file ~/.config/alsa_settings restore
pactl set-sink-volume alsa_output.pci-0000_07_00.0.analog-stereo.7 1%
pactl set-sink-port alsa_output.pci-0000_07_00.0.analog-stereo.7 "analog-output;output-headphones-1"
pactl set-sink-mute alsa_output.pci-0000_07_00.0.analog-stereo.7 0
pactl set-sink-volume alsa_output.pci-0000_07_00.0.analog-stereo.7 ${1}%
pactl set-source-volume alsa_input.pci-0000_00_1b.0.analog-stereo.7 100%
