TARGET_DIR=/usr/local/share
SRC=jtcash_bash_functions
VRF=jtcash_compatibility_check_passed
.PHONY: check
check: $(SRC)
	@bash -c ". $(SRC)" && {\
		mkdir -pv "$(TARGET_DIR)" && touch "$(TARGET_DIR)/$(VRF)" && echo "check PASSED" || >&2 echo 'could not make install directory'; \
	} || echo 'check FAILED';


.PHONY: install
install: check $(SRC) $(vrf)
	@rm "$(TARGET_DIR)/$(VRF)";
	@cp -v "$(SRC)" "$(TARGET_DIR)/$(SRC)";


.PHONY: uninstall
uninstall:
	rm -v "$(TARGET_DIR)/$(SRC)" "$(TARGET_DIR)/$(VRF)";
