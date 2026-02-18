# function norcomt
#   # $argv[1] coverts to string if I don't put string as param
#   git co -m "$argv[1]" && git push
# end
function nrot
  git co -m "$argv[1]"
  set branch (git symbolic-ref --short HEAD)
  if git rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1
    git push
  else
    git push -u origin $branch
  end
end
function nrotwithc
  git co -m "$argv[1]" -m "$(printf "Co-authored-by: wingck <ckwwingo@gmail.com>\nCo-authored-by: steipete <peter@steipete.me>\nCo-authored-by: claude <noreply@anthropic.com>\nCo-authored-by: antfu <github@antfu.me>\nCo-authored-by: hoipangcheung <hoipang1e06@gmail.com>")"
  set branch (git symbolic-ref --short HEAD)
  if git rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1
    git push
  else
    git push -u origin $branch
  end
end
function initbranch
  git co -m "branch first init"
  set branch (git symbolic-ref --short HEAD)
  if git rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1
    git push
  else
    git push -u origin $branch
  end
end
function git
  if test (count $argv) -eq 2; and test "$argv[1]" = "checkout"
    set -l branch_name $argv[2]
    if test -f "$branch_name"; or test -d "$branch_name"
      command git $argv
      return
    end
    if command git rev-parse --verify "$branch_name" >/dev/null 2>&1
      command git checkout "$branch_name"
    else if command git rev-parse --verify "origin/$branch_name" >/dev/null 2>&1
      command git checkout --track "origin/$branch_name"
    else
      command git checkout -b "$branch_name"
    end
  else
    command git $argv
  end
end
function emback
  set -l default_branch (git remote show origin | sed -n '/HEAD branch/s/.*: //p')
  git checkout $default_branch && git pull-allow origin $default_branch
end
alias init "git a . && git co -m 'first init' && git push -u origin main"
# alias emback "git checkout main && git pull-allow origin main"
alias tstw "z stow && emback && z dot"

# neofetch
alias icondistro "neofetch --ascii_colors 9 8 --ascii_distro debian --config none --colors 3 2 7 6 2 8"
alias icondistrocolor "neofetch --ascii_colors 7 9 --ascii_distro debian --config none --colors 3 2 7 6 2 8"
alias icon "neofetch --ascii_colors 9 8 --ascii_distro debian --config none -L"
alias archdistro "neofetch --ascii_colors 8 9 --ascii_distro arch --config none --colors 2 7 7 3 7 7"
alias arch "neofetch --ascii_colors 8 9 --ascii_distro arch --config none -L"
alias raspberry "neofetch --ascii_colors 8 2 --ascii_distro raspbian --config none"

# other (tmux, neovim, zoxide and more)
alias tmu "tmux"
alias vim "nvim"
alias d "clear"
alias erc "ping -c 20 firebase.com"
alias zc "zoxide query -l -s"

# source
alias srf "source ~/.config/fish/config.fish"

function countbinary
  # in \( -type f -or -type l \), f = file, l = symlink
  # -perm +111 = executable
  for dir in $PATH
    if test -d $dir
      find $dir -maxdepth 1 \( -type f -or -type l \) -perm +111 2>/dev/null | xargs -n1 basename
    end
  end | sort | uniq | wc -l | string trim
end
function listallbinaries
  for dir in $PATH
    if test -d $dir
      find $dir -maxdepth 1 \( -type f -or -type l \) -perm +111 2>/dev/null | xargs -n1 basename
    end
  end | sort | uniq | vi
end
