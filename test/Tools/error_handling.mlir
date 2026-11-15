// RUN: %pccc-opt %s -split-input-file | FileCheck %s

// CHECK-LABEL: func.func @test1
func.func @test1() {
  return
}

// -----

// CHECK-LABEL: func.func @test2
func.func @test2() {
  return
}
