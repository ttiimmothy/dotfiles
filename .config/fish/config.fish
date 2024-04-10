if status is-interactive
  # Commands to run in interactive sessions can go here
  source (dirname (status --current-filename))/config-osx-eza.fish
  source (dirname (status --current-filename))/config-osx-git-command-alias.fish
  # source $HOME/.config/fish/config-osx.fish
  set -g fish_greeting
end
zoxide init fish | source
