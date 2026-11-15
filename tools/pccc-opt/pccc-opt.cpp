//
// Copyright 2026 Gleb Obitotsky
//
// SPDX-License-Identifier: Apache-2.0
//

#include "mlir/InitAllDialects.h"
#include "mlir/InitAllPasses.h"
#include "mlir/Tools/mlir-opt/MlirOptMain.h"
#include "pccc/PCCC.h"

int
main(int argc, char** argv) {
  mlir::DialectRegistry registry;

  mlir::registerAllDialects(registry);
  mlir::registerAllPasses();

  registry.insert<mlir::pccc::PCCCDialect>();

  return mlir::asMainReturnCode(
      mlir::MlirOptMain(argc, argv, "PCCC Homomorphic Encryption Toolchain", registry));
}
