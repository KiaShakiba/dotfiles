# dotfiles
My dotfiles (and extra tools)

## Installation

### Prepare dirs
```
sudo mkdir -p ~/.local/bin
mkdir -p ~/.config
```

### Install Fish Shell
```
sudo apt-add-repository ppa:fish-shell/release-4
sudo apt update
sudo apt install fish
```

### Change default login shell to fish
```
// this might not be necessary, so check the `/etc/shells` file first
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
```

### Install omf and lambda
```
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
omf install lambda
```

### Ensure `/usr/local/bin` is prioritized in path
Add to end of `.bashrc`
```
export PATH="$HOME/.local/bin:$PATH"
```

### Install FUSE
`sudo apt install fuse`

### Install NerdFont
```
mkdir -p ~/.local/share/fonts/NerdFonts
mkdir font-tmp && cd font-tmp
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/UbuntuMono.tar.xz
tar -xf UbuntuMono.tar.xz
mv *.ttf ~/.local/share/fonts/NerdFonts/
cd .. && rm -rf font-tmp
```

### Install tmux
`sudo apt install tmux`

### Install Helix
Download AppImage from:
[Helix AppImage](https://github.com/helix-editor/helix/releases/latest/)

Then run:
```
sudo mv ./helix-*-x86_64.AppImage /usr/local/bin/hx
sudo chmod u+x /usr/local/bin/hx
```

### Install nvim
Download AppImage from:
[nvim appimage](https://github.com/neovim/neovim/releases/latest/download/nvim.appimage)

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

### Install LSPs

#### rust_analyzer
```
curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | zcat | tee ./rust-analyzer >/dev/null
sudo mv ./rust-analyzer ~/.local/bin/rust-analyzer
sudo chmod +x ~/.local/bin/rust-analyzer
```

### protols
```
cargo install protols
```

#### texlab
```
cargo install --git https://github.com/latex-lsp/texlab --locked --tag <insert version here>
```

Get version from [texlab releases](https://github.com/latex-lsp/texlab/releases).

#### cspell-lsp
Install Bun:
`curl -fsSL https://bun.sh/install | bash`

Clone `cspell-lsp` from
[cspell-lsp](https://github.com/vlabo/cspell-lsp)

Then run
```
npm i vscode-languageserver
npm i readline
npm i vscode-languageserver-textdocument
npm i cspell-lib

bun build ./main.ts --compile --outfile cspell-lsp
mv ./cspell-lsp ~/.local/bin
```

### Link the configuration directories
```
ln -s /path/to/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -s /path/to/dotfiles/tmux ~/.config/
ln -s /path/to/dotfiles/yazi ~/.config/
ln -s /path/to/dotfiles/helix ~/.config/
ln -s /path/to/dotfiles/nvim ~/.config/
```
