# Emacs mode
set -x fish_key_bindings fish_default_key_bindings

# Set paths
set -x GOPATH $HOME/src/go
set -x GOENV_ROOT $HOME/.goenv
set -x PYENV_ROOT $HOME/.pyenv
set -x ISTIO_ROOT $HOME/bin/istio
set -x KREW_ROOT $HOME/.krew
set -x PATH $PATH /snap/bin $HOME/bin $PYENV_ROOT/bin $GOPATH/bin $GOENV_ROOT/bin $ISTIO_ROOT/bin $KREW_ROOT/bin
set -x CLOUDSDK_PYTHON python3
set -x KP_DEPLOYMENT_SAFEGUARD 0

# Alias
alias gam="~/bin/gam/gam"
alias git="hub"

# Abbrevation
abbr -a tiga "tig --all"
abbr -a gitka "gitk --all"
abbr -a g "gcloud"
abbr -a sysctl "systemctl"
abbr -a jctl "journalctl"
abbr -a h "helm"
abbr -a tf "terraform"
abbr -a tf11 "terraform011"
abbr -a awssh "awless ssh"
abbr -a krew "kubectl krew"

# Kubernetes alias
#source '/home/sdouche/.kubectl_aliases'

# Pyenv
status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

# Goenv
status --is-interactive; and source (goenv init -|psub)

# Theme configuration
#set -g theme_display_git no
#set -g theme_display_git_dirty no
#set -g theme_display_git_untracked no
#set -g theme_display_git_ahead_verbose no
#set -g theme_display_git_dirty_verbose no
#set -g theme_display_git_stashed_verbose no
#set -g theme_display_git_master_branch no
#set -g theme_git_worktree_support no
set -g theme_display_vagrant no
set -g theme_display_docker_machine no
set -g theme_display_k8s_context yes
set -g theme_display_hg no
set -g theme_display_virtualenv no
set -g theme_display_ruby no
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_display_vi no
set -g theme_display_date no
set -g theme_display_cmd_duration no
set -g theme_title_display_process no
set -g theme_title_display_path no
set -g theme_title_display_user no
set -g theme_title_use_abbreviated_path no
#set -g theme_date_format "+%a %H:%M"
set -g theme_date_format "+%H:%M:%S %Y-%m-%d  "
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts no
set -g theme_show_exit_status yes
set -g default_user sdouche
set -g theme_color_scheme gruvbox
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 0
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '

set SPACEFISH_PROMPT_ORDER time user dir host git package node docker ruby golang php rust gcloud aws conda pyenv kubecontext exec_time line_sep battery jobs exit_code char

# The next line updates PATH for the Google Cloud SDK.
source '/home/sdouche/bin/google-cloud-sdk/path.fish.inc'

#export AWS_PROFILE=default

