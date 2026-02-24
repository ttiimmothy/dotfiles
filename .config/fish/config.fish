if status is-interactive
  source (dirname (status --current-filename))/config-osx-eza.fish
  source (dirname (status --current-filename))/config-alias.fish
  if test -s (dirname (status --current-filename))/.profile
    source (dirname (status --current-filename))/.profile
  end
  set -g fish_greeting
  set -gx HOMEBREW_NO_ENV_HINTS 1
end
eval "$(/opt/homebrew/bin/brew shellenv)"
zoxide init fish | source
pyenv init - fish | source