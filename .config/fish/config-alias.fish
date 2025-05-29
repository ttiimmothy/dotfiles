# git
# normal commit to any branch without anything added, but can also combine as git add . && norcomt "message" with things added
function norcomt
  # $argv[1] coverts to string if I don't put string as param
  git co -m "$argv[1]" && git push
end
# initial commit
alias init "git add . && git co -m 'first init' && git push -u origin main"
# usually use after emt
alias emback "git cout main && git pull-allow origin main"
# checkout empty branch and create empty commit
alias emt "git cout empty && git pull origin empty && git pull origin main && git co -m "empty" && git push"
alias git-global "git config --global --list"
alias glk "git lfs track"

# python
alias python "python3"
alias pip "pip3"

# neofetch
alias icondistro "neofetch --ascii_colors 9 8 --ascii_distro debian --config none --colors 3 2 7 6 2 8"
alias icondistrocolor "neofetch --ascii_colors 7 9 --ascii_distro debian --config none --colors 3 2 7 6 2 8"
alias icon "neofetch --ascii_colors 9 8 --ascii_distro debian --config none -L"
alias archdistro "neofetch --ascii_colors 8 9 --ascii_distro arch --config none --colors 2 7 7 3 7 7"
alias arch "neofetch --ascii_colors 8 9 --ascii_distro arch --config none -L"
alias raspberry "neofetch --ascii_colors 8 2 --ascii_distro raspbian --config none"

# other (tmux, neovim, zoxide and more)
alias vim "nvim"
alias vi "nvim"
alias n "nvim"
alias c "clear"
# auto-warpify, but can't use
# alias ww "printf '\eP$f{\"hook\": \"SourcedRcFileForWarp\", \"value\": { \"shell\": \"fish\"}}\x9c'"

# source
# alias soz "source ~/.zshrc"
