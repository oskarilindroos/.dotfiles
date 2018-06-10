#!/bin/bash -e
i3-msg "workspace 1 home; append_layout ~/.i3/workspace-1.json"
urxvt -name "terminal" -e $SHELL -c 'screenfetch;$SHELL -i'&
urxvt -name "cmatrix" -e $SHELL -c 'cmatrix;$SHELL -i'&
urxvt -name "htop" -e $SHELL -c 'htop;$SHELL -i'&
urxvt -name "ranger" -e $SHELL -c 'ranger;$SHELL -i'&
