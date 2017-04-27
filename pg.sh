#/bin/bash
page=$1
while :
do
  ssh console "elinks -dump $page > page.txt"
  scp console:/home/oam/page.txt ./
  less page.txt
  read -p "URL:" page
  if [ "$page" == "exit" ]; then
    break
  fi
done
