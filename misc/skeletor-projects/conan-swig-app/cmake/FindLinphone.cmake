

find_path(LINPHONE_INC_DIR
  NAMES linphone/linphonecore.h
  REQUIRED
  HINTS "C:/sdk/linphone-sdk-Win32-4.4.7/linphone-sdk/desktop/include")

find_library(LINPHONE_LIB
  NAMES linphone liblinphone
  REQUIRED
  HINTS "c:/sdk/linphone-sdk-Win32-4.4.7/linphone-sdk/desktop/"
  PATH_SUFFIXES lib)

find_library(LINPHONE_BELLESIP_LIB
  NAMES bellesip
  REQUIRED
  HINTS "c:/sdk/linphone-sdk-Win32-4.4.7/linphone-sdk/desktop/"
  PATH_SUFFIXES lib)

find_library(LINPHONE_MEDIASTREAMER_LIB
  NAMES mediastreamer
  REQUIRED
  HINTS "c:/sdk/linphone-sdk-Win32-4.4.7/linphone-sdk/desktop/"
  PATH_SUFFIXES lib)

find_library(LINPHONE_BELR_LIB
  NAMES belr
  REQUIRED
  HINTS "c:/sdk/linphone-sdk-Win32-4.4.7/linphone-sdk/desktop/"
  PATH_SUFFIXES lib)

find_path(LINPHONE_BIN_DIR
  NAMES linphone.dll liblinphone.dll
  REQUIRED
  HINTS "c:/sdk/linphone-sdk-Win32-4.4.7/linphone-sdk/desktop/"
  PATH_SUFFIXES bin)


message("${LINPHONE_BIN_DIR}")

file(GLOB  LINPHONE_BIN_FILES ${LINPHONE_BIN_DIR}/*.dll)
message("${LINPHONE_BIN_FILES}")

set(        LINPHONE_LIBRARIES ${LINPHONE_LIB})
list(APPEND LINPHONE_LIBRARIES ${LINPHONE_BELLESIP_LIB})
list(APPEND LINPHONE_LIBRARIES ${LINPHONE_MEDIASTREAMER_LIB})
list(APPEND LINPHONE_LIBRARIES ${LINPHONE_BELR_LIB})
