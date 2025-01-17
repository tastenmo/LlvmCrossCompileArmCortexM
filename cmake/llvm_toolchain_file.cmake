set(CLANG_COMPILER_PATH_PREFIX ${LLVM_TOOLCHAIN_PATH}/bin)

# Without that you will get linking error related to no _exit symbol when CMake tests gcc compile.
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

set(CMAKE_SYSTEM_NAME Generic)

set(CMAKE_C_COMPILER ${CLANG_COMPILER_PATH_PREFIX}/clang)
set(CMAKE_CXX_COMPILER ${CLANG_COMPILER_PATH_PREFIX}/clang++)
set(CMAKE_ASM_COMPILER ${CLANG_COMPILER_PATH_PREFIX}/clang)
set(CMAKE_LINKER ${CLANG_COMPILER_PATH_PREFIX}/lld)

set(CMAKE_AR ${CLANG_COMPILER_PATH_PREFIX}/llvm-ar)
set(CMAKE_OBJCOPY ${CLANG_COMPILER_PATH_PREFIX}/llvm-objcopy)
set(CMAKE_OBJCOPY_BIN ${CLANG_COMPILER_PATH_PREFIX}/llvm-objcopy)
set(CMAKE_RANLIB ${CLANG_COMPILER_PATH_PREFIX}/llvm-ranlib)
set(CMAKE_STRIP ${CLANG_COMPILER_PATH_PREFIX}/llvm-strip)
set(CMAKE_SIZE_BIN ${CLANG_COMPILER_PATH_PREFIX}/llvm-size)
set(CMAKE_NM ${CLANG_COMPILER_PATH_PREFIX}/llvm-nm)

set(LLVM_BAREMETAL_ARM_TARGET_COMPILE_FLAGS "-mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16" CACHE STRING
    "Basic target flags which define the cross-compile target")

string(CONCAT basic_flags
    ${LLVM_BAREMETAL_ARM_TARGET_COMPILE_FLAGS}
    " -fdata-sections -ffunction-sections"
    # Those flags are needed to use newlib from the ARM GNU GCC toolchain
    " --sysroot=${ARM_GNU_TOOLCHAIN_PATH}/arm-none-eabi"
    " -isystem ${ARM_GNU_TOOLCHAIN_PATH}/arm-none-eabi/include"
)

set(CMAKE_C_FLAGS_INIT "${basic_flags}")
set(CMAKE_CXX_FLAGS_INIT "${basic_flags}")
set(CMAKE_ASM_FLAGS_INIT  "${basic_flags}")

set(CMAKE_C_COMPILER_TARGET arm-none-eabi)
set(CMAKE_CXX_COMPILER_TARGET arm-none-eabi)
set(CMAKE_ASM_COMPILER_TARGET arm-none-eabi)

set(CMAKE_ASM_FLAGS_MINSIZEREL "-Oz -DNDEBUG" CACHE STRING "")
set(CMAKE_C_FLAGS_MINSIZEREL "-Oz -DNDEBUG" CACHE STRING "")
set(CMAKE_CXX_FLAGS_MINSIZEREL "-Oz -DNDEBUG" CACHE STRING "")
