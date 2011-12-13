export THEOS_DEVICE_IP = localhost
export THEOS_DEVICE_PORT = 2222
GO_EASY_ON_ME = NO

include theos/makefiles/common.mk
TOOL_NAME = openurl
openurl_FILES = openurl.m
openurl_PRIVATE_FRAMEWORKS = AppSupport

TWEAK_NAME = OpenURL
OpenURL_FILES = Tweak.xm
Open_LDFLAGS = -ldisplaystack
OpenURL_FRAMEWORKS = UIKit
OpenURL_PRIVATE_FRAMEWORKS = AppSupport

include $(THEOS_MAKE_PATH)/tool.mk
include $(THEOS_MAKE_PATH)/tweak.mk