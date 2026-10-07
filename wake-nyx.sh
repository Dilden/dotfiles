# ~/.bashrc: executed by bash(1) for non-login shells.
NYX_IP=nyx.closingtags
NYX_MAC=58:11:22:2d:f0:96

## wake the titaness from her slumber
wakeonlan -i $NYX_IP $NYX_MAC


# 5 checks
for i in $(seq 1 5);
do
  # pause 3 seconds
  sleep 3
  if ping -c 1 $NYX_IP &> /dev/null
  then
    echo "titaness awoken!"
    break;
  else
    echo "her sleep persists..."
  fi
done
