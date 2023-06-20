if status is-interactive
	# Commands to run in interactive sessions can go here
and not set -q TMUX
    exec tmux
end
set -gx ORG_DIR /home/aaditya/Dropbox/org
set -gx LEDGER_FILE $ORG_DIR/second-brain/time-money-tracking/finances/2023.journal
set -gx GOPATH $HOME/go
fish_add_path $HOME/.config/emacs/bin
fish_add_path $GOPATH/bin
set cmd (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval $cmd
starship init fish | source

# opam configuration
source /home/aaditya/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
