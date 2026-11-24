// RUN: %pccc-opt %s | FileCheck %s

// CHECK-LABEL: func.func @basic_roundtrip
func.func @basic_roundtrip(%ctx: !pccc.context, %ct: !pccc.ciphertext) -> (!pccc.ciphertext, !pccc.context) {
  // CHECK: return {{.*}}, {{.*}} : !pccc.ciphertext, !pccc.context
  return %ct, %ctx : !pccc.ciphertext, !pccc.context
}

// CHECK-LABEL: func.func @complex_signature
func.func @complex_signature(
  %ctx1: !pccc.context,
  %ctx2: !pccc.context,
  %ct1: !pccc.ciphertext,
  %ct2: !pccc.ciphertext
) -> !pccc.ciphertext {
  // CHECK: return {{.*}} : !pccc.ciphertext
  return %ct1 : !pccc.ciphertext
}

// CHECK-LABEL: func.func @type_casting
func.func @type_casting(%arg: i32) {
  // CHECK: %[[CT:.*]] = builtin.unrealized_conversion_cast {{.*}} : i32 to !pccc.ciphertext
  %0 = builtin.unrealized_conversion_cast %arg : i32 to !pccc.ciphertext

  // CHECK: %[[CTX:.*]] = builtin.unrealized_conversion_cast %[[CT]] : !pccc.ciphertext to !pccc.context
  %1 = builtin.unrealized_conversion_cast %0 : !pccc.ciphertext to !pccc.context

  return
}