if status is-interactive
  source (dirname (status --current-filename))/config-osx-eza.fish
  source (dirname (status --current-filename))/config-alias.fish
  if test -s (dirname (status --current-filename))/.profile
    source (dirname (status --current-filename))/.profile
  end
  set -g fish_greeting
end
eval "$(/opt/homebrew/bin/brew shellenv)"
set -gx HOMEBREW_NO_ENV_HINTS 1
zoxide init fish | source
pyenv init - fish | source