# Dotfiles
Here are my dotfiles. To get everything set up, follow the instructions below to install dependencies for each type of
software. Run the install script with `./install.sh` to symlink all the config files.

## Dependencies

### Fonts
Download [FiraCode](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode) or other nerd font from GitHub to get ligatures, devicons, and powerline symbols.

### Languages
#### Python
Download the latest [Miniconda](https://docs.conda.io/en/latest/miniconda.html) and run the install script:
```
./Miniconda3-latest-Linux-x86_64.sh
```

#### Lua
[Lua](lua.org)

Check the latest available version and then install:
```
apt-cache policy luaXX.YY
sudo apt install luaXX.YY
```
You can also build the [latest version](https://www.lua.org/download.html) from source:
```
curl -R -O http://www.lua.org/ftp/lua-XX.YY.ZZ.tar.gz
tar zxf lua-XX.YY.ZZ.tar.gz
cd lua-XX.YY.ZZ
make all test
```

[LuaJIT](https://luajit.org)

First, make sure libc6-dev is installed.
Then, clone the GitHub repository:
```
git clone https://github.com/LuaJIT/LuaJIT.git
```

Or [download](https://luajit.org/download.html) the latest source package and unzip it:
```
tar zxf LuaJIT-XX.YY.ZZ.tar.gz
```

Build and install:
```
make
sudo make install
```

Symlink so you can run from the command line with `luajit`:
```
sudo ln -sf luajit-XX.YY.ZZ-betaW /usr/local/bin/luajit
```

### Shells
[Zsh](https://www.zsh.org/)
```
sudo apt install zsh
```

[OhMyZsh](https://ohmyz.sh/#install)
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

[Fish](https://fishshell.com/)
```
sudo apt install fish
```

[OhMyFish](https://github.com/oh-my-fish/oh-my-fish)
```
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

[z.lua](https://github.com/skywind3000/z.lua)
```
git clone --depth 1 https://github.com/skywind3000/z.lua.git
```

[fzf](https://github.com/junegunn/fzf)

Clone the repository and install:
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```
To update:
```
cd ~/.fzf && git pull && ./install
```

### Vim
[VimPlug](https://github.com/junegunn/vim-plug)
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Then run `:PlugInstall` in Vim to install packages.

### Neovim
To get the latest version of [Neovim](https://github.com/neovim/neovim), add the stable or unstable ppa. Only one version can be installed at a time.

To use the latest stable verion:
```
sudo add-apt-repository ppa:neovim-ppa/stable
```

To use the latest unstable version:
```
sudo add-apt-repository ppa:neovim-ppa/unstable
```

Then, update and install:
```
sudo apt update
sudo apt install neovim
```

You can also [build](https://github.com/neovim/neovim/wiki/Building-Neovim) it from source. First, install the [build prerequisites](https://github.com/neovim/neovim/wiki/Building-Neovim#build-prerequisites):
```
sudo apt install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
```
Then, clone the repository:
```
git clone https://github.com/neovim/neovim
```
Build and install:
```
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

[Packer](https://github.com/wbthomason/packer.nvim)
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
Then run `:PackerInstall` in Neovim to install packages.

#### Python
Install pynvim package into a python version on the PATH.
```
pip install pynvim
```

#### Language servers
[Here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md) are the configurations for servers with nvim-lspconfig.

[clangd](https://clangd.llvm.org/installation.html)
```
sudo apt install clangd-12
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100
```

[hls](https://www.haskell.org/ghcup/install/) (via ghcup)
```
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```
Then use `ghcup tui` to manage compiler and lsp versions.

[pylsp](https://github.com/python-lsp/python-lsp-server)
```
pip install "python-lsp-server[all]"
pip install mypy pylsp-mypy
```

[sumneko_lua](https://github.com/sumneko/lua-language-server)

Download the latest [release](https://github.com/sumneko/lua-language-server/releases) from GitHub and extract the
project. The name of the directory should be added to the PATH in order for it to connect to Neovim.
```
tar -xzf lua-language-server-XX.YY.ZZ-linux-x64.tar.gz -C lua-language-server
```

#### Debug adapters
[Here](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation) is the information for downloading and
configuring debuggers for neovim.

[debugpy](https://github.com/microsoft/debugpy)
```
pip install debugpy
```

#### Telescope
[ripgrep](https://github.com/BurntSushi/ripgrep)
```
sudo apt install ripgrep
```

[fd](https://github.com/sharkdp/fd)
```
sudo apt install fd-find
```

#### VimTeX
Install zathura and latexmk:
```
sudo apt install zathura
sudo apt install latexmk
```

### Git
To get the latest stable upstream version of [Git](https://git-scm.com/download/linux) on Ubuntu, add the ppa and then update and install:
```
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git
```

### Tmux
[tpm](https://github.com/tmux-plugins/tpm)

Clone the repository:
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
If tmux is running, source the tmux config from the terminal with `tmux source ~/.tmux.conf` or within a tmux session by pressing `prefix` + <kbd>:</kbd> then `source ~/.tmux.conf`. Then, fetch plugins with `prefix` + <kbd>I</kbd>.
