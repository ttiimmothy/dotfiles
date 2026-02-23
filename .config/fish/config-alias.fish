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

set -g ALL_AUTHORS "Co-authored-by: wingck <ckwwingo@gmail.com>
Co-authored-by: steipete <peter@steipete.me>
Co-authored-by: claude <noreply@anthropic.com>
Co-authored-by: antfu <github@antfu.me>
Co-authored-by: hoipangcheung <hoipang1e06@gmail.com>
Co-authored-by: yyx990803 <yyx990803@gmail.com>"

# git version 2.37+ has autoSetupRemote = true for push, push = push -u origin
function nrot
  gt co -m "$argv[1]"
  gt push
end
function nrotwithc
  gt co -m "$argv[1]" -m "$ALL_AUTHORS
Co-authored-by: ttiimmothy <timothytimothytimo6@gmail.com>"
  gt push
end
function nrotwithc-c
  gt co -m "$argv[1]" -m "$ALL_AUTHORS
Co-authored-by: ttiimmothhy <timothytimothytimo0@gmail.com>"
  gt push
end
function nrotwithc-w1
  gt co -m "$argv[1]" -m "$ALL_AUTHORS
Co-authored-by: ttiimmothy <timothytimothytimo3@gmail.com>"
  gt push
end
function nrotwithc-w2
  gt co -m "$argv[1]" -m "$ALL_AUTHORS
Co-authored-by: ttiimmothy <timothytimothytimo5@gmail.com>"
  gt push
end
function initbranch
  gt co -m "branch first init"
  gt push
end
function emback
  set -l default_branch (gt remote show origin | sed -n '/HEAD branch/s/.*: //p')
  gt checkout $default_branch && gt p origin $default_branch
end
alias init "gt a . && nrot 'first init'"
alias tstw "z stow && emback && z dot"
alias gt "git"

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
