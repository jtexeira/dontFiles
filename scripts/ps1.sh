echo -ne "\033]0;$(pwd | sed -r 's|'"$HOME"'|~|g') - $TERMINAL\007"
pwd | perl -ne 's|^'"$HOME"'|~|g; s|(\/\.?.).*?(?=\/)|\1|g; print'
