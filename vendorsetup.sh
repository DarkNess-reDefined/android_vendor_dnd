for device in $(cat vendor/cm/dnd.devices)
do
add_lunch_combo cm_$device-eng
done
