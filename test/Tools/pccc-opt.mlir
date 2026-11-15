// RUN: %pccc-opt %s | FileCheck %s

// CHECK-LABEL: func.func @test1
func.func @test1() {
  return
}
