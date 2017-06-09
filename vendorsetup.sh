for device in $(cat vendor/dnd/dnd.devices)
do
add_lunch_combo dnd_$device-userdebug
done
