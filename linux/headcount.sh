echo 'headcout system starting'

notify-headcount() {
  echo 'complete headcount now'
  google-chrome index.html
  google-chrome http://sse.rit.edu/go/headcount
}

hour=$(date +'%I')

while true; do
now=$(date +'%M')
echo $now

if (($now == 30)); then
  echo 'calling notify-headcount'
  notify-headcount & sleep 3600;
elif (($now != 30)); then
  if (($now < 45)); then
    ((waitTime=30-$now))
    ((waittime=waittime *60))
    echo "time is less than 30 before time, waiting for $waitTime"
    sleep ${waitTime}m
  elif (($now > 30)); then
    ((waitTime=90-$now))
    echo "time is greater than 30 before time, waiting for $waitTime"
    sleep ${waitTime}m
  fi
fi
done
