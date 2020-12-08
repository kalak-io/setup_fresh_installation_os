# Setup a fresh installation of Ubuntu

My script to reinstall my personal configuration

### Linux OS

```sh
sh -c "$(wget  https://raw.githubusercontent.com/kalak-io/setup_fresh_installation_os/master/setup.sh -O -)"
```

# Test scripts in container Docker

```sh
docker build -t ubuntu-image .
docker run -d --name test-container ubuntu-image sleep infinity
docker exec -it test-container bash
```

In shell container

```sh
sh -c "$(wget  https://raw.githubusercontent.com/kalak-io/setup_fresh_installation_os/master/setup.sh -O -)"
```

### Credits
# Dynamic wallpapers
[Dynamic Wallpaper Club](https://dynamicwallpaper.club/wallpaper/ma10m2ab50s)

# Inspiration
[Victoria Drake](https://victoria.dev/) - [Dotfiles](https://github.com/victoriadrake/dotfiles)
[Piotr Wittchen](https://wittchen.io/) - [Dotfiles](https://github.com/pwittchen/dotfiles)
