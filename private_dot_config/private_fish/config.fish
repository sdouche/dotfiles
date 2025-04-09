if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux GOENV_ROOT /usr/local/go
fish_add_path $GOENV_ROOT/bin
fish_add_path $PYENV_ROOT/bin
fish_add_path /home/sdouche/.local/bin

abbr -a tiga "tig --all"
abbr -a gitka "gitk --all"
abbr -a sysctl "systemctl"
abbr -a jctl "journalctl"
abbr -a h "helm"
abbr -a tf "terraform"
abbr -a krew "kubectl krew"

alias ls="eza --icons=always"
#alias cd=z
alias vim=nvim

starship init fish | source
zoxide init fish | source
op completion fish | source
pyenv init - | source
status --is-interactive; and source (pyenv virtualenv-init -|psub)

set fzf_preview_dir_cmd eza --all --color=always
set fzf_diff_highlighter delta --paging=never --width=20

function fish_user_key_bindings
  bind \cs 'pet-select'
end
