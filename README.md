# oh-my-zsh-custom
> My **.oh-my-zsh/custom** settings!


## Installation and setup

:boom: **Install oh-my-zsh**
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

:octocat: **Clone custom settings**
```bash
# Delete existing custom folder
rm -rf ~/.oh-my-zsh/custom

# Clone this custom folder
git clone git@github.com:joelchelliah/oh-my-zsh-custom.git ~/.oh-my-zsh/custom
```

:muscle: **Install powerlevel9k theme**
```bash
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```
Check [powerlevel9k manual](https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#option-2-install-for-oh-my-zsh) if stuck.

:link: **Symlink `.zshrc`**
```bash
# Delete existing .zshrc
rm ~/.zshrc

# Link this .zshrc
ln -s ~/.oh-my-zsh/custom/zshrc ~/.zshrc
```

## Iterm2 configuration
Install iterm2 theme and powerlevel9k-supported font, from the [iterm2-config directory](https://github.com/joelchelliah/oh-my-zsh-custom/tree/master/iterm2-config)
