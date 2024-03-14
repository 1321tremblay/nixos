{ config, pkgs, ... }:

{

home.packages = with pkgs;[
  tmux
];

  programs.tmux = {
  enable = true;
  extraConfig = ''
unbind C-b
set -g prefix C-Space

unbind r
bind r source-file ~/.config/tmux/tmux.conf \; display "Reloaded ~/.tmux.conf"

set -g base-index 1          # start indexing windows at 1 instead of 0
set -g detach-on-destroy off # don't exit from tmux when closing a session
set -g escape-time 0         # zero-out escape time delay
set -g history-limit 1000000 # increase history size (from 2,000)
set -g mouse on              # enable mouse support
set -g renumber-windows on   # renumber all windows when any window is closed
set -g set-clipboard on      # use system clipboard
set -g status-interval 3     # update the status bar every 3 seconds
bind-key x kill-pane         # skip "kill-pane 1? (y/n)" prompt

set -g status-left "#[fg=color8]#S" # session name
set -g status-left-length 200          # increase length (from 10)
set -g status-position bottom             # macOS / darwin style
set -g status-right ""                 # blank
set -g status-style 'bg=default'       # transparent



set-window-option -g window-status-style fg=colour8
set-window-option -g window-status-current-style fg=colour8
set-option -g message-style fg=colour166

# Should be same (screen-256color may work too), add :Tc to enable truecolor support 
set-option -g  default-terminal "xterm-256color" 
set-option -ga terminal-overrides ",xterm-256color:Tc"

# Toggle status bar
bind t set-option status


# v and h are not bound by default, but we never know in the next versions...
unbind v
unbind h

unbind % # Split vertically
unbind '"' # Split horizontally

bind v split-window -h -c "#{pane_current_path}"
bind h split-window -v -c "#{pane_current_path}"

bind -n C-h select-pane -L \; display "Left"
bind -n C-j select-pane -D \; display "Down"
bind -n C-k select-pane -U \; display "Up"
bind -n C-l select-pane -R \; display "Right"

unbind n  #DEFAULT KEY: Move to next window
unbind w  #DEFAULT KEY: change current window interactively

bind n command-prompt "rename-window '%%'"
bind w new-window -c "#{pane_current_path}"

bind -n M-j previous-window \; display "Previous window"
bind -n M-k next-window \; display "Next window"

set-window-option -g mode-keys vi

unbind -T copy-mode-vi Space; #Default for begin-selection
unbind -T copy-mode-vi Enter; #Default for copy-selection

bind -T copy-mode-vi v send-keys -X begin-selection
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xsel --clipboard"

set -g -a terminal-overrides ',*:Ss=\E[%p1%d q:Se=\E[2 q'

# Smart pane switching with awareness of Vim splits.
# See: https://github.com/christoomey/vim-tmux-navigator

is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
    | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
bind -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
bind -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
bind -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
bind -n C-l if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
bind -n C-\\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
  '';
};
  }
