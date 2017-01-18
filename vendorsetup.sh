for device in $(cat vendor/cm/dnd.devices)
do
add_lunch_combo dnd_$device-userdebug
done
