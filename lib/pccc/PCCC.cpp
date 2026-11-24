//
// Copyright 2026 Gleb Obitotsky
//
// SPDX-License-Identifier: Apache-2.0
//

#include "pccc/PCCC.h"
#include "mlir/IR/Builders.h"
#include "mlir/IR/DialectImplementation.h"
#include "llvm/ADT/TypeSwitch.h"

using namespace mlir;
using namespace mlir::pccc;

#include "pccc/PCCCDialect.cpp.inc"

#define GET_TYPEDEF_CLASSES
#include "pccc/PCCCTypes.cpp.inc"

void PCCCDialect::initialize() {
  addTypes<
#define GET_TYPEDEF_LIST
#include "pccc/PCCCTypes.cpp.inc"
      >();
}