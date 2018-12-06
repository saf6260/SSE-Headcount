#System to alert mentor on duty to complete headcount
#Author Scott Frauenknecht saf6260 
echo 'headcout system starting'

#Function for notifying the mentor to do headcount
notify-headcount() {
  echo 'complete headcount now'
  start chrome http://www.youtube.com/watch?v=dQw4w9WgXcQ
  start chrome http://sse.rit.edu/go/headcount
  start chrome file:///Z:/profile.V2/Documents/headcount/index.html
}

#Runs until the system is shut down by the user
while true; do
now=$(date +'%M')
echo $now

#Checks to see if the sysem is at 30 minutes
#If so, the function is called and the system sleeps for one hour
if (($now == 30)); then
  echo 'calling notify-headcount'
  notify-headcount & sleep 3600
#If its not :30, system calculates how many minutes til :30 and then sleeps
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
