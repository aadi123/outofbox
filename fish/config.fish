if status is-interactive
	# Commands to run in interactive sessions can go here
and not set -q TMUX
    exec tmux
end
set -gx ORG_DIR /home/aaditya/Documents/org
set -gx LEDGER_FILE $ORG_DIR/second-brain/time-money-tracking/finances/2023.journal
starship init fish | source
