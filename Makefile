
TARGET=install
PLATFORM=macos

all: $(TARGET)

install:
	bash $(PLATFORM)/init.sh
	@echo "Install complete"

uninstall:
	bash $(PLATFORM)/deinit.sh
	@(cd "$HOME" && echo "Uninstall complete")

