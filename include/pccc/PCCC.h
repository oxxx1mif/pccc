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
#include "pccc/PCCCTypes.h.inc"

#include "pccc/PCCCDialect.h.inc"

#endif // PCCC_H