// RUN: not %pccc-opt %s 2>&1 | FileCheck %s --check-prefix=ERR-UNKNOWN

// ERR-UNKNOWN: unknown  type `ciphertxt` in dialect `pccc`
func.func @unknown_type(%bad: !pccc.ciphertxt) {
  return
}