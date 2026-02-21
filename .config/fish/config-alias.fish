function git
  if test (count $argv) -eq 2; and test "$argv[1]" = "checkout"
    set -l branch_name $argv[2]
    if command git rev-parse --verify "$branch_name" >/dev/null 2>&1
      command git checkout "$branch_name"
    else if command git rev-parse --verify "origin/$branch_name" >/dev/null 2>&1
      command git checkout --track "origin/$branch_name"
    else
      command git checkout -b "$branch_name"
    end
  else if contains -- "$argv[1]" pull p-a p
    command git pull-allow $argv[2..-1]
  else
    command git $argv
  end
end
# git version 2.37+ has autoSetupRemote = true for push, this function can be replaced
# function push
#   set branch (git symbolic-ref --short HEAD)
#   if git rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1
#     git push
#   else
#     git push -u origin $branch
#   end
# end
function nrot
  git co -m "$argv[1]"
  git push
end
function nrotwithc
  git co -m "$argv[1]" -m "$(printf "Co-authored-by: wingck <ckwwingo@gmail.com>\nCo-authored-by: steipete <peter@steipete.me>\nCo-authored-by: claude <noreply@anthropic.com>\nCo-authored-by: antfu <github@antfu.me>\n
  Co-authored-by: ttiimmothhy <timothytimothytimo0@gmail.com>\nCo-authored-by: hoipangcheung <hoipang1e06@gmail.com>")"
  git push
end
function nrotwithc-1
  git co -m "$argv[1]" -m "$(printf "Co-authored-by: wingck <ckwwingo@gmail.com>\nCo-authored-by: steipete <peter@steipete.me>\nCo-authored-by: claude <noreply@anthropic.com>\nCo-authored-by: antfu <github@antfu.me>\n
  Co-authored-by: ttiimmothy <timothytimothytimo6@gmail.com>\nCo-authored-by: hoipangcheung <hoipang1e06@gmail.com>")"
  git push
end
function initbranch
  git co -m "branch first init"
  git push
end
function emback
  set -l default_branch (git remote show origin | sed -n '/HEAD branch/s/.*: //p')
  git checkout $default_branch && git p origin $default_branch
end
alias init "git a . && nrot 'first init'"
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
