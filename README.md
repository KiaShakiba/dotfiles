# dotfiles
My dotfiles

## Installation
### Prepare dirs
```
sudo mkdir -p ~/.local/bin
mkdir -p ~/.config
```

### Ensure `/usr/local/bin` is prioritized in path
Add to end of `.bashrc`
```
export PATH="$HOME/.local/bin:$PATH"
```

### Install FUSE
`sudo apt install fuse`

### Install tmux
`sudo apt install tmux`

### Install Helix
Download AppImage from:
`https://github.com/helix-editor/helix/releases/latest/`

Then run:
```
sudo mv ./helix-*-x86_64.AppImage /usr/local/bin/hx
sudo chmod u+x /usr/local/bin/hx
```

### Install nvim
Download AppImage from:
`https://github.com/neovim/neovim/releases/latest/download/nvim.appimage`

Then run:
```
sudo mv ./nvim.appimage /usr/local/bin/nvim
sudo chmod u+x /usr/local/bin/nvim
```

### Install fzf
`sudo apt install fzf`

### Install yazi
`cargo install --locked yazi-fm yazi-cli`

Add shell wrapper for `y` to `.bashrc`:
```
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
```

Install theme:
`ya pack -a sanjinso/monokai-vibrant`

### Link the configuration directories
```
ln -s /path/to/dotfiles/tmux ~/.config/tmux
ln -s /path/to/dotfiles/yazi ~/.config/yazi
ln -s /path/to/dotfiles/helix ~/.config/helix
ln -s /path/to/dotfiles/nvim ~/.config/nvim
```
