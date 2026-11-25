include "PCCCDialect.td"
include "PCCCTypes.td"
include "mlir/IR/OpBase.td"

class PCCC_Op<string mnemonic, list<Trait> traits = []>
    : Op<PCCCDialect, mnemonic, traits>;

def PCCC_EncryptOp : PCCC_Op<"encrypt"> {
  let summary = "Encrypt a plaintext into a ciphertext";
  let arguments = (ins AnyType:$input);
  let results = (outs PCCC_CiphertextType:$result);
  let assemblyFormat = "$input attr-dict `:` type($input) `->` type($result)";
}

def PCCC_DecryptOp : PCCC_Op<"decrypt"> {
  let summary = "Decrypt a ciphertext back to plaintext";
  let arguments = (ins PCCC_CiphertextType:$input);
  let results = (outs AnyType:$result);
  let assemblyFormat = "$input attr-dict `:` type($input) `->` type($result)";
}

def PCCC_AddOp : PCCC_Op<"add"> {
  let summary = "Homomorphic addition of two ciphertexts";
  let arguments = (ins PCCC_CiphertextType:$lhs, PCCC_CiphertextType:$rhs);
  let results = (outs PCCC_CiphertextType:$result);
  let assemblyFormat = "$lhs `,` $rhs attr-dict `:` type($lhs) `,` type($rhs) `->` type($result)";
}

def PCCC_DistributeOp : PCCC_Op<"distribute"> {
  let summary = "Distributed secure computation marker";
  let arguments = (ins AnyType:$input);
  let results = (outs AnyType:$result);
  let assemblyFormat = "$input attr-dict `:` type($input) `->` type($result)";
}