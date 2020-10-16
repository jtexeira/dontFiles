pwd | perl -ne 's|^'"$HOME"'|~|g; s|(\/\.?.).*?(?=\/)|\1|g; print'
