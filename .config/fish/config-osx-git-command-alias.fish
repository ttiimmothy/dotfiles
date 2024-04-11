# normal commit to any branch without anything added, but can also combine as git add . && norcomt "message" with things added
function norcomt
  # $argv[1] coverts to string if I don't put string as param
  git co -m "$argv[1]" && git push
end
function norcomtpartial
  if test $argv[2]
    git add . && git co -m "$argv[1]" && git partial-push origin $argv[2]
  else
    git add . && git co -m "$argv[1]" && git partial-push origin main
  end
end
# initial commit
alias init "git add . && git co -m 'chore init' && git push -u origin main"
# usually use after emt
alias emback "git cout main && git pull-allow origin main"
# checkout empty branch and create empty commit
alias emt "git cout empty && git pull origin empty && git pull origin main && git co -m "empty" && git push"
alias git-global "git config --global --list"
alias vim "nvim"
alias v "z"