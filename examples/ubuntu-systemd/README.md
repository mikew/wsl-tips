# ubuntu-systemd

```sh
sudo apt update && sudo apt install -y fontconfig daemonize
sudo cp ./usr/local/bin/* /usr/local/bin/
sudo cp ./etc/sudoers.d/* /etc/sudoers.d/
sudo cp ./etc/profile.d/* /etc/profile.d/
```

Use `wsl-systemd-nsenter` to enter the systemd namespace. From here you'll be able to start and stop services, and interact with things like `snap`.

Commands like `wsl-systemd-nsenter snap run code` also work.

## Notes

When inside the systemd namespace, WSLs `.exe` integration seems to break,
and I'm sure other things do as well. For that reason, this shell doesn't run
`nsenter` automatically.
