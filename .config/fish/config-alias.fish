set -g ALL_AUTHORS "Co-authored-by: wingck <ckwwingo@gmail.com>
Co-authored-by: claude <noreply@anthropic.com>
Co-authored-by: hoipangcheung <hoipang1e06@gmail.com>"

function git
  if test (count $argv) -eq 2; and test "$argv[1]" = "checkout"
    set -l branch_name $argv[2]
    if command git rev-parse --verify "$branch_name" >/dev/null 2>&1
      command git checkout "$branch_name"
    else
      command git checkout -b "$branch_name"
    end
  else if contains -- "$argv[1]" pull p-a p
    command git pull-allow $argv[2..-1]
  else
    command git $argv
  end
end
function brew 
  if test (count $argv) -ge 1; and contains -- "$argv[1]" upgrade u
    yes | command brew upgrade $argv[2..-1]
  else
    command brew $argv
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

alias vim "nvim"
alias cat "bat"
alias d "clear"
alias init "git a . && nrot 'first init'"
alias psql "psql -d postgres -U postgres"
alias ot "z stow && emback && z dot"
alias sefe "z usef && emback && z usef"