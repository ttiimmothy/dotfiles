if status is-interactive
  source (dirname (status --current-filename))/config-alias.fish
  set -gx HOMEBREW_NO_ENV_HINTS 1
  set -g fish_greeting
  if type -q eza
    alias lla "eza -alg --icons"
  end
end
eval "$(/opt/homebrew/bin/brew shellenv)"
zoxide init fish | source
pyenv init - fish | source