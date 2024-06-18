Instructions for new system (**Warning** this is destructive to the `custom` folder, which in a new system should be example files only)
- Install iTerm and Oh My Zsh if necessary ([example](https://gist.github.com/kevin-smets/8568070))
- `rm -rf ~/.oh-my-zsh/custom && mkdir !$ && cd !$`
- `git clone git@github.com:microcosm/oh-my-zsh-customizations.git .`
- Modify the theme to Powerlevel10k if desired (see above URL)
- `. ~/.zshrc`

Other new system tips:
- Modify the keybindings for home/end - save this to `~/Library/KeyBindings/DefaultKeyBinding.dict` and restart apps:
```
{
    "\UF729"  = "moveToBeginningOfLine:";
    "\UF72B"  = "moveToEndOfLine:";
    "$\UF729" = "moveToBeginningOfLineAndModifySelection:";
    "$\UF72B" = "moveToEndOfLineAndModifySelection:";
}
```
