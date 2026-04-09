---
title: Oh My Posh
layout: default
---

**Installation**
1. Install Homebrew `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. Install iTerm2 `brew install --cask iterm2`
3. in the **iTerm2** menu bar options, execute the ***Install Shell Integration***
4. `brew install jandedobbeleer/oh-my-posh/oh-my-posh`
5. `brew update && brew upgrade oh-my-posh`
6. `brew update && brew upgrade && exec zsh`
7. `oh-my-posh font install meslo`
8. Setup iTerm2 to use ***MesloLGL Nerd Font Mono*** by going to ***Settings > Profiles > Text***
9. Add the following snippet to `~/.zshrc`:

`if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then`<br>
`eval "$(oh-my-posh init zsh --config 'https://raw.githubusercontent.com/jeroen66124/oh-my-posh-config/refs/heads/main/config.json')"`<br>
`fi`<br>
`test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"`
