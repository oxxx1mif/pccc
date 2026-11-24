//
// Copyright 2026 Gleb Obitotsky
//
// SPDX-License-Identifier: Apache-2.0
//

#ifndef PCCC_TYPES_TD
#define PCCC_TYPES_TD

include "mlir/IR/AttrTypeBase.td"
include "PCCCDialect.td"

def PCCC_CiphertextType : TypeDef<PCCCDialect, "Ciphertext"> {
  let mnemonic = "ciphertext";
  let summary = "OpenFHE ciphertext";
  let description = [{}];
  let assemblyFormat = "";
}

def PCCC_ContextType : TypeDef<PCCCDialect, "Context"> {
  let mnemonic = "context";
  let summary = "OpenFHE crypto context";
  let description = [{}];
  let assemblyFormat = "";
}

#endif  // PCCC_TYPES_TD