#!/bin/sh
cp .bash_profile ~/.bash_profile

# set up vim
rm ~/.vimrc
ln -s $PWD/.vimrc ~/.vimrc

if ls ~/.ssh/id* > /dev/null; then
  # configure git
  git config --global user.email "todd@selfassembled.org"
  git config --global user.name "Todd Kennedy"
  git config --global core.excludesfile ~/.gitignore
  git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
  git config --global alias.co "checkout"
  echo "*.sw?" >> ~/.gitignore

  # install asdf
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.6
  echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bash_profile
  echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bash_profile
  # set up asdf
  asdf plugin add ruby
  asdf plugin add deno
  asdf plugin add nodejs
  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

  echo "asdf installed, you need to still install versions of these tools"
else
  echo "No SSH keys were found. Try again"
fi
