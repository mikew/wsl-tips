# ubuntu-systemd

Change `WSL_SYSTEMD_SHELL` and `WSL_SYSTEMD_USER` in `usr/local/bin/wsl-systemd-env`.

```sh
sudo apt update && sudo apt install -y fontconfig daemonize
sudo cp ./usr/local/bin/* /usr/local/bin/
sudo cp ./etc/sudoers.d/* /etc/sudoers.d/
```

Change your users shell to `/usr/local/bin/wsl-systemd-shell`