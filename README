# Dotfiles

This is a guide on how to recreate my local development environment.

## Prerequisites

### Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Iterm2
```
brew install iterm2
```

### ASDF
```
brew install asdf
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 19.8.1
asdf global nodejs 19.8.1
```

### ZSH
```
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Note: Make sure to install the Nerd font's when configuring Powerlevel10k.

Once installed, use the `coolnight` color scheme in iTerm 2.

### Neovim
As of writing this Neovim 0.9 has been released, but many plugins are not stable (including Treesitter and LSP config). For now, here are instructions to install 0.8.3.

```
cd ~
curl -LO https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-macos.tar.gz
xattr -c ./nvim-macos.tar.gz
tar xzvf nvim-macos.tar.gz
sudo ln -s ~/nvim-macos/bin/nvim /usr/local/bin/nvim
```
