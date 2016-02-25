pactl set-sink-port alsa_output.pci-0000_07_00.0.analog-stereo "analog-output;output-headphones-1"
pactl set-sink-volume alsa_output.pci-0000_07_00.0.analog-stereo ${1}%
pactl set-sink-mute alsa_output.pci-0000_07_00.0.analog-stereo 0
