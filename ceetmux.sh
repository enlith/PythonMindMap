#!/bin/sh
if [ -z ${TMUX+x} ] ; then
  tmux new-session -d -s CEE 
else
  echo "Starting..."
fi
tmux new-window -n 'fuel' 'ssh root@fuel'
tmux new-window -n 'cic' 'ssh root@cic'
tmux new-window -n 'trafficSW' 'ssh admin@trafficsw'
tmux new-window -n 'controlSW' 'ssh admin@controlsw'
tmux new-window -n 'deploy' 'ssh ubuntu@CEEdeploy'
if [ -z "$TMUX" ] ; then
  xterm -T "CEE Env" -n 'CEE Env' -e 'tmux -2 attach -d -t CEE'& 
else
  echo "Created windows fuel,cic,trafficsw,controlsw,deploy"
fi
