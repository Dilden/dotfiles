#!/bin/bash
pactl set-source-mute @DEFAULT_SOURCE@ toggle
notify-send "Microphone" "Mic input toggled"
