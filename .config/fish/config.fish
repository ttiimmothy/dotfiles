if status is-interactive
  eval "$(/opt/homebrew/bin/brew shellenv)"
  source (dirname (status --current-filename))/config-alias.fish
  source (dirname (status --current-filename))/config-export.fish
  set -g fish_greeting
  alias lla "eza -alg --icons"
end

