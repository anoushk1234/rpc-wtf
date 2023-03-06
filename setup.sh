#!/bin/sh

sudo touch solana-validator.log  

sudo bash -c 'cat >> /etc/sysctl.conf <<- EOF
# set minimum, default, and maximum tcp buffer sizes (10k, 87.38k (linux default), 12M resp)
net.ipv4.tcp_rmem=10240 87380 12582912
net.ipv4.tcp_wmem=10240 87380 12582912
# Enable TCP westwood for kernels greater than or equal to 2.6.13
net.ipv4.tcp_congestion_control=westwood
net.ipv4.tcp_fastopen=3
net.ipv4.tcp_timestamps=0
net.ipv4.tcp_sack=1
net.ipv4.tcp_low_latency=1
# Enable fast recycling TIME-WAIT sockets
# net.ipv4.tcp_tw_recycle = 1 this is in solana tuner, but fails, changing to below, see - https://djangocas.dev/blog/troubleshooting-tcp_tw_recycle-no-such-file-or-directory/
net.ipv4.tcp_tw_reuse = 1
# dont cache ssthresh from previous connection
net.ipv4.tcp_no_metrics_save = 1
net.ipv4.tcp_moderate_rcvbuf = 1
# kernel Tunes
kernel.timer_migration=0
kernel.hung_task_timeout_secs=30
# A suggested value for pid_max is 1024 * <# of cpu cores/threads in system>
kernel.pid_max=49152
# vm.tuning
vm.swappiness=30
vm.max_map_count=2000000
vm.stat_interval=10
vm.dirty_ratio=40
vm.dirty_background_ratio=10
vm.min_free_kbytes = 3000000
vm.dirty_expire_centisecs=36000
vm.dirty_writeback_centisecs=3000
vm.dirtytime_expire_seconds=43200
# solana systuner
net.core.rmem_max=134217728
net.core.rmem_default=134217728
net.core.wmem_max=134217728
net.core.wmem_default=134217728
EOF'

sudo sysctl -p

sudo mkdir /mnt/accounts
sudo mkdir /mnt/ledger
sudo mkdir /mnt/snapshots

sudo mount -o size=160G -t tmpfs none /mnt/accounts # incase it overflows just move it to a non ramdisk in /mnt(anyway with pcie nvme ssd u dont benefit much from ramdisk)
sudo mount -o size=80G -t tmpfs none /mnt/snapshots
sudo mount -o size=80G -t tmpfs none /mnt/ledger

sudo ls -la /mnt


