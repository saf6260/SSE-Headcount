echo 'headcout system starting'

notify-headcount() {
  echo 'complete headcount now'
  start chrome http://www.youtube.com/watch?v=dQw4w9WgXcQ
  start chrome http://sse.rit.edu/go/headcount
  start chrome file:///Z:/profile.V2/Documents/headcount/index.html
}

while true; do
now=$(date +'%M')
echo $now

if (($now == 30)); then
  echo 'calling notify-headcount'
  notify-headcount & sleep 3600
elif (($now != 30)); then
  if (($now < 30)); then
    ((waitTime=30-$now))
  elif (($now > 30)); then
    ((waitTime=90-$now))
  fi
  echo "waiting for $waitTime"
  sleep ${waitTime}m
fi
done
