cmake_minimum_required(VERSION 3.20.0)
project(PCCCDialect LANGUAGES CXX C)

set(CMAKE_CXX_STANDARD 17 CACHE STRING "C++ standard to conform to")

find_package(LLVM REQUIRED CONFIG PATHS /usr/lib/llvm-23/lib/cmake/llvm NO_DEFAULT_PATH)
find_package(MLIR REQUIRED CONFIG PATHS /usr/lib/llvm-23/lib/cmake/mlir NO_DEFAULT_PATH)

message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")
message(STATUS "Using MLIRConfig.cmake in: ${MLIR_DIR}")

list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")

include(TableGen)
include(AddLLVM)
include(AddMLIR)

include_directories(${LLVM_INCLUDE_DIRS})
include_directories(${MLIR_INCLUDE_DIRS})
link_directories(${LLVM_BUILD_LIBRARY_DIR})
add_definitions(${LLVM_DEFINITIONS})

add_subdirectory(include/pccc)
add_subdirectory(lib/pccc)
add_subdirectory(tools/pccc-opt)

enable_testing()

find_program(LLVM_LIT_EXECUTABLE 
  NAMES lit llvm-lit llvm-lit-23
  PATHS /usr/bin /usr/local/bin /usr/lib/llvm-23/bin
)

if(NOT LLVM_LIT_EXECUTABLE)
  find_program(LLVM_LIT_EXECUTABLE NAMES lit llvm-lit llvm-lit-23)
endif()

if(NOT LLVM_LIT_EXECUTABLE)
  message(WARNING "lit not found! Tests will be skipped. Install via: sudo apt install llvm-23-tools")
else()
  message(STATUS "Using lit: ${LLVM_LIT_EXECUTABLE}")
  set(LLVM_EXTERNAL_LIT ${LLVM_LIT_EXECUTABLE} CACHE PATH "Path to lit" FORCE)
  set(PCCC_TOOLS_DIR ${CMAKE_BINARY_DIR}/tools/pccc-opt)
  set(PCCC_LIB_DIR ${CMAKE_BINARY_DIR}/lib)
  set(MLIR_TOOLS_DIR /usr/lib/llvm-23/bin)
  set(LLVM_TOOLS_BINARY_DIR /usr/lib/llvm-23/bin)
  add_subdirectory(test)
endif()
