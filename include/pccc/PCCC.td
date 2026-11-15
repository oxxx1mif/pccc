//
// Copyright 2026 Gleb Obitotsky
//
// SPDX-License-Identifier: Apache-2.0
//

#ifndef PCCC_DIALECT
#define PCCC_DIALECT

include "mlir/IR/DialectBase.td"

def PCCCDialect : Dialect {
  let name = "pccc";
  let summary = "PCCC dialect for FHE cryptography";
  let description = [{
    This dialect provides operations and types for Fully Homomorphic Encryption.
  }];
  let cppNamespace = "::mlir::pccc";
}

#endif // PCCC_DIALECT
