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
  .config/nvim
  .config/btop
  .config/htop
  .config/fish
  .config/zed
  .config/zellij
  .config/hypr
  .config/kitty
  .config/ghostty
  .config/nushell
  .config/starship.toml
  .config/environment.d
  .config/kdeglobals
  .config/konsolerc
  .config/dolphinrc
  .config/breezerc
  .config/darklyrc
  .config/yakuakerc
  .config/illogical-impulse
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
