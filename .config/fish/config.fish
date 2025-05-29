eval "$(/opt/homebrew/bin/brew shellenv)"
if status is-interactive
  # Commands to run in interactive sessions can go here
  source (dirname (status --current-filename))/config-osx-eza.fish
  source (dirname (status --current-filename))/config-alias.fish
  # source $HOME/.config/fish/config-osx-eza.fish
  # source $HOME/.config/fish/config-alias.fish
  # echo -e '\n# Auto-Warpify\nstatus --is-interactive; and printf '\''\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish", "uname": "'$(uname)'" }}\x9c'\'' '
  # Auto-Warpify
  printf 'P$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish", "uname": "Darwin" }}�'
  set -g fish_greeting
end
zoxide init fish | source
