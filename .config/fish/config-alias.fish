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
  if test (count $argv) -ge 3; and test "$argv[1]" = with; and test "$argv[2]" = c if test "$argv[1]" = with and test "argv[2]" = c
    git co -m "$argv[3]" -m "$ALL_AUTHORS"
    git push
  else
    git co -m "$argv[1]"
    git push
  end
end
function emback
  set -l default_branch (git remote show origin | sed -n '/HEAD branch/s/.*: //p')
  git checkout $default_branch && git p origin $default_branch
end
function uv
  if test "$argv[1]" = venv
    command uv venv venv $argv[2..-1]
  else if test "$argv[1]" = init
    command uv init --bare $argv[2..-1]
  else if test "$argv[1]" = add -o "$argv[1]" = sync
    if contains -- --active $argv; or contains -- -a $argv
      command uv $argv
    else
      command uv $argv[1] --active $argv[2..-1]
    end
  else
    command uv $argv
  end
end
function v
  if test "$argv[1]" = venv
    command uv venv venv $argv[2..-1]
  else if test "$argv[1]" = init
    command uv init --bare $argv[2..-1]
  else if test "$argv[1]" = add -o "$argv[1]" = sync
    if contains -- --active $argv; or contains -- -a $argv
      command uv $argv
    else
      command uv $argv[1] --active $argv[2..-1]
    end
  else
    command uv $argv
  end
end

alias vim "nvim"; alias nim "nvim"
alias cat "bat"
alias d "clear"
alias init "git a . && nrot 'first init'"
alias psql "psql -d postgres -U postgres"
alias sro "source ~/.config/fish/config.fish"
alias upall "brew cleanup && brew upgrade -y && v self update"
alias ewb "brew ls | cat"
alias cby "pmset -g batt | grep -i internal | cat --style=changes,header,snip,grid"
alias unhide "chflags nohidden ~/Music ~/Public ~/Movies ~/Pictures ~/Applications ~/Documents ~/Desktop"
alias hide "chflags hidden ~/Music ~/Public ~/Movies ~/Pictures ~/Applications ~/Documents ~/Desktop" 

