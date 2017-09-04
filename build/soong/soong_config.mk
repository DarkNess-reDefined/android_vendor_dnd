# Insert new variables inside the DND structure
lineage_soong:
	$(hide) mkdir -p $(dir $@)
	$(hide) (\
	echo '{'; \
	echo '"DarkNess-reDefined": {'; \
	echo '},'; \
	echo '') > $(SOONG_VARIABLES_TMP)
