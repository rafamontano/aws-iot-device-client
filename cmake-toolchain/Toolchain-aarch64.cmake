# this one is important
SET(CMAKE_SYSTEM_NAME Linux)
#this one not so much
SET(CMAKE_SYSTEM_VERSION 1)

variable_watch(PKG_CONFIG_PATH)
set(PKG_CONFIG_EXECUTABLE "/usr/bin/pkg-config")

# specify the cross compiler
SET(CMAKE_C_COMPILER   /usr/bin/aarch64-linux-gnu-gcc)
SET(CMAKE_CXX_COMPILER /usr/bin/aarch64-linux-gnu-g++)

# where is the target environment 
SET(CMAKE_FIND_ROOT_PATH  /usr/lib/aarch64-linux-gnu;/usr/aarch64-linux-gnu)

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY BOTH)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH) 

SET(CMAKE_CROSSCOMPILING 1)

SET(S2N_NO_PQ ON)
SET(CMAKE_FIND_DEBUG_MODE TRUE)

SET(CMAKE_SYSTEM_PROCESSOR "aarch64")

include_directories(/usr/include)
