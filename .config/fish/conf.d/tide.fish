# set -g tide_right_prompt_items cmd_duration chruby go node rustc crystal elixir docker kubectl aws terraform pulumi php gcloud private_mode nix_shell context vi_mode direnv distrobox toolbox jobs time newline status git
# set -g tide_right_prompt_items chruby go node rustc crystal elixir docker aws terraform pulumi php gcloud private_mode nix_shell context vi_mode direnv distrobox toolbox time newline git
set -g tide_right_prompt_items python node rustc crystal elixir aws terraform pulumi php gcloud private_mode nix_shell context vi_mode direnv distrobox toolbox time newline git
set -g tide_left_prompt_items pwd os newline character

set -g fish_color_command ffffff
set -g fish_color_operator brcyan
set -g fish_color_param ffcc00
set -g fish_color_quote 9c87c9
set -g fish_color_host normal
set -g fish_color_normal normal
set -g fish_color_error dddddd
set -g fish_color_comment dddddd

set -U fish_key_bindings fish_default_key_bindings
# either one
# set -g tide_character_bg_color 268bd2
set -g tide_character_bg_color normal

set -g tide_os_bg_color ff5500
set -g tide_os_color ffffff
set -g tide_pwd_bg_color 424242
# set -g tide_git_bg_color 4e387e
set -g tide_git_bg_color ff8800
set -g tide_git_bg_color_urgent cc0000
set -g tide_git_color_dirty ffffff

set -g tide_git_bg_color_unstable ff8800
set -g tide_git_color_branch ffffff
set -g tide_git_color_conflicted ffffff
set -g tide_git_color_dirty ffffff
set -g tide_git_color_operation ffffff
set -g tide_git_color_staged ffffff
set -g tide_git_color_stash ffffff
set -g tide_git_color_unstable ffffff
set -g tide_git_color_untracked ffffff
set -g tide_git_color_upstream ffffff

set -g tide_node_color ffffff
set -g tide_rustc_bg_color 838996
set -g tide_rustc_color 000000
set -g tide_rustc_icon 
set -g tide_go_color dddddd
set -g tide_cmd_duration_bg_color fac5a6
set -g tide_cmd_duration_color 424242
set -g tide_cmd_duration_icon ⎈
set -g tide_character_color fac5a6
# set -g tide_character_icon ❯
set -g tide_character_icon 
set -g tide_pwd_color grey
set -g tide_git_icon 
set -g tide_shlvl_bg_color 049189
set -g tide_shlvl_color cccccc
set -g tide_shlvl_icon 
set -g tide_docker_bg_color 234f1e
set -g tide_docker_color aaaaaa