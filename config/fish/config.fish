set -g fish_greeting

# set -g autopair_tab false
if status is-interactive
    #fastfetch
    starship init fish | source
    zoxide init fish   | source

    #------------------------------------
    #File_Path
    #------------------------------------
    # fish_add_path /usr/local/go/bin
    fish_add_path ~/.local/share/bin

    #------------------------------------
    #Aliases
    #------------------------------------

    alias src='source ~/.config/fish/config.fish'
    alias cls='clear'
    alias cd="z"
    alias v="nvim"
    alias gpp="g++"
    # alias cpy="wl-copy"
    # alias z="zellij"
    
    # alias list exa
    alias  l='eza -al --color=always --group-directories-first --icons' # preferred listing
    alias la='eza -a --color=always --group-directories-first --icons'  # all files and dirs
    alias ll='eza -l --color=always --group-directories-first --icons'  # long format
    alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
    alias l.="eza -a | grep -e '^\.'"                                   # show only dotfiles
    # Back when I was using lagacy distro Arch  ||| pacman alias
    alias u='sudo pacman -Syu'
    alias i='sudo pacman -S'
    alias s='pacman -Ss'
    alias q='pacman -Qs'
    alias d='sudo pacman -R'
    alias rns='sudo pacman -Rns'

    #Post Morden Distro alias
    #NixOS
    alias nixbuild='sudo nixos-rebuild --flake ~/grv-dots#grv'
    alias nixswitch='~/grv-dots/config/scripts/rebuild.sh'
    


    #------------------------------------
    #Binds
    #------------------------------------
    bind \b backward-kill-word
    bind \e\[Z 'complete --list'
    
    #------------------------------------
    #Functions
    #------------------------------------
    function mkcd
        mkdir -p $argv[1]; and cd $argv[1]
    end

    function fzf_history 
        set -l cmd (history | fzf --height 40% --reverse | string collect)
        and commandline -- $cmd
    end 
    bind \cr fzf_history

    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    function f
        nautilus $argv &; disown
    end   

end
