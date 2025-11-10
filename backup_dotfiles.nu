#!/usr/bin/env nu

const self_path = (path self)
let dest_dir = '~/dotfiles' | path expand
let sources = [
  .bashrc
  .bash_aliases
  .bash_profile
  .bash_logout
  .profile
  .gitconfig
  .ideavimrc
  .tmux.conf
  .tmuxinator
  .config/jj
  .config/mc
  .config/bat
  .config/zed
  .config/nvim
  .config/btop
  .config/htop
  .config/fish
  .config/hypr
  .config/kitty
  .config/zellij
  .config/ghostty
  .config/nushell
  .config/lazygit
  .config/breezerc
  .config/darklyrc
  .config/konsolerc
  .config/dolphinrc
  .config/yakuakerc
  .config/kdeglobals
  .config/television
  .config/environment.d
  .config/illogical-impulse
  .config/starship.toml
  .config/code-flags.conf
  .config/chrome-flags.conf
  .config/chromium-flags.conf
  .config/electron-flags.conf
  .config/JetBrains/IdeaIC2025.2/idea64.vmoptions
]

mkdir $dest_dir

for $it in $sources {
  let source_path = ('~/' + $it) | path expand
  let dest_path = $'($dest_dir)/($it)'

  print $"cp -ru ($source_path) ($dest_path)"
  rm -rf $dest_path
  mkdir (dirname $dest_path)
  cp -ru $source_path $dest_path
}

cp $self_path $'($dest_dir)/'

rm -rf $'($dest_dir)/.config/nushell/history.txt'
rm -rf $'($dest_dir)/.config/nvim/.git'
rm -rf $'($dest_dir)/.config/nvim/.jj'
