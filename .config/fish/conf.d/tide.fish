# from craftzdog
# set -g tide_git_bg_color 268bd2
# set -g tide_git_bg_color_unstable C4A000
# set -g tide_git_bg_color_urgent CC0000
# set -g tide_git_branch_color 000000
# set -g tide_git_color_branch 000000
# set -g tide_git_color_conflicted 000000
# set -g tide_git_color_dirty 000000
# set -g tide_git_color_operation 000000
# set -g tide_git_color_staged 000000
# set -g tide_git_color_stash 000000
# set -g tide_git_color_untracked 000000
# set -g tide_git_color_upstream 000000
# set -g tide_git_conflicted_color 000000
# set -g tide_git_dirty_color 000000
# set -g tide_git_icon 
# set -g tide_git_icon 
# set -g tide_git_operation_color 000000
# set -g tide_git_staged_color 000000
# set -g tide_git_stash_color 000000
# set -g tide_git_untracked_color 000000
# set -g tide_git_upstream_color 000000
# set -g tide_pwd_bg_color 444444


# myself fish shell tide theme configuration

# this may not be useful
# set -U fish_pager_color_progress 268bd2
# set -U fish_pager_color_completion 268bd2
# set -U fish_color_search_match --background='333'
# set -U fish_pager_color_secondary_background --background=brwhite
# set -U fish_cursor_color 268bd2
# set -U fish_color_search_match --background=444
# set -U fish_pager_color_prefix 333
# set -U fish_color_selection f50
# set -U fish_color_selection --background=ff5500
# set -U fish_cursor_color normal
# set -U fish_pager_color_prefix normal
# set -U fish_pager_color_secondary_background --background=green
# set -U fish_cursor_color green
# set -U fish_color_selection --background=ff5500
# set -U fish_color_selection green --bold --background=ff5500
# set -U fish_color_command bold
# set -U fish_color_command blue
# set -U fish_color_command normal
# set -U fish_cursor_visual block 268bd2
# set -U fish_pager_color_progress 808080
# set -U fish_pager_color_secondary_background --background=808080
set -U fish_color_command ffffff
set -U fish_color_operator brcyan
set -U fish_color_param ffcc00
# set -U fish_color_quote yellow
set -U fish_color_quote 9c87c9
set -U fish_color_host normal
set -U fish_color_normal normal

# either one
# set -U tide_character_bg_color 268bd2
set -U tide_character_bg_color normal

set -U tide_os_bg_color ff5500
set -U tide_os_color ffffff
set -U tide_pwd_bg_color 424242
set -U tide_git_bg_color ff5500
set -U tide_git_bg_color_urgent cc0000
set -U tide_git_color_dirty ffffff

set -U tide_git_bg_color_unstable 4e387e
set -U tide_git_color_branch ffffff
set -U tide_git_color_conflicted ffffff
set -U tide_git_color_dirty ffffff
set -U tide_git_color_operation ffffff
set -U tide_git_color_staged ffffff
set -U tide_git_color_stash ffffff
set -U tide_git_color_unstable ffffff
set -U tide_git_color_untracked ffffff
set -U tide_git_color_upstream ffffff

set -U tide_node_color ffffff
set -U tide_rustc_bg_color 838996
set -U tide_rustc_color 000000
set -U tide_rustc_icon 
set -U tide_cmd_duration_bg_color fac5a6
set -U tide_cmd_duration_color 424242
set -U tide_cmd_duration_icon ⎈
set -U tide_character_color fac5a6
# set -U tide_character_icon ❯
set -U tide_character_icon 﫸❯

# set -U tide_git_bg_color 0066ff
# set -U tide_git_bg_color 0000ff
# set -U tide_git_bg_color 0088ff
# set -U tide_git_bg_color 0099ff
# set -U tide_git_bg_color 0097ff
# set -U tide_git_bg_color magenta
# set -U tide_git_bg_color brcyan
# set -U tide_git_bg_color btcyan
# set -U tide_git_bg_color cyan
# set -U tide_git_bg_color blue
# set -U tide_git_bg_color darkblue
# set -U tide_git_bg_color dablue
# set -U tide_git_bg_color brblue

# set -U tide_pwd_bg_color brblack
# set -U tide_pwd_bg_color dablue
# set -U tide_pwd_bg_color liblack
# set -U tide_pwd_bg_color brblue
# set -U tide_pwd_bg_color black
# set -U tide_pwd_bg_color blblack
# set -U tide_pwd_bg_color grey
# set -U tide_pwd_bg_color tungsten
# set -U tide_pwd_bg_color yellow
# set -U tide_pwd_color yellow
set -U tide_pwd_color grey
# set -U tide_pwd_color tungsten

# set -U tide_git_bg_color 0066ff
# set -U tide_git_bg_color_unstable f50
# set -U tide_git_bg_color_urgent f50
# set -U tide_git_bg_color f50
# set -U tide_git_bg_color blue
# set -U tide_git_bg_color normal
# set -U tide_git_bg_color 0f0
# set -U tide_git_bg_color 3bb143

# set -U tide_git_icon 
set -U tide_git_icon 
set -U tide_shlvl_bg_color 049189
set -U tide_shlvl_color cccccc
set -U tide_shlvl_icon 
set -U tide_left_prompt_items pwd os newline character
# set -U tide_right_prompt_items cmd_duration chruby go node php rustc time newline status git vi_mode
set -U tide_right_prompt_items cmd_duration chruby go node rustc crystal elixir docker kubectl aws terraform pulumi php gcloud private_mode nix_shell context vi_mode direnv distrobox toolbox jobs shlvl time newline status git