
TARGET=install
PLATFORM=macos

all: $(TARGET)

install:
	bash $(PLATFORM)/init.sh

uninstall:
	bash $(PLATFORM)/deinit.sh

