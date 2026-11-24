//
// Copyright 2026 Gleb Obitotsky
//
// SPDX-License-Identifier: Apache-2.0
//

#ifndef PCCC_DIALECT_TD
#define PCCC_DIALECT_TD

include "mlir/IR/DialectBase.td"

def PCCCDialect : Dialect {
  let name = "pccc";
  let summary = "PCCC dialect for FHE cryptography";
  let description =
      [{
    This dialect provides operations and types for Fully Homomorphic Encryption.
  }];
  let cppNamespace = "::mlir::pccc";

  let useDefaultTypePrinterParser = 1;
}

#endif  // PCCC_DIALECT_TD
