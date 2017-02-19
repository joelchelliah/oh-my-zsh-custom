# oh-my-zsh-custom
> My **.oh-my-zsh/custom** settings!


## Installation and setup

:boom: **Get oh-my-zsh**
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

:link: **Symlink `.zshrc`**
```bash
# Delete existing .zshrc
rm ~/.zshrc

# Link this .zshrc
ln -s ~/.oh-my-zsh/custom/zshrc ~/.zshrc
```

## Iterm2 configuration
- Theme: [Solarized Dark](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized)
- Font: [SourceCodePro+Powerline+Awesome+Regular.ttf](https://github.com/gabrielelana/awesome-terminal-fonts/tree/patching-strategy/patched)

---

:memo: **TODO**
- Add personal Iterm2 theme (and also bundle font?)
- Migrate / bootstrap .dotfiles
