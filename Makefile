export ARCHS = arm64 arm64e
export TARGET = iphone:clang:latest:14.0

THEOS_DEVICE_IP = 192.168.1.100
THEOS_DEVICE_PORT = 22

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AnimePhone
AnimePhone_FILES = Tweak.xm
AnimePhone_CFLAGS = -fobjc-arc
AnimePhone_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
