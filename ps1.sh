pwd | perl -ne 's|'"$HOME"'|~|g;s/(\/.)(\w+-\w+|\w+)(?=\/)/\1/g; print'
