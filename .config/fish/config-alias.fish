# git
# normal commit to any branch without anything added, but can also combine as git add . && norcomt "message" with things added
# function norcomt
#   # $argv[1] coverts to string if I don't put string as param
#   git co -m "$argv[1]" && git push
# end
function nrcot
  # $argv[1] coverts to string if I don't put string as param
  git co -m "$argv[1]" && git push
end
alias init "git a . && git co -m 'first init' && git push -u origin main"
# usually use after emt
alias emback "git cout main && git pull-allow origin main"
# checkout empty branch and create empty commit
# alias emt "git cout empty && git pull origin empty && git pull origin main && git co -m "empty" && git push"
# alias git-global "git config --global --list"
# alias glk "git lfs track"
alias gostow "z stow && emback && z stow"

# neofetch
alias icondistro "neofetch --ascii_colors 9 8 --ascii_distro debian --config none --colors 3 2 7 6 2 8"
alias icondistrocolor "neofetch --ascii_colors 7 9 --ascii_distro debian --config none --colors 3 2 7 6 2 8"
alias icon "neofetch --ascii_colors 9 8 --ascii_distro debian --config none -L"
alias archdistro "neofetch --ascii_colors 8 9 --ascii_distro arch --config none --colors 2 7 7 3 7 7"
alias arch "neofetch --ascii_colors 8 9 --ascii_distro arch --config none -L"
alias raspberry "neofetch --ascii_colors 8 2 --ascii_distro raspbian --config none"

# other (tmux, neovim, zoxide and more)
alias vi "nvim"
alias ni "nvim"
alias vim "nvim"
alias d "clear"
alias python "python3"
alias pip "pip3"
alias wificonnectivity "ping -c 8 firebase.com"
alias wificonnectivitycheck "ping -c 17 firebase.com"
alias wificheck "ping -c 23 firebase.com"
alias firebases "ping -c 24 firebase.com"
alias ore "ping -c 20 firebase.com"
alias timoptimothywificonnectivitycheck "ping -c 10 firebase.com"

# source
# alias sorf "source ~/.config/fish/config.fish"
alias sof "source ~/.config/fish/config.fish"

# show desktop, key code 120 is "f2" function key
alias sowdesk "osascript -e 'tell application \"System Events\" to key code 120'"

function countbinary
  # \( -type f -or -type l \)
  # f = file, l = symlink
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
