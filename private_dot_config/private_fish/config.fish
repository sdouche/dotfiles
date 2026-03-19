if status is-interactive
    mise activate fish | source
    starship init fish | source
    zoxide init fish | source
    fzf --fish | source
    op completion fish | source
    jj util completion fish | source
    chezmoi completion fish | source
    #carapace _carapace | source
else
    mise activate fish --shims | source
end

set -gx PYENV_ROOT $HOME/.pyenv
set -gx GOENV_ROOT /usr/local/go
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.krew/bin
fish_add_path $PYENV_ROOT/bin
fish_add_path $GOENV_ROOT
fish_add_path $HOME/.local/share/mise/shims

set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional

abbr -a tiga "tig --all"
abbr -a gitka "gitk --all"
abbr -a sysctl systemctl
abbr -a jctl journalctl
abbr -a h helm
abbr -a tf terraform
abbr -a k kubecolor
abbr -a krew "kubectl krew"

alias ls="eza --icons=always"
alias vim=nvim
alias kubectl="kubecolor"
alias ctx="kubectl ctx"
alias assume="source ~/.config/fish/assume.fish"

set fzf_preview_dir_cmd eza --all --color=always
set fzf_diff_highlighter delta --paging=never --width=20

# pnpm
set -gx PNPM_HOME "/home/sdouche/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# 1Password op plugins
#source ~/.config/op/plugins.sh

# Completions
#source $HOME/.tenv.completion.fish
test -f ~/.kubectl_aliases.fish && source ~/.kubectl_aliases.fish
test -f ~/.config/fish/completions/granted.fish && source ~/.config/fish/completions/granted.fish

# Load local configuration file
test -f ~/.config/fish/config.local.fish && source ~/.config/fish/config.local.fish
