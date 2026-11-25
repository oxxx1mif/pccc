//
// Copyright 2026 Gleb Obitotsky
//
// SPDX-License-Identifier: Apache-2.0
//

#ifndef PCCC_H
#define PCCC_H

#include "mlir/IR/Dialect.h"
#include "mlir/IR/OpDefinition.h"

#define GET_TYPEDEF_CLASSES
#include "pccc/PCCCDialect.h.inc"
#include "pccc/PCCCTypes.h.inc"

#define GET_OP_CLASSES
#include "pccc/PCCCOps.h.inc"

#endif  // PCCC_H