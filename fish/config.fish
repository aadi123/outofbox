if status is-interactive
	# Commands to run in interactive sessions can go here
and not set -q TMUX
    exec tmux
end
set -gx ORG_DIR /home/aaditya/Dropbox/org
set -gx LEDGER_FILE $ORG_DIR/second-brain/time-money-tracking/finances/2023.journal
set cmd (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval $cmd
starship init fish | source
