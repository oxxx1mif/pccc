//
// Copyright 2026 Gleb Obitotsky
//
// SPDX-License-Identifier: Apache-2.0
//

#include "pccc/PCCC.h"

#include "llvm/ADT/TypeSwitch.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/DialectImplementation.h"

using namespace mlir;
using namespace mlir::pccc;

#include "pccc/PCCCDialect.cpp.inc"

#define GET_TYPEDEF_CLASSES
#include "pccc/PCCCTypes.cpp.inc"

#define GET_OP_CLASSES
#include "pccc/PCCCOps.cpp.inc"

void
PCCCDialect::initialize() {
  addTypes<
#define GET_TYPEDEF_LIST
#include "pccc/PCCCTypes.cpp.inc"
      >();
  addOperations<
#define GET_OP_LIST
#include "pccc/PCCCOps.cpp.inc"
      >();
}