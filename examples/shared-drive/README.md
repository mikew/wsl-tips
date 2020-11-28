# share-drive

To share a drive on WSL, you need:

- A WSL distribution dedicated to sharing (I chose Debian)
- Bind mount a folder from there to `/mnt/wsl`
- Make sure this distribution is running

## Installation

On the distribution that will do the sharing:

```sh
cp ./usr/local/bin/wsl-bind-mount /usr/local/bin/
sudo cp ./etc/sudoers.d/wsl-bind-mount /etc/sudoers.d/

# Call wsl-bind-mount when the distribution starts. This is an example.
echo "sudo /usr/local/bin/wsl-bind-mount" > ~/.bashrc
```

Then, on any distribution you want to mount this on, you can add this to your shells profile:

```sh
wsl.exe -d Debian -- bash -l -c ls
```