set -g ALL_AUTHORS "Co-authored-by: wingck <ckwwingo@gmail.com>
Co-authored-by: steipete <peter@steipete.me>
Co-authored-by: claude <noreply@anthropic.com>
Co-authored-by: antfu <github@antfu.me>
Co-authored-by: hoipangcheung <hoipang1e06@gmail.com>
Co-authored-by: yyx990803 <yyx990803@gmail.com>"

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
  else
    command git $argv
  end
end
function nrot
  git ci -m "$argv[1]"
  git push
end
function nrotwithc
  git ci -m "$argv[1]" -m "$ALL_AUTHORS
Co-authored-by: ttiimmothy <timothytimothytimo6@gmail.com>"
  git push
end
function nrotwithc-c
  git ci -m "$argv[1]" -m "$ALL_AUTHORS
Co-authored-by: ttiimmothhy <timothytimothytimo0@gmail.com>"
  git push
end
function nrotwithc-w1
  git ci -m "$argv[1]" -m "$ALL_AUTHORS
Co-authored-by: ttiimmothy <timothytimothytimo3@gmail.com>"
  git push
end
function nrotwithc-w2
  git ci -m "$argv[1]" -m "$ALL_AUTHORS
Co-authored-by: ttiimmothy <timothytimothytimo5@gmail.com>"
  git push
end
function emback
  set -l default_branch (git remote show origin | sed -n '/HEAD branch/s/.*: //p')
  git checkout $default_branch && git p origin $default_branch
end
alias init "git . && nrot 'first init'"

# neofetch
alias icondistro "neofetch --ascii_colors 9 8 --ascii_distro debian --config none --colors 3 2 7 6 2 8"
alias icondistrocolor "neofetch --ascii_colors 7 9 --ascii_distro debian --config none --colors 3 2 7 6 2 8"
alias icon "neofetch --ascii_colors 9 8 --ascii_distro debian --config none -L"
alias archdistro "neofetch --ascii_colors 8 9 --ascii_distro arch --config none --colors 2 7 7 3 7 7"
alias arch "neofetch --ascii_colors 8 9 --ascii_distro arch --config none -L"
alias vim "nvim"
alias d "clear"
alias cat "bat"