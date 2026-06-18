if status is-interactive
  source (dirname (status --current-filename))/config-alias.fish
  set -g fish_greeting
  alias lla "eza -alg --icons"
end
eval "$(/opt/homebrew/bin/brew shellenv)"
pyenv init - fish | source
zoxide init fish | source
function fish_job_summary
  # do nothing → suppress job termination messages
end
source ~/.config/fish/config-env.fish
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_REQUIRE_TAP_TRUST=1