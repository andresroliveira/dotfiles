#!/bin/sh

# Sai imediatamente se um comando falhar
set -e

create_symlink() {
    local target=$1
    local link_name=$2

    # Verifica se o link já existe
    if [ -e "$link_name" ]; then
        # Pergunta ao usuário se quer sobrescrever
        read -p "O link '$link_name' já existe. Deseja sobrescrever? (s/N) " confirm_overwrite
        
        # Converte a resposta para minúsculas e verifica
        if [ "$confirm_overwrite" = "s" ] || [ "$confirm_overwrite" = "S" ]; then
            echo "Sobrescrevendo link '$link_name'..."
            # Remove o link existente antes de criar um novo
            rm "$link_name"
            if ln -sn "$target" "$link_name"; then
                echo "Link simbólico '$link_name' sobrescrito com sucesso."
            else
                echo "ERRO: Falha ao sobrescrever o link simbólico '$link_name'." >&2
            fi
        else
            echo "Operação cancelada para '$link_name'. Ignorando."
        fi
    else
        echo "Criando link simbólico de '$target' para '$link_name'..."
        # Cria o link simbólico
        if ln -sn "$target" "$link_name"; then
            echo "Link simbólico '$link_name' criado com sucesso."
        else
            echo "ERRO: Falha ao criar o link simbólico '$link_name'." >&2
        fi
    fi
}

# --- Chamadas da função ---
# create_symlink ~/dotfiles/i3status ~/.config/i3status
# create_symlink ~/dotfiles/ghostty ~/.config/ghostty
# create_symlink ~/dotfiles/sway ~/.config/sway
# create_symlink ~/dotfiles/emacs ~/.emacs.d
# create_symlink ~/dotfiles/vim/vimrc ~/.vimrc
# create_symlink ~/dotfiles/zathura ~/.config/zathura
# create_symlink ~/dotfiles/chrome/chrome-flags.conf ~/.config/chrome-flags.conf
# create_symlink ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
# create_symlink ~/dotfiles/waybar ~/.config/waybar
# create_symlink ~/dotfiles/git/gitconfig ~/.gitconfig
# create_symlink ~/dotfiles/bat ~/.config/bat
create_symlink ~/dotfiles/swaync ~/.config/swaync
