set -g ALL_AUTHORS "Co-authored-by: wingck <ckwwingo@gmail.com>
Co-authored-by: claude <noreply@anthropic.com>
Co-authored-by: hoipangcheung <hoipang1e06@gmail.com>"

function git
  if test "$argv[1]" = pull -o "$argv[1]" = p-a -o "$argv[1]" = p
    command git pull-allow $argv[2..-1] -q
  else
    command git $argv
  end
end
function nrot
  git co -m "$argv[1]"
  git push
end
function nrotwithc
  git co -m "$argv[1]" -m "$ALL_AUTHORS"
  git push
end
function emback
  set -l default_branch (git remote show origin | sed -n '/HEAD branch/s/.*: //p')
  git checkout $default_branch && git p origin $default_branch
end
function uv
  if test "$argv[1]" = venv
    command uv venv venv $argv[2..-1]
  else
    command uv $args
  end
end

alias vim "nvim"
alias cat "bat"
alias d "clear"
alias init "git a . && nrot 'first init'"
alias psql "psql -d postgres -U postgres"
alias sor "source ~/.config/fish/config.fish"
