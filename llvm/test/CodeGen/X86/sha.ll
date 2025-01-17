; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mattr=+sha -mtriple=x86_64-unknown-unknown | FileCheck %s --check-prefix=CHECK --check-prefix=SSE
; RUN: llc < %s -mattr=+sha,+avx2 -mtriple=x86_64-unknown-unknown --show-mc-encoding | FileCheck %s --check-prefix=CHECK --check-prefix=AVX
; RUN: llc < %s -mattr=+sha,+egpr -mtriple=x86_64-unknown-unknown --show-mc-encoding | FileCheck %s --check-prefix=CHECK --check-prefix=EGPR

declare <4 x i32> @llvm.x86.sha1rnds4(<4 x i32>, <4 x i32>, i8) nounwind readnone

define <4 x i32> @test_sha1rnds4rr(<4 x i32> %a, <4 x i32> %b) nounwind uwtable {
; SSE-LABEL: test_sha1rnds4rr:
; SSE:       # %bb.0: # %entry
; SSE-NEXT:    sha1rnds4 $3, %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test_sha1rnds4rr:
; AVX:       # %bb.0: # %entry
; AVX-NEXT:    sha1rnds4 $3, %xmm1, %xmm0 # encoding: [0x0f,0x3a,0xcc,0xc1,0x03]
; AVX-NEXT:    retq # encoding: [0xc3]
;
; EGPR-LABEL: test_sha1rnds4rr:
; EGPR:       # %bb.0: # %entry
; EGPR-NEXT:    sha1rnds4 $3, %xmm1, %xmm0 # encoding: [0x62,0xf4,0x7c,0x08,0xd4,0xc1,0x03]
; EGPR-NEXT:    retq # encoding: [0xc3]
entry:
  %0 = tail call <4 x i32> @llvm.x86.sha1rnds4(<4 x i32> %a, <4 x i32> %b, i8 3)
  ret <4 x i32> %0
}

define <4 x i32> @test_sha1rnds4rm(<4 x i32> %a, ptr %b) nounwind uwtable {
; SSE-LABEL: test_sha1rnds4rm:
; SSE:       # %bb.0: # %entry
; SSE-NEXT:    sha1rnds4 $3, (%rdi), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test_sha1rnds4rm:
; AVX:       # %bb.0: # %entry
; AVX-NEXT:    sha1rnds4 $3, (%rdi), %xmm0 # encoding: [0x0f,0x3a,0xcc,0x07,0x03]
; AVX-NEXT:    retq # encoding: [0xc3]
;
; EGPR-LABEL: test_sha1rnds4rm:
; EGPR:       # %bb.0: # %entry
; EGPR-NEXT:    sha1rnds4 $3, (%rdi), %xmm0 # encoding: [0x62,0xf4,0x7c,0x08,0xd4,0x07,0x03]
; EGPR-NEXT:    retq # encoding: [0xc3]
entry:
  %0 = load <4 x i32>, ptr %b
  %1 = tail call <4 x i32> @llvm.x86.sha1rnds4(<4 x i32> %a, <4 x i32> %0, i8 3)
  ret <4 x i32> %1
}

declare <4 x i32> @llvm.x86.sha1nexte(<4 x i32>, <4 x i32>) nounwind readnone

define <4 x i32> @test_sha1nexterr(<4 x i32> %a, <4 x i32> %b) nounwind uwtable {
; SSE-LABEL: test_sha1nexterr:
; SSE:       # %bb.0: # %entry
; SSE-NEXT:    sha1nexte %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test_sha1nexterr:
; AVX:       # %bb.0: # %entry
; AVX-NEXT:    sha1nexte %xmm1, %xmm0 # encoding: [0x0f,0x38,0xc8,0xc1]
; AVX-NEXT:    retq # encoding: [0xc3]
;
; EGPR-LABEL: test_sha1nexterr:
; EGPR:       # %bb.0: # %entry
; EGPR-NEXT:    sha1nexte %xmm1, %xmm0 # encoding: [0x62,0xf4,0x7c,0x08,0xd8,0xc1]
; EGPR-NEXT:    retq # encoding: [0xc3]
entry:
  %0 = tail call <4 x i32> @llvm.x86.sha1nexte(<4 x i32> %a, <4 x i32> %b)
  ret <4 x i32> %0
}

define <4 x i32> @test_sha1nexterm(<4 x i32> %a, ptr %b) nounwind uwtable {
; SSE-LABEL: test_sha1nexterm:
; SSE:       # %bb.0: # %entry
; SSE-NEXT:    sha1nexte (%rdi), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test_sha1nexterm:
; AVX:       # %bb.0: # %entry
; AVX-NEXT:    sha1nexte (%rdi), %xmm0 # encoding: [0x0f,0x38,0xc8,0x07]
; AVX-NEXT:    retq # encoding: [0xc3]
;
; EGPR-LABEL: test_sha1nexterm:
; EGPR:       # %bb.0: # %entry
; EGPR-NEXT:    sha1nexte (%rdi), %xmm0 # encoding: [0x62,0xf4,0x7c,0x08,0xd8,0x07]
; EGPR-NEXT:    retq # encoding: [0xc3]
entry:
  %0 = load <4 x i32>, ptr %b
  %1 = tail call <4 x i32> @llvm.x86.sha1nexte(<4 x i32> %a, <4 x i32> %0)
  ret <4 x i32> %1
}

declare <4 x i32> @llvm.x86.sha1msg1(<4 x i32>, <4 x i32>) nounwind readnone

define <4 x i32> @test_sha1msg1rr(<4 x i32> %a, <4 x i32> %b) nounwind uwtable {
; SSE-LABEL: test_sha1msg1rr:
; SSE:       # %bb.0: # %entry
; SSE-NEXT:    sha1msg1 %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test_sha1msg1rr:
; AVX:       # %bb.0: # %entry
; AVX-NEXT:    sha1msg1 %xmm1, %xmm0 # encoding: [0x0f,0x38,0xc9,0xc1]
; AVX-NEXT:    retq # encoding: [0xc3]
;
; EGPR-LABEL: test_sha1msg1rr:
; EGPR:       # %bb.0: # %entry
; EGPR-NEXT:    sha1msg1 %xmm1, %xmm0 # encoding: [0x62,0xf4,0x7c,0x08,0xd9,0xc1]
; EGPR-NEXT:    retq # encoding: [0xc3]
entry:
  %0 = tail call <4 x i32> @llvm.x86.sha1msg1(<4 x i32> %a, <4 x i32> %b)
  ret <4 x i32> %0
}

define <4 x i32> @test_sha1msg1rm(<4 x i32> %a, ptr %b) nounwind uwtable {
; SSE-LABEL: test_sha1msg1rm:
; SSE:       # %bb.0: # %entry
; SSE-NEXT:    sha1msg1 (%rdi), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test_sha1msg1rm:
; AVX:       # %bb.0: # %entry
; AVX-NEXT:    sha1msg1 (%rdi), %xmm0 # encoding: [0x0f,0x38,0xc9,0x07]
; AVX-NEXT:    retq # encoding: [0xc3]
;
; EGPR-LABEL: test_sha1msg1rm:
; EGPR:       # %bb.0: # %entry
; EGPR-NEXT:    sha1msg1 (%rdi), %xmm0 # encoding: [0x62,0xf4,0x7c,0x08,0xd9,0x07]
; EGPR-NEXT:    retq # encoding: [0xc3]
entry:
  %0 = load <4 x i32>, ptr %b
  %1 = tail call <4 x i32> @llvm.x86.sha1msg1(<4 x i32> %a, <4 x i32> %0)
  ret <4 x i32> %1
}

declare <4 x i32> @llvm.x86.sha1msg2(<4 x i32>, <4 x i32>) nounwind readnone

define <4 x i32> @test_sha1msg2rr(<4 x i32> %a, <4 x i32> %b) nounwind uwtable {
; SSE-LABEL: test_sha1msg2rr:
; SSE:       # %bb.0: # %entry
; SSE-NEXT:    sha1msg2 %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test_sha1msg2rr:
; AVX:       # %bb.0: # %entry
; AVX-NEXT:    sha1msg2 %xmm1, %xmm0 # encoding: [0x0f,0x38,0xca,0xc1]
; AVX-NEXT:    retq # encoding: [0xc3]
;
; EGPR-LABEL: test_sha1msg2rr:
; EGPR:       # %bb.0: # %entry
; EGPR-NEXT:    sha1msg2 %xmm1, %xmm0 # encoding: [0x62,0xf4,0x7c,0x08,0xda,0xc1]
; EGPR-NEXT:    retq # encoding: [0xc3]
entry:
  %0 = tail call <4 x i32> @llvm.x86.sha1msg2(<4 x i32> %a, <4 x i32> %b)
  ret <4 x i32> %0
}

define <4 x i32> @test_sha1msg2rm(<4 x i32> %a, ptr %b) nounwind uwtable {
; SSE-LABEL: test_sha1msg2rm:
; SSE:       # %bb.0: # %entry
; SSE-NEXT:    sha1msg2 (%rdi), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test_sha1msg2rm:
; AVX:       # %bb.0: # %entry
; AVX-NEXT:    sha1msg2 (%rdi), %xmm0 # encoding: [0x0f,0x38,0xca,0x07]
; AVX-NEXT:    retq # encoding: [0xc3]
;
; EGPR-LABEL: test_sha1msg2rm:
; EGPR:       # %bb.0: # %entry
; EGPR-NEXT:    sha1msg2 (%rdi), %xmm0 # encoding: [0x62,0xf4,0x7c,0x08,0xda,0x07]
; EGPR-NEXT:    retq # encoding: [0xc3]
entry:
  %0 = load <4 x i32>, ptr %b
  %1 = tail call <4 x i32> @llvm.x86.sha1msg2(<4 x i32> %a, <4 x i32> %0)
  ret <4 x i32> %1
}

declare <4 x i32> @llvm.x86.sha256rnds2(<4 x i32>, <4 x i32>, <4 x i32>) nounwind readnone

define <4 x i32> @test_sha256rnds2rr(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c) nounwind uwtable {
; SSE-LABEL: test_sha256rnds2rr:
; SSE:       # %bb.0: # %entry
; SSE-NEXT:    movaps %xmm0, %xmm3
; SSE-NEXT:    movaps %xmm2, %xmm0
; SSE-NEXT:    sha256rnds2 %xmm0, %xmm1, %xmm3
; SSE-NEXT:    movaps %xmm3, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test_sha256rnds2rr:
; AVX:       # %bb.0: # %entry
; AVX-NEXT:    vmovaps %xmm0, %xmm3 # encoding: [0xc5,0xf8,0x28,0xd8]
; AVX-NEXT:    vmovaps %xmm2, %xmm0 # encoding: [0xc5,0xf8,0x28,0xc2]
; AVX-NEXT:    sha256rnds2 %xmm0, %xmm1, %xmm3 # encoding: [0x0f,0x38,0xcb,0xd9]
; AVX-NEXT:    vmovaps %xmm3, %xmm0 # encoding: [0xc5,0xf8,0x28,0xc3]
; AVX-NEXT:    retq # encoding: [0xc3]
;
; EGPR-LABEL: test_sha256rnds2rr:
; EGPR:       # %bb.0: # %entry
; EGPR-NEXT:    movaps %xmm0, %xmm3 # encoding: [0x0f,0x28,0xd8]
; EGPR-NEXT:    movaps %xmm2, %xmm0 # encoding: [0x0f,0x28,0xc2]
; EGPR-NEXT:    sha256rnds2 %xmm0, %xmm1, %xmm3 # encoding: [0x62,0xf4,0x7c,0x08,0xdb,0xd9]
; EGPR-NEXT:    movaps %xmm3, %xmm0 # encoding: [0x0f,0x28,0xc3]
; EGPR-NEXT:    retq # encoding: [0xc3]
entry:
  %0 = tail call <4 x i32> @llvm.x86.sha256rnds2(<4 x i32> %a, <4 x i32> %b, <4 x i32> %c)
  ret <4 x i32> %0
}

define <4 x i32> @test_sha256rnds2rm(<4 x i32> %a, ptr %b, <4 x i32> %c) nounwind uwtable {
; SSE-LABEL: test_sha256rnds2rm:
; SSE:       # %bb.0: # %entry
; SSE-NEXT:    movaps %xmm0, %xmm2
; SSE-NEXT:    movaps %xmm1, %xmm0
; SSE-NEXT:    sha256rnds2 %xmm0, (%rdi), %xmm2
; SSE-NEXT:    movaps %xmm2, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test_sha256rnds2rm:
; AVX:       # %bb.0: # %entry
; AVX-NEXT:    vmovaps %xmm0, %xmm2 # encoding: [0xc5,0xf8,0x28,0xd0]
; AVX-NEXT:    vmovaps %xmm1, %xmm0 # encoding: [0xc5,0xf8,0x28,0xc1]
; AVX-NEXT:    sha256rnds2 %xmm0, (%rdi), %xmm2 # encoding: [0x0f,0x38,0xcb,0x17]
; AVX-NEXT:    vmovaps %xmm2, %xmm0 # encoding: [0xc5,0xf8,0x28,0xc2]
; AVX-NEXT:    retq # encoding: [0xc3]
;
; EGPR-LABEL: test_sha256rnds2rm:
; EGPR:       # %bb.0: # %entry
; EGPR-NEXT:    movaps %xmm0, %xmm2 # encoding: [0x0f,0x28,0xd0]
; EGPR-NEXT:    movaps %xmm1, %xmm0 # encoding: [0x0f,0x28,0xc1]
; EGPR-NEXT:    sha256rnds2 %xmm0, (%rdi), %xmm2 # encoding: [0x62,0xf4,0x7c,0x08,0xdb,0x17]
; EGPR-NEXT:    movaps %xmm2, %xmm0 # encoding: [0x0f,0x28,0xc2]
; EGPR-NEXT:    retq # encoding: [0xc3]
entry:
  %0 = load <4 x i32>, ptr %b
  %1 = tail call <4 x i32> @llvm.x86.sha256rnds2(<4 x i32> %a, <4 x i32> %0, <4 x i32> %c)
  ret <4 x i32> %1
}

declare <4 x i32> @llvm.x86.sha256msg1(<4 x i32>, <4 x i32>) nounwind readnone

define <4 x i32> @test_sha256msg1rr(<4 x i32> %a, <4 x i32> %b) nounwind uwtable {
; SSE-LABEL: test_sha256msg1rr:
; SSE:       # %bb.0: # %entry
; SSE-NEXT:    sha256msg1 %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test_sha256msg1rr:
; AVX:       # %bb.0: # %entry
; AVX-NEXT:    sha256msg1 %xmm1, %xmm0 # encoding: [0x0f,0x38,0xcc,0xc1]
; AVX-NEXT:    retq # encoding: [0xc3]
;
; EGPR-LABEL: test_sha256msg1rr:
; EGPR:       # %bb.0: # %entry
; EGPR-NEXT:    sha256msg1 %xmm1, %xmm0 # encoding: [0x62,0xf4,0x7c,0x08,0xdc,0xc1]
; EGPR-NEXT:    retq # encoding: [0xc3]
entry:
  %0 = tail call <4 x i32> @llvm.x86.sha256msg1(<4 x i32> %a, <4 x i32> %b)
  ret <4 x i32> %0
}

define <4 x i32> @test_sha256msg1rm(<4 x i32> %a, ptr %b) nounwind uwtable {
; SSE-LABEL: test_sha256msg1rm:
; SSE:       # %bb.0: # %entry
; SSE-NEXT:    sha256msg1 (%rdi), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test_sha256msg1rm:
; AVX:       # %bb.0: # %entry
; AVX-NEXT:    sha256msg1 (%rdi), %xmm0 # encoding: [0x0f,0x38,0xcc,0x07]
; AVX-NEXT:    retq # encoding: [0xc3]
;
; EGPR-LABEL: test_sha256msg1rm:
; EGPR:       # %bb.0: # %entry
; EGPR-NEXT:    sha256msg1 (%rdi), %xmm0 # encoding: [0x62,0xf4,0x7c,0x08,0xdc,0x07]
; EGPR-NEXT:    retq # encoding: [0xc3]
entry:
  %0 = load <4 x i32>, ptr %b
  %1 = tail call <4 x i32> @llvm.x86.sha256msg1(<4 x i32> %a, <4 x i32> %0)
  ret <4 x i32> %1
}

declare <4 x i32> @llvm.x86.sha256msg2(<4 x i32>, <4 x i32>) nounwind readnone

define <4 x i32> @test_sha256msg2rr(<4 x i32> %a, <4 x i32> %b) nounwind uwtable {
; SSE-LABEL: test_sha256msg2rr:
; SSE:       # %bb.0: # %entry
; SSE-NEXT:    sha256msg2 %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test_sha256msg2rr:
; AVX:       # %bb.0: # %entry
; AVX-NEXT:    sha256msg2 %xmm1, %xmm0 # encoding: [0x0f,0x38,0xcd,0xc1]
; AVX-NEXT:    retq # encoding: [0xc3]
;
; EGPR-LABEL: test_sha256msg2rr:
; EGPR:       # %bb.0: # %entry
; EGPR-NEXT:    sha256msg2 %xmm1, %xmm0 # encoding: [0x62,0xf4,0x7c,0x08,0xdd,0xc1]
; EGPR-NEXT:    retq # encoding: [0xc3]
entry:
  %0 = tail call <4 x i32> @llvm.x86.sha256msg2(<4 x i32> %a, <4 x i32> %b)
  ret <4 x i32> %0
}

define <4 x i32> @test_sha256msg2rm(<4 x i32> %a, ptr %b) nounwind uwtable {
; SSE-LABEL: test_sha256msg2rm:
; SSE:       # %bb.0: # %entry
; SSE-NEXT:    sha256msg2 (%rdi), %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test_sha256msg2rm:
; AVX:       # %bb.0: # %entry
; AVX-NEXT:    sha256msg2 (%rdi), %xmm0 # encoding: [0x0f,0x38,0xcd,0x07]
; AVX-NEXT:    retq # encoding: [0xc3]
;
; EGPR-LABEL: test_sha256msg2rm:
; EGPR:       # %bb.0: # %entry
; EGPR-NEXT:    sha256msg2 (%rdi), %xmm0 # encoding: [0x62,0xf4,0x7c,0x08,0xdd,0x07]
; EGPR-NEXT:    retq # encoding: [0xc3]
entry:
  %0 = load <4 x i32>, ptr %b
  %1 = tail call <4 x i32> @llvm.x86.sha256msg2(<4 x i32> %a, <4 x i32> %0)
  ret <4 x i32> %1
}

; Make sure we don't forget that sha instructions have no VEX equivalents and thus don't zero YMM/ZMM.
define <8 x i32> @test_sha1rnds4_zero_extend(<4 x i32> %a, ptr %b) nounwind uwtable {
; SSE-LABEL: test_sha1rnds4_zero_extend:
; SSE:       # %bb.0: # %entry
; SSE-NEXT:    sha1rnds4 $3, (%rdi), %xmm0
; SSE-NEXT:    xorps %xmm1, %xmm1
; SSE-NEXT:    retq
;
; AVX-LABEL: test_sha1rnds4_zero_extend:
; AVX:       # %bb.0: # %entry
; AVX-NEXT:    sha1rnds4 $3, (%rdi), %xmm0 # encoding: [0x0f,0x3a,0xcc,0x07,0x03]
; AVX-NEXT:    vmovaps %xmm0, %xmm0 # encoding: [0xc5,0xf8,0x28,0xc0]
; AVX-NEXT:    retq # encoding: [0xc3]
;
; EGPR-LABEL: test_sha1rnds4_zero_extend:
; EGPR:       # %bb.0: # %entry
; EGPR-NEXT:    sha1rnds4 $3, (%rdi), %xmm0 # encoding: [0x62,0xf4,0x7c,0x08,0xd4,0x07,0x03]
; EGPR-NEXT:    xorps %xmm1, %xmm1 # encoding: [0x0f,0x57,0xc9]
; EGPR-NEXT:    retq # encoding: [0xc3]
entry:
  %0 = load <4 x i32>, ptr %b
  %1 = tail call <4 x i32> @llvm.x86.sha1rnds4(<4 x i32> %a, <4 x i32> %0, i8 3)
  %2 = shufflevector <4 x i32> %1, <4 x i32> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  ret <8 x i32> %2
}
;; NOTE: These prefixes are unused and the list is autogenerated. Do not add tests below this line:
; CHECK: {{.*}}
