if status is-interactive
  source (dirname (status --current-filename))/config-alias.fish
  set -gx HOMEBREW_NO_ENV_HINTS 1
  set -g fish_greeting
  alias lla "eza -alg --icons"
end
eval "$(/opt/homebrew/bin/brew shellenv)"
pyenv init - fish | source
zoxide init fish | source