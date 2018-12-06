#System for notifying mentors about headcount
#Author Scott Frauenknecht saf6260
echo 'headcout system starting'

#Fuction for sending info to console and for opening the windows
notify-headcount() {
  echo 'complete headcount now'
  google-chrome index.html
  google-chrome http://sse.rit.edu/go/headcount
}

#Running the loop of updates until the user closes the bash window
while true; do
now=$(date +'%M')
echo $now

#Checking to see if the number of seconds is at 30
#If so, calls the function and then sleeps for 1 hour
if (($now == 30)); then
  echo 'calling notify-headcount'
  notify-headcount & sleep 3600;
#Now the system will attempt to find how much time there is til :30 min
#Once found, the system sleeps for that many minutes
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
