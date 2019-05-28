#!/bin/bash

# Для решения проблемы с отсутствием зука со втроенного микрофона


if ! cat /etc/pulse/default.pa |grep "load-module module-remap-source source_name=record_mono master="; then
   echo "### Resolve problem with microphone in lenovo notebook" | sudo tee -a /etc/pulse/default.pa 
   echo "load-module module-remap-source source_name=record_mono master=`pacmd list-sources | grep 'name:.*input' |  awk -F"<" '{print $2}' | awk -F">" '{print $1}'` master_channel_map=front-left channel_map=mono" | sudo tee -a /etc/pulse/default.pa
   echo "set-default-source record_mono" | sudo tee -a /etc/pulse/default.pa
fi

exit 0
