function fish_job_summary
  # do nothing → suppress job termination messages
end
source ~/.config/fish/config-env.fish
export UV_PROJECT_ENVIRONMENT=venv
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_REQUIRE_TAP_TRUST=1
pyenv init - fish | source
zoxide init fish | source

