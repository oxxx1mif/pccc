//
// Copyright 2026 Gleb Obitotsky
//
// SPDX-License-Identifier: Apache-2.0
//

#include "mlir/IR/BuiltinOps.h"
#include "mlir/InitAllDialects.h"
#include "mlir/InitAllPasses.h"
#include "mlir/Pass/Pass.h"
#include "mlir/Tools/mlir-opt/MlirOptMain.h"
#include "pccc/PCCC.h"

namespace {
struct PCCCAnalysisPass : mlir::PassWrapper<PCCCAnalysisPass, mlir::OperationPass<mlir::ModuleOp>> {
  MLIR_DEFINE_EXPLICIT_INTERNAL_INLINE_TYPE_ID(PCCCAnalysisPass)

  llvm::StringRef
  getArgument() const final {
    return "pccc-analysis";
  }
  llvm::StringRef
  getDescription() const final {
    return "PCCC security analysis";
  }

  void
  runOnOperation() override {
    int enc = 0, dec = 0, add = 0, dist = 0;
    getOperation().walk([&](mlir::Operation* op) {
      if (mlir::isa<mlir::pccc::EncryptOp>(op))
        ++enc;
      else if (mlir::isa<mlir::pccc::DecryptOp>(op))
        ++dec;
      else if (mlir::isa<mlir::pccc::AddOp>(op))
        ++add;
      else if (mlir::isa<mlir::pccc::DistributeOp>(op))
        ++dist;
    });

    llvm::errs() << "\n[PCCC Analysis]\n";
    llvm::errs() << "  encrypt operations: " << enc << "\n";
    llvm::errs() << "  decrypt operations: " << dec << "\n";
    llvm::errs() << "  add operations: " << add << "\n";
    llvm::errs() << "  distribute operations: " << dist << "\n";

    if (dec > 0)
      llvm::errs() << "[PCCC] WARNING: " << dec << " decrypt op(s) — potential side-channel risk\n";
  }
};
}  // namespace

int
main(int argc, char** argv) {
  mlir::DialectRegistry registry;

  mlir::registerAllDialects(registry);
  mlir::registerAllPasses();
  mlir::PassRegistration<PCCCAnalysisPass>();

  registry.insert<mlir::pccc::PCCCDialect>();

  return mlir::asMainReturnCode(
      mlir::MlirOptMain(argc, argv, "PCCC Homomorphic Encryption Toolchain", registry));
}