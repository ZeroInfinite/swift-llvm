// RUN: llvm-mc -triple=aarch64 -show-encoding -mattr=+sve < %s \
// RUN:        | FileCheck %s --check-prefixes=CHECK-ENCODING,CHECK-INST
// RUN: not llvm-mc -triple=aarch64 -show-encoding < %s 2>&1 \
// RUN:        | FileCheck %s --check-prefix=CHECK-ERROR
// RUN: llvm-mc -triple=aarch64 -filetype=obj -mattr=+sve < %s \
// RUN:        | llvm-objdump -d -mattr=+sve - | FileCheck %s --check-prefix=CHECK-INST
// RUN: llvm-mc -triple=aarch64 -filetype=obj -mattr=+sve < %s \
// RUN:        | llvm-objdump -d - | FileCheck %s --check-prefix=CHECK-UNKNOWN


// ---------------------------------------------------------------------------//
// Test 64-bit form (x0) and its aliases
// ---------------------------------------------------------------------------//
uqincd  x0
// CHECK-INST: uqincd  x0
// CHECK-ENCODING: [0xe0,0xf7,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: e0 f7 f0 04 <unknown>

uqincd  x0, all
// CHECK-INST: uqincd  x0
// CHECK-ENCODING: [0xe0,0xf7,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: e0 f7 f0 04 <unknown>

uqincd  x0, all, mul #1
// CHECK-INST: uqincd  x0
// CHECK-ENCODING: [0xe0,0xf7,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: e0 f7 f0 04 <unknown>

uqincd  x0, all, mul #16
// CHECK-INST: uqincd  x0, all, mul #16
// CHECK-ENCODING: [0xe0,0xf7,0xff,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: e0 f7 ff 04 <unknown>


// ---------------------------------------------------------------------------//
// Test 32-bit form (w0) and its aliases
// ---------------------------------------------------------------------------//

uqincd  w0
// CHECK-INST: uqincd  w0
// CHECK-ENCODING: [0xe0,0xf7,0xe0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: e0 f7 e0 04 <unknown>

uqincd  w0, all
// CHECK-INST: uqincd  w0
// CHECK-ENCODING: [0xe0,0xf7,0xe0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: e0 f7 e0 04 <unknown>

uqincd  w0, all, mul #1
// CHECK-INST: uqincd  w0
// CHECK-ENCODING: [0xe0,0xf7,0xe0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: e0 f7 e0 04 <unknown>

uqincd  w0, all, mul #16
// CHECK-INST: uqincd  w0, all, mul #16
// CHECK-ENCODING: [0xe0,0xf7,0xef,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: e0 f7 ef 04 <unknown>

uqincd  w0, pow2
// CHECK-INST: uqincd  w0, pow2
// CHECK-ENCODING: [0x00,0xf4,0xe0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 00 f4 e0 04 <unknown>

uqincd  w0, pow2, mul #16
// CHECK-INST: uqincd  w0, pow2, mul #16
// CHECK-ENCODING: [0x00,0xf4,0xef,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 00 f4 ef 04 <unknown>


// ---------------------------------------------------------------------------//
// Test all patterns for 64-bit form
// ---------------------------------------------------------------------------//

uqincd  x0, pow2
// CHECK-INST: uqincd  x0, pow2
// CHECK-ENCODING: [0x00,0xf4,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 00 f4 f0 04 <unknown>

uqincd  x0, vl1
// CHECK-INST: uqincd  x0, vl1
// CHECK-ENCODING: [0x20,0xf4,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 20 f4 f0 04 <unknown>

uqincd  x0, vl2
// CHECK-INST: uqincd  x0, vl2
// CHECK-ENCODING: [0x40,0xf4,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 40 f4 f0 04 <unknown>

uqincd  x0, vl3
// CHECK-INST: uqincd  x0, vl3
// CHECK-ENCODING: [0x60,0xf4,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 60 f4 f0 04 <unknown>

uqincd  x0, vl4
// CHECK-INST: uqincd  x0, vl4
// CHECK-ENCODING: [0x80,0xf4,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 80 f4 f0 04 <unknown>

uqincd  x0, vl5
// CHECK-INST: uqincd  x0, vl5
// CHECK-ENCODING: [0xa0,0xf4,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: a0 f4 f0 04 <unknown>

uqincd  x0, vl6
// CHECK-INST: uqincd  x0, vl6
// CHECK-ENCODING: [0xc0,0xf4,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: c0 f4 f0 04 <unknown>

uqincd  x0, vl7
// CHECK-INST: uqincd  x0, vl7
// CHECK-ENCODING: [0xe0,0xf4,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: e0 f4 f0 04 <unknown>

uqincd  x0, vl8
// CHECK-INST: uqincd  x0, vl8
// CHECK-ENCODING: [0x00,0xf5,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 00 f5 f0 04 <unknown>

uqincd  x0, vl16
// CHECK-INST: uqincd  x0, vl16
// CHECK-ENCODING: [0x20,0xf5,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 20 f5 f0 04 <unknown>

uqincd  x0, vl32
// CHECK-INST: uqincd  x0, vl32
// CHECK-ENCODING: [0x40,0xf5,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 40 f5 f0 04 <unknown>

uqincd  x0, vl64
// CHECK-INST: uqincd  x0, vl64
// CHECK-ENCODING: [0x60,0xf5,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 60 f5 f0 04 <unknown>

uqincd  x0, vl128
// CHECK-INST: uqincd  x0, vl128
// CHECK-ENCODING: [0x80,0xf5,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 80 f5 f0 04 <unknown>

uqincd  x0, vl256
// CHECK-INST: uqincd  x0, vl256
// CHECK-ENCODING: [0xa0,0xf5,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: a0 f5 f0 04 <unknown>

uqincd  x0, #14
// CHECK-INST: uqincd  x0, #14
// CHECK-ENCODING: [0xc0,0xf5,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: c0 f5 f0 04 <unknown>

uqincd  x0, #15
// CHECK-INST: uqincd  x0, #15
// CHECK-ENCODING: [0xe0,0xf5,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: e0 f5 f0 04 <unknown>

uqincd  x0, #16
// CHECK-INST: uqincd  x0, #16
// CHECK-ENCODING: [0x00,0xf6,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 00 f6 f0 04 <unknown>

uqincd  x0, #17
// CHECK-INST: uqincd  x0, #17
// CHECK-ENCODING: [0x20,0xf6,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 20 f6 f0 04 <unknown>

uqincd  x0, #18
// CHECK-INST: uqincd  x0, #18
// CHECK-ENCODING: [0x40,0xf6,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 40 f6 f0 04 <unknown>

uqincd  x0, #19
// CHECK-INST: uqincd  x0, #19
// CHECK-ENCODING: [0x60,0xf6,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 60 f6 f0 04 <unknown>

uqincd  x0, #20
// CHECK-INST: uqincd  x0, #20
// CHECK-ENCODING: [0x80,0xf6,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 80 f6 f0 04 <unknown>

uqincd  x0, #21
// CHECK-INST: uqincd  x0, #21
// CHECK-ENCODING: [0xa0,0xf6,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: a0 f6 f0 04 <unknown>

uqincd  x0, #22
// CHECK-INST: uqincd  x0, #22
// CHECK-ENCODING: [0xc0,0xf6,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: c0 f6 f0 04 <unknown>

uqincd  x0, #23
// CHECK-INST: uqincd  x0, #23
// CHECK-ENCODING: [0xe0,0xf6,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: e0 f6 f0 04 <unknown>

uqincd  x0, #24
// CHECK-INST: uqincd  x0, #24
// CHECK-ENCODING: [0x00,0xf7,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 00 f7 f0 04 <unknown>

uqincd  x0, #25
// CHECK-INST: uqincd  x0, #25
// CHECK-ENCODING: [0x20,0xf7,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 20 f7 f0 04 <unknown>

uqincd  x0, #26
// CHECK-INST: uqincd  x0, #26
// CHECK-ENCODING: [0x40,0xf7,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 40 f7 f0 04 <unknown>

uqincd  x0, #27
// CHECK-INST: uqincd  x0, #27
// CHECK-ENCODING: [0x60,0xf7,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 60 f7 f0 04 <unknown>

uqincd  x0, #28
// CHECK-INST: uqincd  x0, #28
// CHECK-ENCODING: [0x80,0xf7,0xf0,0x04]
// CHECK-ERROR: instruction requires: sve
// CHECK-UNKNOWN: 80 f7 f0 04 <unknown>
