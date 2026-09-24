# dotfiles

Personal Arch dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).
Interactive shell features come from [ble.sh](https://github.com/akinomyoga/ble.sh).

## Prerequisites

- A minimal Arch install (`base`, `linux`, `linux-firmware`) with a normal
  user account that can `sudo`. You should be at a TTY, not the live ISO.
- Network connectivity.

## 1. Install packages

```bash
sudo pacman -S --needed \
  git stow eza fastfetch bash-completion sudo nano make
```

- `git`, `stow` — for cloning and linking.
- `eza`, `fastfetch` — the tools whose configs we manage here.
- `bash-completion` — complements ble.sh; sourced from `.bashrc`.
- `sudo` — because you'll want it.
- `nano` — a text editor, in case nothing else is available.
- `make` — required to install ble.sh from source.

## 2. Configure git

```bash
git config --global user.name  "Your Name"
git config --global user.email "your.email@example.com"
```

## 3. Install ble.sh

```bash
git clone --recursive --depth 1 --shallow-submodules \
  https://github.com/akinomyoga/ble.sh.git ~/src/ble.sh
make -C ~/src/ble.sh install PREFIX=$HOME/.local
```

After this, `~/.local/share/blesh/ble.sh` must exist.

## 4. Clone this repo

```bash
git clone https://github.com/Abhinerd/dotfiles ~/dotfiles
```

## 5. Check the environment

```bash
cd ~/dotfiles
./check.sh
```

This prints a checklist of packages, git config, and ble.sh. It does not
modify anything. Fix any failures and re-run until it passes.

## 6. Install

```bash
./install.sh
```

This will **overwrite** any conflicting files under `$HOME` (for example a
default `.bashrc`) and stow the following packages:

- `bash`
- `blesh`
- `eza`
- `fastfetch`

## 7. Reload the shell

```bash
exec bash
```

## Notes

- System-level configuration (locale, timezone, hostname, font, services,
  bootloader, etc.) is not handled here. Do it yourself before or after.
- `~/.gitconfig` and `~/.ssh` are not tracked in this repo.
