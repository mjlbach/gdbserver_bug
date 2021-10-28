.phony: dbg-start dbg-attach debug build

build:
	@$(make) nvim

dbg-start: build
	@tmux new-window -n 'dbg-neovim' 'gdbserver --wrapper env runtime=runtime -- :6666 ./build/bin/nvim -d'

dbg-attach:
	@tmux new-window -n 'dbg-cgdb' 'cgdb -x gdb_start.sh ./build/bin/nvim'

debug: dbg-start dbg-attach
