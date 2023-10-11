default: all

all: uninstall move

install: install-nvim install-tmux-tpm install-fzf

move:
	@cp -r config/* ~/.config/ 
	@cd tmux/ && ls tmux* | grep -v .md | xargs -I{} cp {} ~/.{}
	@cp -r scripts/* ~/.local/scripts
	@cd zsh/ && ls zsh* | xargs -I{} cp {} ~/.{}

install-fzf:
	@sudo apt-get install fzf -y

install-nvim:
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	@sudo chmod u+x nvim.appimage
	@sudo mv nvim.appimage /usr/bin/nvim

install-tmux-tpm:
	@git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

uninstall:
	@rm -rf ~/.config/nvim 
	@rm -rf ~/.local/share/nvim 
	@rm -rf ~/.tmux/
	@rm -rf ~/.tmux*
