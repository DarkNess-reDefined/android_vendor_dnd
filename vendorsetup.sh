for device in $(cat vendor/dnd/dnd.devices)
do
add_lunch_combo dnd_$device-userdebug
add_lunch_combo dnd_$device-user
add_lunch_combo dnd_$device-eng
done
