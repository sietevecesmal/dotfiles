# dotfiles

Bootstrap a new machine (macOS or Linux) and keep the ones I already have in sync.
Everything here is generic; anything personal or work-specific lives in a
[private overlay](#private-overlay) or in per-machine files.

## New machine

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/sietevecesmal/dotfiles/master/bootstrap.sh)" -- work
```

Use `personal` instead of `work` for the personal machine. To also clone the private overlay,
export `DOTFILES_PRIVATE_REPO=<git url>` first (it needs access, e.g. SSH keys already set up;
otherwise clone it later and run `dotfiles sync`).

This clones the repo to `~/.dotfiles` and runs `dotfiles install <profile>`, which:

1. saves the profile in `~/.dotfiles.local`
2. installs the Xcode Command Line Tools (macOS) or the base build packages (Linux)
3. installs Homebrew and the packages in the Brewfiles
4. installs oh-my-zsh and makes zsh the login shell
5. links everything in `home/` into `~` (`dotfiles link`)
6. installs the mise tools from `~/.config/mise/config.toml`
7. on macOS, applies `macos/defaults.sh` and the Dock layout

To rename the machine as part of the macOS defaults, add
`export DOTFILES_COMPUTER_NAME="..."` to `~/.dotfiles.local` first.

## Day to day

| Command | What it does |
|---|---|
| `dotfiles sync` | `git pull` both repos, relink, install anything missing from the Brewfiles and mise |
| `dotfiles doctor` | Show drift: links not in place, packages missing or installed but not listed |
| `dotfiles link` | Only relink (existing real files are moved to `~/.dotfiles-backup/`) |
| `dotfiles update` | Upgrade the OS, brew packages and mise tools |
| `dotfiles profile [name]` | Show or set this machine's profile |

To add a config file: move it into `home/` at the same path it has under `~`
(`~/.config/foo/bar` → `home/.config/foo/bar`) and run `dotfiles link`.
To add a package: add it to the right Brewfile, commit, and `dotfiles sync` on the other machines.
`dotfiles doctor` lists what's installed but missing from the Brewfiles.

## Layout

```
home/                 mirror of ~ — every file here is symlinked to the same path under ~
zsh/*.zsh             shell config for every machine
zsh/profiles/*.zsh    shell config for one profile
Brewfile              packages for every machine (formulae also install on Linux)
Brewfile.<profile>    extra packages for one profile (work, personal)
macos/                macOS defaults and Dock (skipped on Linux)
bin/                  the `dotfiles` command and small helpers, on PATH
bootstrap.sh          entry point for a new machine
```

## Private overlay

A second, private repo cloned to `~/.dotfiles-private` with the same layout. When it's
there, everything in it is used on top of this repo:

| Path | Used as |
|---|---|
| `home/` | linked into `~` like `home/` here (wins on the same path) |
| `gitconfig` | included from `~/.gitconfig` (put your `[user]` name and email here) |
| `zsh/*.zsh`, `zsh/profiles/<profile>.zsh` | sourced after the ones here |
| `Brewfile`, `Brewfile.<profile>` | installed after the ones here |

Use it for things that shouldn't be public: your identity, work hosts and helpers, internal
URLs. Real secrets (tokens, keys) belong in a password manager, not in either repo.

## Per-machine files (not in any repo)

| File | For |
|---|---|
| `~/.dotfiles.local` | `DOTFILES_PROFILE`, `DOTFILES_COMPUTER_NAME` |
| `~/.zshrc.local` | shell config only for this machine |
| `~/.gitconfig.local` | git config only for this machine |

## Forking

1. Fork, then change `DOTFILES_REPO` at the top of `bootstrap.sh` (and the URL above).
2. Edit the Brewfiles, `macos/dock.sh` and `macos/defaults.sh` to taste.
3. Put your git `[user]` in `~/.gitconfig.local` or in your own private overlay.
