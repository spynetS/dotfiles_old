# ! /bin/sh

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep1; done

# # polybar top &

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload top &
  done
else
  polybar --reload top &
fi
