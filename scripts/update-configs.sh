#!/bin/bash

cd "$HOME"/etux/configs-partilhados || exit 1

git pull

notify-send -a "configs-partilhados" "Configs atualizados"
