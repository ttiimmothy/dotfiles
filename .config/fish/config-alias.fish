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
alias verigit1 "emback && v g vim && norcomt empty && v ../doe && norcomt empty && v d 0 && norcomt empty && v d 1 && norcomt empty && v gi zsh && norcomt empty && v loc fish && norcomt \"feat add fish shell history\" && v githu shell && emback && v raycast && norcomt empty && v repo repos && norcomt empty && v proj m && emt"
alias verigit2 "emback && v vsc && norcomt empty && v general && norcomt empty && v gi pseudo && norcomt empty && v codeforce && norcomt empty && v use && norcomt empty && v install && norcomt empty && v metrics && emback && norcomt empty && v ttiimmo && emback && norcomt empty"

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
alias tsession "tmux ls"
alias vim "nvim"
# alias v "z"
alias vwv "zoxide query -l -s"
alias c "clear"

# source
alias soz "source ~/.zshrc"

# open file
alias pdfvore "open ~/Integration/voreprank/Perfect\ pdf.pdf"
alias sublime "open -a /Applications/Sublime\ Text.app"
