alsactl --file ~/.config/alsa_settings restore
pactl set-sink-port alsa_output.pci-0000_07_00.0.analog-stereo "analog-output;output-speaker"
pactl set-sink-mute alsa_output.pci-0000_07_00.0.analog-stereo 0
pactl set-sink-volume alsa_output.pci-0000_07_00.0.analog-stereo 100%
pactl set-source-volume alsa_input.pci-0000_00_1b.0.analog-stereo 100%
