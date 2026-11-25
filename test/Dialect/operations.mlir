// RUN: %pccc-opt %s | FileCheck %s

// CHECK-LABEL: func.func @add_roundtrip
func.func @add_roundtrip(%a: i32, %b: i32) -> i32 {
  // CHECK: %[[CT1:.*]] = pccc.encrypt %arg0 : i32 -> !pccc.ciphertext
  %0 = pccc.encrypt %a : i32 -> !pccc.ciphertext

  // CHECK: %[[CT2:.*]] = pccc.encrypt %arg1 : i32 -> !pccc.ciphertext
  %1 = pccc.encrypt %b : i32 -> !pccc.ciphertext

  // CHECK: %[[ADD:.*]] = pccc.add %[[CT1]], %[[CT2]] : !pccc.ciphertext, !pccc.ciphertext -> !pccc.ciphertext
  %2 = pccc.add %0, %1 : !pccc.ciphertext, !pccc.ciphertext -> !pccc.ciphertext

  // CHECK: %[[DEC:.*]] = pccc.decrypt %[[ADD]] : !pccc.ciphertext -> i32
  %3 = pccc.decrypt %2 : !pccc.ciphertext -> i32

  // CHECK: return %[[DEC]] : i32
  return %3 : i32
}

// CHECK-LABEL: func.func @distribute_roundtrip
func.func @distribute_roundtrip(%ct: !pccc.ciphertext) -> !pccc.ciphertext {
  // CHECK: %[[DIST:.*]] = pccc.distribute %arg0 : !pccc.ciphertext -> !pccc.ciphertext
  %0 = pccc.distribute %ct : !pccc.ciphertext -> !pccc.ciphertext

  // CHECK: return %[[DIST]] : !pccc.ciphertext
  return %0 : !pccc.ciphertext
}