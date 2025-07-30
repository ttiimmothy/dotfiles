eval "$(/opt/homebrew/bin/brew shellenv)"
if status is-interactive
  # Commands to run in interactive sessions can go here
  source (dirname (status --current-filename))/config-osx-eza.fish
  source (dirname (status --current-filename))/config-alias.fish
  if test -s (dirname (status --current-filename))/.profile
    source (dirname (status --current-filename))/.profile
  end
  set -g fish_greeting
end
zoxide init fish | source
# Setting PATH for Python 3.11
# The original version is saved in /Users/timoptimothy/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.11/bin" "$PATH"
