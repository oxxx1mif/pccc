// RUN: %pccc-opt %s | FileCheck %s

// CHECK-LABEL: func.func @simple
func.func @simple() {
  return
}
