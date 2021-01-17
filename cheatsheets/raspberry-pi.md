
## Overclock

Watch your speed with one of these commands:
```bash
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq
vcgencmd measure_clock arm
watch -n 1 vcgencmd measure_clock arm
```

To edit the overclock setting:
```bash
sudo vi /boot/config.txt
```

```ini
# uncomment to overclock the arm. 700 MHz is the default.
over_voltage=6
arm_freq=2000
```

[Explanation of availabe settings](https://haydenjames.io/raspberry-pi-3-overclock/)