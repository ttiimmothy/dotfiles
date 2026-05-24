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
  else if test "$argv" = "."
    command git a .
  else if test "$argv" = "initi"
    command git a . && nrot 'first init'
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

alias vim "nvim"
alias cat "bat"
alias d "clear"
alias psql "psql -d postgres -U postgres"