# Instructions

## Build the Dockerfile 

Open a shell, navigate to the folder that contains the `Dockerfile` and run the following command: `docker build -t container-explorer .`

The result should look like the following.

## Mount the evidence image

First, check the file system of the exported image.

```bash
fdisk -l /mnt/i/Kubernetes_DeployCraftedContainer/StartDownload/kubernetes-worker-1_StartDownload.20.raw
```
```text
Disk /mnt/i/Kubernetes_DeployCraftedContainer/StartDownload/kubernetes-worker-1_StartDownload.20.raw: 128 GiB, 137438953472 bytes, 268435456 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x3b09fe96

Device                                                                                           Boot   Start       End   Sectors   Size Id Type
/mnt/i/Kubernetes_DeployCraftedContainer/StartDownload/kubernetes-worker-1_StartDownload.20.raw1 *       2048    999423    997376   487M 83 Linux
/mnt/i/Kubernetes_DeployCraftedContainer/StartDownload/kubernetes-worker-1_StartDownload.20.raw2       999424   4999167   3999744   1.9G 82 Linux swap / Solaris
/mnt/i/Kubernetes_DeployCraftedContainer/StartDownload/kubernetes-worker-1_StartDownload.20.raw3      4999168 268433407 263434240 125.6G 83 Linux
```

The partition of interest is the last one. To calculate the `offset`, multiply the `Sector Size` with the `Start` sector.


`512 * 4999168 = 2559574016`


Now mount the image.

```bash
# create a mount point
sudo mkdir /mnt/investigation

# now mount the partition (other mount option parameters might be applied, but readonly should be used!)
sudo mount -t auto -o ro,loop,norecovery,offset=2559574016 /mnt/i/Kubernetes_DeployCraftedContainer/StartDownload/kubernetes-worker-1_StartDownload.20.raw /mnt/investigation/

# verify (test)
ls -la /mnt/investigation/

total 88
drwxr-xr-x  19 root root  4096 Aug 20 21:44 .
drwxr-xr-x  11 root root  4096 Nov 14 02:16 ..
lrwxrwxrwx   1 root root     7 Aug 20 21:13 bin -> usr/bin
drwxr-xr-x   2 root root  4096 Aug 20 21:13 boot
drwxr-xr-x   4 root root  4096 Aug 20 21:13 dev
drwxr-xr-x 103 root root  4096 Nov 12 01:23 etc
drwxr-xr-x   3 root root  4096 Aug 20 21:20 home
lrwxrwxrwx   1 root root     7 Aug 20 21:13 lib -> usr/lib
lrwxrwxrwx   1 root root     9 Aug 20 21:13 lib32 -> usr/lib32
lrwxrwxrwx   1 root root     9 Aug 20 21:13 lib64 -> usr/lib64
lrwxrwxrwx   1 root root    10 Aug 20 21:13 libx32 -> usr/libx32
drwx------   2 root root 16384 Aug 20 21:13 lost+found
drwxr-xr-x   3 root root  4096 Aug 20 21:13 media
drwxr-xr-x   2 root root  4096 Jul 31  2020 mnt
drwxr-xr-x   4 root root  4096 Nov 12 01:23 opt
drwxr-xr-x   2 root root  4096 Apr 15  2020 proc
drwx------   3 root root  4096 Aug 20 21:31 root
drwxr-xr-x   2 root root  4096 Aug 20 21:21 run
lrwxrwxrwx   1 root root     8 Aug 20 21:13 sbin -> usr/sbin
drwxr-xr-x   2 root root  4096 Aug 20 21:21 snap
drwxr-xr-x   2 root root  4096 Jul 31  2020 srv
drwxr-xr-x   2 root root  4096 Apr 15  2020 sys
drwxrwxrwt  12 root root  4096 Nov 12 11:32 tmp
drwxr-xr-x  15 root root  4096 Aug 20 21:26 usr
drwxr-xr-x  13 root root  4096 Aug 20 21:17 var
```

## Use the tool

To use the previously built tool now for investigation purposes, run the image with docker and provide the mount-path:

`docker run --rm -ti -v /mnt/investigation:/tmp/investigation container-explorer`

You should be able to list the directory mounted into the container: 

`ls -la /tmp/investigation/`

If successfull, the tool should be usable now. The following command tries to list containers: 

`container-explorer --image-root /tmp/investigation/ list containers`
