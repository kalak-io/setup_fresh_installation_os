#! /usr/bin/env bash

PERSONAL="
    git@gitlab.com:kalak/py_utils.git
    git@github.com:kalak-io/reduce_pdf_size.git
    git@github.com:kalak-io/archives_extractor.git
"

UNIFAI="
    git@gitlab.com:unifai/free-trial.git
    git@gitlab.com:unifai/indiana.git
    git@gitlab.com:unifai/indiana-api.git
"

echo "Pulling git repositories"
# Create ssh key
SSH_KEY=$HOME/.ssh/id_rsa
if [ ! -f "$SSH_KEY" ]; then
    echo "Generating ssh key"
    ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa 2>/dev/null <<< y >/dev/null -b 4096 -C "clement@unifai.fr"
    eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa
    xclip -sel clip < $HOME/.ssh/id_rsa.pub
    echo "Contents of the id_rsa.pub copied!"
    read -rp 'Did you add your ssh keys in different git services ? Y or N ' answer
    if [ "$answer" = 'N' ] || [ "$answer" = 'n' ]; then
        exit 1
    fi
fi

# Personal repositories
mkdir -p $HOME/Documents/projects/personal && cd $_
for p in $PERSONAL; do
    git clone $p;
done

# UNiFAi repositories
mkdir -p $HOME/Documents/projects/professional/unifai && cd $_
for u in $UNIFAI; do
    git clone $u;
done

cd
