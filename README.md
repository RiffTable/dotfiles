# dotfiles
Personal repo for Linux dotfiles.


## Package Installation
Required packages and their dependencies: [dependencies.md](dependencies.md)

## Stow Setup
After all packages are installed, You're ready to download the dotfiles. First, install `git` and `stow` using the package manager natively available.

Now, Run this command on the home directory to clone the dotfiles directory to `~/dotfiles` then `cd` to the newly created dotfiles directory.

```bash
git clone git@github.com:RiffTable/dotfiles.git
cd dotfiles
```

Then run stow in the dotfiles directory. This will symlink all config files and everything should automatically be configured!

```bash
stow .
```

Thanks to [Dreams of Autonomy's video](https://youtu.be/y6XCebnB9gs) for teaching me how to backup and manage dotfiles.

## Extra Setup
Some packages require extra installation and configuration. Follow the guide to complete the setup.

### Nerd Font Setup
Terminal text won't show correctly without 'JetBrainsNerd Font' installed. Install it from the [nerd font repository](https://github.com/ryanoasis/nerd-fonts/?tab=readme-ov-file#option-6-ad-hoc-curl-download).

```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
# download the JetBrainsMono Nerd Font (latest release)
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
tar -xvf JetBrainsMono.tar.xz
```

Now update the font cache then check if the font was successfully installed.

```bash
fc-cache -fv
fc-list | grep "JetBrainsMono Nerd Font"
```

### Tmux Installation
After installing tmux through the package manager, install tpm with git clone. Keep in mind that the Catppuccin theme might break and you'll need to swap around the lines for powerline theming, pane properties and the run tpm command.

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Now, install plugins inside tmux using '`prefix + I`'.

### VS Code Installation
Move the .json files in the right location:
Windows: `%APPDATA%\Code\User\*.json`
Linux: `$HOME/.config/Code/User/*.json`

Then, execute the following command to install listed extensions from `vs-code-extensions.txt`:

```bash
xargs -a vs-code-extensions.txt -L 1 code --install-extension
```

For windows, the powershell command is as such:

```powershell
gc vs-code-extensions.txt | % { code --install-extension $_ }
```
