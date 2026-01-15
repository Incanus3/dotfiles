function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

function switch-branch
  set --local branch (jj bookmark l -a -T 'name ++ "\n"' | fzf)
  jj bookmark track $branch@origin
  jj new $branch
end

if status is-interactive # Commands to run in interactive sessions can go here
    # No greeting
    set fish_greeting

    fzf --fish | source
    starship init fish | source
    mise activate fish | source

    source /etc/grc.fish

    fish_add_path -g ~/.local/bin

    # Aliases
    alias pamcan pacman
    alias clear "printf '\033[2J\033[3J\033[1;1H'"
    alias q 'qs -c ii'
    alias ls 'eza --icons'
    alias cat bat
    alias man batman
end
