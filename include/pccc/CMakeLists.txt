set(LLVM_TARGET_DEFINITIONS PCCC.td)

mlir_tablegen(PCCC.h.inc -gen-dialect-decls)
mlir_tablegen(PCCC.cpp.inc -gen-dialect-defs)

add_public_tablegen_target(PCCCTableGen)

add_library(PCCCInterfaces INTERFACE)
target_include_directories(PCCCInterfaces INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>
        $<BUILD_INTERFACE:${CMAKE_BINARY_DIR}/include>
)
add_dependencies(PCCCInterfaces PCCCTableGen)
