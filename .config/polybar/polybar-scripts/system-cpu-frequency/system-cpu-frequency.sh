#!/bin/sh

t=0
for ((k=0; k<16; k++)); do
    freq_file="/sys/devices/system/cpu/cpu$k/cpufreq/scaling_cur_freq"
    if [ -f "$freq_file" ]; then
        # Read the frequency value from the file
        i=$(awk '{printf "%.0f\n", $1/1000}' "$freq_file")
        if [ -n "$i" ]; then
            t=$( echo "$t + $i" | bc )
        fi
    fi
done

if [ "$t" -eq 0 ]; then
    echo "No CPU frequency values found in any of the files."
    exit 1
fi

echo "scale=2; $t / 16 / 1000" | bc | awk '{print $1"GHz"}'
