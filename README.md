# Neovim Minimalist Config

<!-- ![Neovim Preview](./doc/screenshot-init-vim.PNG) -->

### ⚡ About

This is my personal config and adapted to my needs, but it can be easily adapted to any config, as well as separate vim files

This will be adapted for **Windows** and **Linux** systems
And they will correct things in the future

### 🌱 Contribute

You can contribute by making a **pull request** with any _fix_ or _feature_ that you want to add :D

If you don't have an idea, you can follow these steps:

- Fork the project (optional in case you have a permission error)
  Or clone it on your local machine

- Create a new branch with:

  ```bash
  $ git checkout -b <new branch>
  ```

- When you have all the changes you have:

  ```bash
  $ git add .
  ```

  ```bash
  $ git commit -m "a description"
  ```

  ```bash
  $ git push origin <new branch>
  ```

And do a **pull request** to the **main** branch

### 📦 Requirements

- [**Packer Nvim**](https://github.com/wbthomason/packer.nvim)

- [**Git**](https://git-scm.com/)

- [**Neovim**](https://neovim.io/) C:

- [**Lua**](https://koenwoortman.com/lua-install-on-ubuntu/)

- It's recommended have installed [**Rust**](https://stackoverflow.com/questions/67656028/rustup-gives-command-not-found-error-with-zsh-even-after-installing-with-brew)

- Recommended install [**Ruby**](https://phoenixnap.com/kb/install-ruby-ubuntu)

## Important

For a good operation of this configuration and to take **advantage of all** the Plugins, we recommend you to use v5 or higher that adds many improvements and support for many things

More information below:

- [Official Documentation](https://github.com/neovim/neovim/wiki/Installing-Neovim)

- [Releases](https://github.com/neovim/neovim/releases)

## Usage

When cloning the repository, in case the folder is named _neovim-dotfiles_, change the name to **nvim** so that Neovim recognizes it

### 📚  Install Neovim:

For **Windows** run one of the two commands within **powershell**, you can use **choco** or **scoop**

```bash
$ scoop install neovim

# Or

$ choco install neovim -y
```

And for **Linux** and **MacOs** : [neovim/wiki/Installing-Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)

or see this custom gist, on how to install Neovim on different Linux distributions:
- [gist.github.com/mrLuisFer/install-neovim](https://gist.github.com/mrLuisFer/19b8bc00d7e1295a1a7453a010b5d623)

Also you need install python neovim support.

```bash
$ sudo apt-get install python3-neovim

$ pip install pynvim
```

## 🌙 Install Manager:

In this config use **packer** to handle and install plugins.

To install **Packer.nvim** you can run any of these commands

Linux, Unix

```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
If you use Arch Linux, there is also an [AUR package.](https://aur.archlinux.org/packages/nvim-packer-git/)

Windows (Powershell)

```bash
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

More information about packer:
- [Documentation](https://github.com/wbthomason/packer.nvim)
- [Tips and Tricks](https://github.com/wbthomason/packer.nvim/wiki/Tips-and-Tricks)
- [Requirements](https://github.com/wbthomason/packer.nvim#requirements)

### 📘 Setup Windows:

```
$ cd %APPDATA\Local\nvim
```

If you don't have **the nvim folder** do this: (if you have it, ignore this step)

```bash
$ mkdir nvim

$ cd nvim
```

If you want to test another branch, change `main` to to the name of the branch you want to test

But the main branch is so to speak the stable version

```bash
$ git clone -b main https://github.com/mrLuisFer/neovim-minimalist-config.git .
```

If you have an error like `'C' compiler not found`:

Open a terminal as a Admin and run:
```
$ choco install zig
```

### 🐧 Setup Linux:

```bash
$ mkdir -p $HOME/.config/nvim

$ cd $HOME/.config/nvim

$ git clone -b main https://github.com/mrLuisFer/neovim-minimalist-config.git .
```

### 🍎 Setup MacOs:

Almost the same as Linux

### 🌈 Colorschemes

If you do not like the color that comes by default, you can execute the command inside **neovim:** `:colorscheme + TAB` and you will see a list of themes that you can select

When you find one you like, go to `init.vim` and search with _neovim_ `/colorscheme` and write down the name of the **theme** you want to use.

## 📦 LSP Config
[What's LSP?](https://microsoft.github.io/language-server-protocol/)

[In this configuration use lspconfig](https://github.com/neovim/nvim-lspconfig)
And **Lsp-Installer** for install lsp languages -> [williamboman/nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)

Or `:LspInfo` for see the languages you have setup 

## ⚠ Warning

It may be that when you enter the cloned configuration in nvim for the first time, you will get multiple errors

But don't worry just press `Enter` or `q` and run this command **:PackerInstall**
Several plugins will be downloaded, then **exit and enter neovim again**

## 🐊 CoC

This setup uses [**CoC**](https://github.com/neoclide/coc.nvim) to complete and intellisense
It's also recommended to install the following tools.

- [Stylua](https://github.com/JohnnyMorganz/StyLua)

- [Steep for Ruby support](https://github.com/soutaro/steep)

- [Lua LSP](https://github.com/Alloyed/lua-lsp) 
  
 - [If you have an error with Lua and tools](https://stackoverflow.com/questions/20079572/srlua-makefile-error-lua-h-no-such-file-or-directory)

## 📔 Vim Dashboard

If you want neovim to show you a dashboard screen similar to this one, you need certain things

The most important is that you need [Neovim 0.5 or higher](https://github.com/neovim/neovim/wiki/Installing-Neovim)

You also need **[Ripgrep](https://github.com/BurntSushi/ripgrep)**, this is for the operation of search engines for files, words, history, etc.

- [BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)

You also need to have **[FZF](https://github.com/junegunn/fzf)** installed, this is already included in the configuration but if it shows you an error you can read the documentation

- [junegunn/fzf](https://github.com/junegunn/fzfv)

An alternative that you can use is **[Vim Clap](https://github.com/liuchengxu/vim-clap/)**, it also comes inside the config but you can check its documentation

- [glepnir/dashboard-nvim](https://github.com/glepnir/dashboard-nvim)

## ⚙  RipGrep

To **install RipGrep** on your pc you can use one of the following commands

If you're a **macOS Homebrew** or a **Linuxbrew** user, then you can install
ripgrep from homebrew-core:

### 🍎 MacOs

```bash
$ brew install ripgrep
```

If you're a **MacPorts** user, then you can install ripgrep from the
[official ports](https://www.macports.org/ports.php?by=name&substr=ripgrep):

```bash
$ sudo port install ripgrep
```

### 📘 Windows

If you're a **Windows Chocolatey** user, then you can install ripgrep from the
[official repo](https://chocolatey.org/packages/ripgrep):

```bash
$ choco install ripgrep
```

If you're a **Windows Scoop** user, then you can install ripgrep from the
[official bucket](https://github.com/ScoopInstaller/Main/blob/master/bucket/ripgrep.json):

```bash
$ scoop install ripgrep
```

### 🐧 Linux

If you're an **Arch Linux** user, then you can install ripgrep from the official repos:

```bash
$ pacman -S ripgrep
```

If you're a **Gentoo** user, you can install ripgrep from the
[official repo](https://packages.gentoo.org/packages/sys-apps/ripgrep):

```bash
$ emerge sys-apps/ripgrep
```

If you're a **Fedora** user, you can install ripgrep from official
repositories.

```bash
$ sudo dnf install ripgrep
```

If you're an **openSUSE** user, ripgrep is included in **openSUSE Tumbleweed**
and **openSUSE Leap** since 15.1.

```bash
$ sudo zypper install ripgrep
```

If you're a **RHEL/CentOS 7/8** user, you can install ripgrep from
[copr](https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/):

```bash
$ sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
$ sudo yum install ripgrep
```

If you're a **Nix** user, you can install ripgrep from
[nixpkgs](https://github.com/NixOS/nixpkgs/blob/master/pkgs/tools/text/ripgrep/default.nix):

```bash
$ nix-env --install ripgrep
$ # (Or using the attribute name, which is also ripgrep.)
```

If you're a **Debian** user (or a user of a Debian derivative like **Ubuntu**),
then ripgrep can be installed using a binary `.deb` file provided in each
[ripgrep release](https://github.com/BurntSushi/ripgrep/releases).

```bash
$ curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb
$ sudo dpkg -i ripgrep_12.1.1_amd64.deb
```

If you run Debian Buster (currently Debian stable) or Debian sid, ripgrep is
[officially maintained by Debian](https://tracker.debian.org/pkg/rust-ripgrep).

```bash
$ sudo apt-get install ripgrep
```

If you're an **Ubuntu Cosmic (18.10)** (or newer) user, ripgrep is
[available](https://launchpad.net/ubuntu/+source/rust-ripgrep) using the same
packaging as Debian:

```bash
$ sudo apt-get install ripgrep
```

If you're a **FreeBSD** user, then you can install ripgrep from the
[official ports](https://www.freshports.org/textproc/ripgrep/):

```bash
# pkg install ripgrep
```

If you're an **OpenBSD** user, then you can install ripgrep from the
[official ports](https://openports.se/textproc/ripgrep):

```bash
$ doas pkg_add ripgrep
```

If you're a **NetBSD** user, then you can install ripgrep from
[pkgsrc](https://pkgsrc.se/textproc/ripgrep):

```bash
# pkgin install ripgrep
```

If you're a **Haiku x86_64** user, then you can install ripgrep from the
[official ports](https://github.com/haikuports/haikuports/tree/master/sys-apps/ripgrep):

```bash
$ pkgman install ripgrep
```

If you're a **Haiku x86_gcc2** user, then you can install ripgrep from the
same port as Haiku x86_64 using the x86 secondary architecture build:

```bash
$ pkgman install ripgrep_x86
```

If you're a 🦀 **Rust programmer**, ripgrep can be installed with `cargo`.

- Note that the minimum supported version of Rust for ripgrep is **1.34.0**,
  although ripgrep may work with older versions.
- Note that the binary may be bigger than expected because it contains debug
  symbols. This is intentional. To remove debug symbols and therefore reduce
  the file size, run `strip` on the binary.

```bash
$ cargo install ripgrep
```

# Shortcuts

# Contact Me

Made with 💙 [by mrLuisFer](https://mrluisfer-linktry.netlify.app/)
