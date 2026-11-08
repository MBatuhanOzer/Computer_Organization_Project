	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 0
	.intel_syntax noprefix
	.file	"main.c"
	.def	rle_encode;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",one_only,rle_encode,unique,0
	.globl	rle_encode                      # -- Begin function rle_encode
rle_encode:                             # @rle_encode
.Lfunc_begin0:
	.cv_func_id 0
	.cv_file	1 "C:\\Users\\mehme\\Documents\\\303\226devler\\CO_Project_5001230025_MehmetBatuhan\303\226zer\\main.c" "7BA5DC9251822AD99EEB7A443961E756" 1
	.cv_loc	0 1 25 0                        # main.c:25:0
.seh_proc rle_encode
# %bb.0:
	#DEBUG_VALUE: rle_encode:n <- $ecx
	push	rsi
	.seh_pushreg rsi
	push	rdi
	.seh_pushreg rdi
	.seh_endprologue
.Ltmp0:
	#DEBUG_VALUE: rle_encode:i <- 0
	#DEBUG_VALUE: rle_encode:k <- 0
	xor	eax, eax
	.cv_loc	0 1 28 0                        # main.c:28:0
	test	ecx, ecx
	jle	.LBB0_9
.Ltmp1:
# %bb.1:
	#DEBUG_VALUE: rle_encode:n <- $ecx
	#DEBUG_VALUE: rle_encode:i <- 0
	#DEBUG_VALUE: rle_encode:k <- 0
	lea	r8, [rip + v]
	lea	rdx, [rip + enc]
	xor	r9d, r9d
.Ltmp2:
.LBB0_2:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_4 Depth 2
	#DEBUG_VALUE: rle_encode:n <- $ecx
	#DEBUG_VALUE: rle_encode:k <- $rax
	#DEBUG_VALUE: rle_encode:i <- $r9d
	#DEBUG_VALUE: run <- 1
	.cv_loc	0 1 30 0                        # main.c:30:0
	lea	esi, [r9 + 1]
	mov	r10d, r9d
	mov	r9d, dword ptr [r8 + 4*r10]
.Ltmp3:
	#DEBUG_VALUE: rle_encode:i <- $r10d
	mov	r11d, 1
	cmp	esi, ecx
	jge	.LBB0_8
.Ltmp4:
# %bb.3:                                #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: rle_encode:n <- $ecx
	#DEBUG_VALUE: rle_encode:i <- $r10d
	#DEBUG_VALUE: rle_encode:k <- $rax
	#DEBUG_VALUE: run <- 1
	mov	esi, ecx
	sub	esi, r10d
	mov	r11d, 1
.Ltmp5:
.LBB0_4:                                #   Parent Loop BB0_2 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: rle_encode:n <- $ecx
	#DEBUG_VALUE: rle_encode:i <- $r10d
	#DEBUG_VALUE: rle_encode:k <- $rax
	#DEBUG_VALUE: run <- $r11
	lea	edi, [r10 + r11]
	cmp	dword ptr [r8 + 4*rdi], r9d
	jne	.LBB0_7
.Ltmp6:
# %bb.5:                                #   in Loop: Header=BB0_4 Depth=2
	#DEBUG_VALUE: rle_encode:n <- $ecx
	#DEBUG_VALUE: rle_encode:i <- $r10d
	#DEBUG_VALUE: rle_encode:k <- $rax
	#DEBUG_VALUE: run <- $r11
	.cv_loc	0 1 30 0                        # main.c:30:0
	inc	r11
.Ltmp7:
	#DEBUG_VALUE: run <- $r11
	.cv_loc	0 1 30 0                        # main.c:30:0
	cmp	rsi, r11
	jne	.LBB0_4
	jmp	.LBB0_6
.Ltmp8:
.LBB0_7:                                #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: rle_encode:n <- $ecx
	#DEBUG_VALUE: rle_encode:i <- $r10d
	#DEBUG_VALUE: rle_encode:k <- $rax
	#DEBUG_VALUE: run <- $r11
	.cv_loc	0 1 31 0                        # main.c:31:0
	add	r10d, r11d
.Ltmp9:
	mov	esi, r10d
.Ltmp10:
.LBB0_8:                                #   in Loop: Header=BB0_2 Depth=1
	#DEBUG_VALUE: rle_encode:n <- $ecx
	#DEBUG_VALUE: rle_encode:k <- $rax
	shl	r9d, 8
	or	r9d, r11d
	mov	dword ptr [rdx + 4*rax], r9d
	.cv_loc	0 1 32 0                        # main.c:32:0
	inc	rax
.Ltmp11:
	#DEBUG_VALUE: rle_encode:k <- $rax
	#DEBUG_VALUE: rle_encode:i <- $esi
	mov	r9d, esi
.Ltmp12:
	.cv_loc	0 1 28 0                        # main.c:28:0
	cmp	esi, ecx
	jl	.LBB0_2
	jmp	.LBB0_9
.Ltmp13:
.LBB0_6:
	#DEBUG_VALUE: rle_encode:n <- $ecx
	#DEBUG_VALUE: rle_encode:i <- $r10d
	#DEBUG_VALUE: rle_encode:k <- $rax
	#DEBUG_VALUE: run <- $r11
	.cv_loc	0 1 31 0                        # main.c:31:0
	shl	r9d, 8
	or	r9d, esi
	mov	dword ptr [rdx + 4*rax], r9d
	.cv_loc	0 1 32 0                        # main.c:32:0
	inc	rax
.Ltmp14:
	#DEBUG_VALUE: rle_encode:k <- $rax
	#DEBUG_VALUE: rle_encode:i <- $ecx
.LBB0_9:
	#DEBUG_VALUE: rle_encode:n <- $ecx
	.cv_loc	0 1 35 0                        # main.c:35:0
                                        # kill: def $eax killed $eax killed $rax
	.seh_startepilogue
	pop	rdi
	pop	rsi
	.seh_endepilogue
	ret
.Ltmp15:
.Lfunc_end0:
	.seh_endproc
                                        # -- End function
	.def	rle_decode;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",one_only,rle_decode,unique,1
	.globl	rle_decode                      # -- Begin function rle_decode
rle_decode:                             # @rle_decode
.Lfunc_begin1:
	.cv_func_id 1
	.cv_loc	1 1 40 0                        # main.c:40:0
.seh_proc rle_decode
# %bb.0:
	#DEBUG_VALUE: rle_decode:len <- $ecx
	push	rsi
	.seh_pushreg rsi
	push	rdi
	.seh_pushreg rdi
	push	rbx
	.seh_pushreg rbx
	.seh_endprologue
.Ltmp16:
	#DEBUG_VALUE: rle_decode:o <- 0
	#DEBUG_VALUE: j <- 0
	.cv_loc	1 1 42 0                        # main.c:42:0
	test	ecx, ecx
	jle	.LBB1_1
.Ltmp17:
# %bb.3:
	#DEBUG_VALUE: rle_decode:len <- $ecx
	#DEBUG_VALUE: rle_decode:o <- 0
	#DEBUG_VALUE: j <- 0
	mov	ecx, ecx
.Ltmp18:
	xor	edx, edx
	lea	r8, [rip + enc]
	lea	r9, [rip + dec]
	xor	eax, eax
.Ltmp19:
.LBB1_4:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_6 Depth 2
	#DEBUG_VALUE: rle_decode:len <- $ecx
	#DEBUG_VALUE: rle_decode:o <- $eax
	#DEBUG_VALUE: j <- $rdx
	.cv_loc	1 1 43 0                        # main.c:43:0
	mov	esi, dword ptr [r8 + 4*rdx]
.Ltmp20:
	#DEBUG_VALUE: value <- undef
	#DEBUG_VALUE: run <- undef
	#DEBUG_VALUE: t <- 0
	.cv_loc	1 1 45 0                        # main.c:45:0
	test	sil, sil
	je	.LBB1_8
.Ltmp21:
# %bb.5:                                #   in Loop: Header=BB1_4 Depth=1
	#DEBUG_VALUE: rle_decode:len <- $ecx
	#DEBUG_VALUE: rle_decode:o <- $eax
	#DEBUG_VALUE: j <- $rdx
	#DEBUG_VALUE: t <- 0
	mov	r10d, esi
	sar	r10d, 8
.Ltmp22:
	#DEBUG_VALUE: value <- $r10d
	movsxd	r11, eax
	shl	r11, 2
	movzx	esi, sil
	xor	edi, edi
.Ltmp23:
.LBB1_6:                                #   Parent Loop BB1_4 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	#DEBUG_VALUE: rle_decode:len <- $ecx
	#DEBUG_VALUE: j <- $rdx
	#DEBUG_VALUE: value <- $r10d
	#DEBUG_VALUE: t <- $rdi
	#DEBUG_VALUE: rle_decode:o <- [DW_OP_LLVM_arg 0, DW_OP_consts 1, DW_OP_LLVM_arg 1, DW_OP_LLVM_convert 64 5, DW_OP_plus, DW_OP_plus, DW_OP_stack_value] $rdi, $eax
	.cv_loc	1 1 46 0                        # main.c:46:0
	lea	rbx, [r11 + 4*rdi]
	mov	dword ptr [r9 + rbx], r10d
.Ltmp24:
	#DEBUG_VALUE: t <- [DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $rdi
	.cv_loc	1 1 45 0                        # main.c:45:0
	inc	rdi
.Ltmp25:
	cmp	esi, edi
	jne	.LBB1_6
.Ltmp26:
# %bb.7:                                #   in Loop: Header=BB1_4 Depth=1
	#DEBUG_VALUE: rle_decode:len <- $ecx
	#DEBUG_VALUE: j <- $rdx
	.cv_loc	1 1 42 0                        # main.c:42:0
	add	eax, edi
.Ltmp27:
.LBB1_8:                                #   in Loop: Header=BB1_4 Depth=1
	#DEBUG_VALUE: rle_decode:len <- $ecx
	#DEBUG_VALUE: j <- $rdx
	inc	rdx
.Ltmp28:
	#DEBUG_VALUE: j <- $rdx
	#DEBUG_VALUE: rle_decode:o <- $eax
	.cv_loc	1 1 42 0                        # main.c:42:0
	cmp	rdx, rcx
	je	.LBB1_2
	jmp	.LBB1_4
.Ltmp29:
.LBB1_1:
	#DEBUG_VALUE: rle_decode:len <- $ecx
	#DEBUG_VALUE: rle_decode:o <- 0
	#DEBUG_VALUE: j <- 0
	xor	eax, eax
.Ltmp30:
.LBB1_2:
	#DEBUG_VALUE: rle_decode:len <- $ecx
	.cv_loc	1 1 49 0                        # main.c:49:0
	.seh_startepilogue
	pop	rbx
	pop	rdi
	pop	rsi
	.seh_endepilogue
	ret
.Ltmp31:
.Lfunc_end1:
	.seh_endproc
                                        # -- End function
	.def	main;
	.scl	2;
	.type	32;
	.endef
	.section	.text,"xr",one_only,main,unique,2
	.globl	main                            # -- Begin function main
main:                                   # @main
.Lfunc_begin2:
	.cv_func_id 2
	.cv_loc	2 1 53 0                        # main.c:53:0
.seh_proc main
# %bb.0:
	push	rsi
	.seh_pushreg rsi
	sub	rsp, 32
	.seh_stackalloc 32
	.seh_endprologue
.Ltmp32:
	#DEBUG_VALUE: main:x <- 1230025
	#DEBUG_VALUE: i <- 0
	mov	eax, 1230025
	xor	ecx, ecx
	lea	rsi, [rip + v]
.Ltmp33:
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	#DEBUG_VALUE: main:x <- $eax
	#DEBUG_VALUE: i <- [DW_OP_consts 4, DW_OP_div, DW_OP_stack_value] $rcx
	.cv_loc	2 1 57 0                        # main.c:57:0
	imul	eax, eax, 1664525
.Ltmp34:
	add	eax, 1013904223
.Ltmp35:
	#DEBUG_VALUE: main:x <- $eax
	.cv_loc	2 1 58 0                        # main.c:58:0
	mov	edx, eax
	shr	edx, 16
	and	edx, 1
	mov	dword ptr [rcx + rsi], edx
.Ltmp36:
	#DEBUG_VALUE: i <- [DW_OP_consts 4, DW_OP_div, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $rcx
	.cv_loc	2 1 56 0                        # main.c:56:0
	add	rcx, 4
.Ltmp37:
	cmp	rcx, 96
	jne	.LBB2_1
.Ltmp38:
# %bb.2:
	#DEBUG_VALUE: main:x <- $eax
	.cv_loc	2 1 60 0                        # main.c:60:0
	mov	ecx, 24
	call	rle_encode
.Ltmp39:
	mov	dword ptr [rip + enc_len], eax
	.cv_loc	2 1 61 0                        # main.c:61:0
	mov	ecx, eax
	call	rle_decode
.Ltmp40:
	#DEBUG_VALUE: main:out <- $eax
	.cv_loc	2 1 62 0                        # main.c:62:0
	imul	ecx, dword ptr [rip + enc_len], 100
	movsxd	rcx, ecx
	imul	rcx, rcx, 715827883
	mov	rdx, rcx
	shr	rdx, 63
	sar	rcx, 34
	add	ecx, edx
	mov	dword ptr [rip + ratio_x100], ecx
	.cv_loc	2 1 63 0                        # main.c:63:0
	xor	ecx, ecx
	cmp	eax, 24
	sete	cl
	mov	dword ptr [rip + decode_ok], ecx
	xor	eax, eax
.Ltmp41:
	#DEBUG_VALUE: i <- 0
	lea	rcx, [rip + dec]
.LBB2_3:                                # =>This Inner Loop Header: Depth=1
.Ltmp42:
	#DEBUG_VALUE: i <- [DW_OP_consts 4, DW_OP_div, DW_OP_stack_value] $rax
	.cv_loc	2 1 65 0                        # main.c:65:0
	mov	edx, dword ptr [rax + rcx]
	cmp	edx, dword ptr [rax + rsi]
	je	.LBB2_5
.Ltmp43:
# %bb.4:                                #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_consts 4, DW_OP_div, DW_OP_stack_value] $rax
	.cv_loc	2 1 66 0                        # main.c:66:0
	mov	dword ptr [rip + decode_ok], 0
.Ltmp44:
.LBB2_5:                                #   in Loop: Header=BB2_3 Depth=1
	#DEBUG_VALUE: i <- [DW_OP_consts 4, DW_OP_div, DW_OP_stack_value] $rax
	#DEBUG_VALUE: i <- [DW_OP_consts 4, DW_OP_div, DW_OP_consts 1, DW_OP_plus, DW_OP_stack_value] $rax
	.cv_loc	2 1 64 0                        # main.c:64:0
	add	rax, 4
.Ltmp45:
	cmp	rax, 96
	jne	.LBB2_3
.Ltmp46:
# %bb.6:
	.cv_loc	2 1 69 0                        # main.c:69:0
	xor	eax, eax
	.seh_startepilogue
	add	rsp, 32
	pop	rsi
	.seh_endepilogue
	ret
.Ltmp47:
.Lfunc_end2:
	.seh_endproc
                                        # -- End function
	.section	.rdata,"dr"
	.globl	SID                             # @SID
	.p2align	2, 0x0
SID:
	.long	1230025                         # 0x12c4c9

	.bss
	.globl	enc_len                         # @enc_len
	.p2align	2, 0x0
enc_len:
	.long	0                               # 0x0

	.globl	ratio_x100                      # @ratio_x100
	.p2align	2, 0x0
ratio_x100:
	.long	0                               # 0x0

	.globl	decode_ok                       # @decode_ok
	.p2align	2, 0x0
decode_ok:
	.long	0                               # 0x0

	.globl	v                               # @v
	.p2align	4, 0x0
v:
	.zero	96

	.globl	enc                             # @enc
	.p2align	4, 0x0
enc:
	.zero	96

	.globl	dec                             # @dec
	.p2align	4, 0x0
dec:
	.zero	96

	.section	.drectve,"yni"
	.ascii	" /DEFAULTLIB:libcmt.lib"
	.ascii	" /DEFAULTLIB:oldnames.lib"
	.section	.debug$S,"dr"
	.p2align	2, 0x0
	.long	4                               # Debug section magic
	.long	241
	.long	.Ltmp49-.Ltmp48                 # Subsection size
.Ltmp48:
	.short	.Ltmp51-.Ltmp50                 # Record length
.Ltmp50:
	.short	4353                            # Record kind: S_OBJNAME
	.long	0                               # Signature
	.asciz	"C:\\Users\\mehme\\Documents\\\303\226devler\\CO_Project_5001230025_MehmetBatuhan\303\226zer\\build-o1\\CMakeFiles\\rle.dir\\main.c.obj" # Object name
	.p2align	2, 0x0
.Ltmp51:
	.short	.Ltmp53-.Ltmp52                 # Record length
.Ltmp52:
	.short	4412                            # Record kind: S_COMPILE3
	.long	0                               # Flags and language
	.short	208                             # CPUType
	.short	21                              # Frontend version
	.short	1
	.short	8
	.short	0
	.short	21018                           # Backend version
	.short	0
	.short	0
	.short	0
	.asciz	"clang version 21.1.8"          # Null-terminated compiler version string
	.p2align	2, 0x0
.Ltmp53:
.Ltmp49:
	.p2align	2, 0x0
	.section	.debug$S,"dr",associative,rle_encode
	.p2align	2, 0x0
	.long	4                               # Debug section magic
	.long	241                             # Symbol subsection for rle_encode
	.long	.Ltmp55-.Ltmp54                 # Subsection size
.Ltmp54:
	.short	.Ltmp57-.Ltmp56                 # Record length
.Ltmp56:
	.short	4423                            # Record kind: S_GPROC32_ID
	.long	0                               # PtrParent
	.long	0                               # PtrEnd
	.long	0                               # PtrNext
	.long	.Lfunc_end0-rle_encode          # Code size
	.long	0                               # Offset after prologue
	.long	0                               # Offset before epilogue
	.long	4098                            # Function type index
	.secrel32	rle_encode              # Function section relative address
	.secidx	rle_encode                      # Function section index
	.byte	128                             # Flags
	.asciz	"rle_encode"                    # Function name
	.p2align	2, 0x0
.Ltmp57:
	.short	.Ltmp59-.Ltmp58                 # Record length
.Ltmp58:
	.short	4114                            # Record kind: S_FRAMEPROC
	.long	0                               # FrameSize
	.long	0                               # Padding
	.long	0                               # Offset of padding
	.long	16                              # Bytes of callee saved registers
	.long	0                               # Exception handler offset
	.short	0                               # Exception handler section
	.long	81920                           # Flags (defines frame register)
	.p2align	2, 0x0
.Ltmp59:
	.short	.Ltmp61-.Ltmp60                 # Record length
.Ltmp60:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	1                               # Flags
	.asciz	"n"
	.p2align	2, 0x0
.Ltmp61:
	.cv_def_range	 .Lfunc_begin0 .Lfunc_end0, reg, 18
	.short	.Ltmp63-.Ltmp62                 # Record length
.Ltmp62:
	.short	4359                            # Record kind: S_CONSTANT
	.long	116                             # Type
	.byte	0x00, 0x00                      # Value
	.asciz	"i"                             # Name
	.p2align	2, 0x0
.Ltmp63:
	.short	.Ltmp65-.Ltmp64                 # Record length
.Ltmp64:
	.short	4359                            # Record kind: S_CONSTANT
	.long	116                             # Type
	.byte	0x00, 0x00                      # Value
	.asciz	"k"                             # Name
	.p2align	2, 0x0
.Ltmp65:
	.short	.Ltmp67-.Ltmp66                 # Record length
.Ltmp66:
	.short	4359                            # Record kind: S_CONSTANT
	.long	116                             # Type
	.byte	0x01, 0x00                      # Value
	.asciz	"run"                           # Name
	.p2align	2, 0x0
.Ltmp67:
	.short	2                               # Record length
	.short	4431                            # Record kind: S_PROC_ID_END
.Ltmp55:
	.p2align	2, 0x0
	.cv_linetable	0, rle_encode, .Lfunc_end0
	.section	.debug$S,"dr",associative,rle_decode
	.p2align	2, 0x0
	.long	4                               # Debug section magic
	.long	241                             # Symbol subsection for rle_decode
	.long	.Ltmp69-.Ltmp68                 # Subsection size
.Ltmp68:
	.short	.Ltmp71-.Ltmp70                 # Record length
.Ltmp70:
	.short	4423                            # Record kind: S_GPROC32_ID
	.long	0                               # PtrParent
	.long	0                               # PtrEnd
	.long	0                               # PtrNext
	.long	.Lfunc_end1-rle_decode          # Code size
	.long	0                               # Offset after prologue
	.long	0                               # Offset before epilogue
	.long	4099                            # Function type index
	.secrel32	rle_decode              # Function section relative address
	.secidx	rle_decode                      # Function section index
	.byte	128                             # Flags
	.asciz	"rle_decode"                    # Function name
	.p2align	2, 0x0
.Ltmp71:
	.short	.Ltmp73-.Ltmp72                 # Record length
.Ltmp72:
	.short	4114                            # Record kind: S_FRAMEPROC
	.long	0                               # FrameSize
	.long	0                               # Padding
	.long	0                               # Offset of padding
	.long	24                              # Bytes of callee saved registers
	.long	0                               # Exception handler offset
	.short	0                               # Exception handler section
	.long	81920                           # Flags (defines frame register)
	.p2align	2, 0x0
.Ltmp73:
	.short	.Ltmp75-.Ltmp74                 # Record length
.Ltmp74:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	1                               # Flags
	.asciz	"len"
	.p2align	2, 0x0
.Ltmp75:
	.cv_def_range	 .Lfunc_begin1 .Ltmp18 .Ltmp19 .Lfunc_end1, reg, 18
	.short	.Ltmp77-.Ltmp76                 # Record length
.Ltmp76:
	.short	4359                            # Record kind: S_CONSTANT
	.long	116                             # Type
	.byte	0x00, 0x00                      # Value
	.asciz	"o"                             # Name
	.p2align	2, 0x0
.Ltmp77:
	.short	.Ltmp79-.Ltmp78                 # Record length
.Ltmp78:
	.short	4355                            # Record kind: S_BLOCK32
	.long	0                               # PtrParent
	.long	0                               # PtrEnd
	.long	.Ltmp29-.Lfunc_begin1           # Code size
	.secrel32	.Lfunc_begin1           # Function section relative address
	.secidx	.Lfunc_begin1                   # Function section index
	.byte	0                               # Lexical block name
	.p2align	2, 0x0
.Ltmp79:
	.short	.Ltmp81-.Ltmp80                 # Record length
.Ltmp80:
	.short	4359                            # Record kind: S_CONSTANT
	.long	116                             # Type
	.byte	0x00, 0x00                      # Value
	.asciz	"j"                             # Name
	.p2align	2, 0x0
.Ltmp81:
	.short	.Ltmp83-.Ltmp82                 # Record length
.Ltmp82:
	.short	4355                            # Record kind: S_BLOCK32
	.long	0                               # PtrParent
	.long	0                               # PtrEnd
	.long	.Ltmp26-.Ltmp19                 # Code size
	.secrel32	.Ltmp19                 # Function section relative address
	.secidx	.Lfunc_begin1                   # Function section index
	.byte	0                               # Lexical block name
	.p2align	2, 0x0
.Ltmp83:
	.short	.Ltmp85-.Ltmp84                 # Record length
.Ltmp84:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	0                               # Flags
	.asciz	"value"
	.p2align	2, 0x0
.Ltmp85:
	.cv_def_range	 .Ltmp22 .Ltmp26, reg, 362
	.short	.Ltmp87-.Ltmp86                 # Record length
.Ltmp86:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	256                             # Flags
	.asciz	"run"
	.p2align	2, 0x0
.Ltmp87:
	.short	.Ltmp89-.Ltmp88                 # Record length
.Ltmp88:
	.short	4359                            # Record kind: S_CONSTANT
	.long	116                             # Type
	.byte	0x00, 0x00                      # Value
	.asciz	"t"                             # Name
	.p2align	2, 0x0
.Ltmp89:
	.short	2                               # Record length
	.short	6                               # Record kind: S_END
	.short	2                               # Record length
	.short	6                               # Record kind: S_END
	.short	2                               # Record length
	.short	4431                            # Record kind: S_PROC_ID_END
.Ltmp69:
	.p2align	2, 0x0
	.cv_linetable	1, rle_decode, .Lfunc_end1
	.section	.debug$S,"dr",associative,main
	.p2align	2, 0x0
	.long	4                               # Debug section magic
	.long	241                             # Symbol subsection for main
	.long	.Ltmp91-.Ltmp90                 # Subsection size
.Ltmp90:
	.short	.Ltmp93-.Ltmp92                 # Record length
.Ltmp92:
	.short	4423                            # Record kind: S_GPROC32_ID
	.long	0                               # PtrParent
	.long	0                               # PtrEnd
	.long	0                               # PtrNext
	.long	.Lfunc_end2-main                # Code size
	.long	0                               # Offset after prologue
	.long	0                               # Offset before epilogue
	.long	4102                            # Function type index
	.secrel32	main                    # Function section relative address
	.secidx	main                            # Function section index
	.byte	128                             # Flags
	.asciz	"main"                          # Function name
	.p2align	2, 0x0
.Ltmp93:
	.short	.Ltmp95-.Ltmp94                 # Record length
.Ltmp94:
	.short	4114                            # Record kind: S_FRAMEPROC
	.long	32                              # FrameSize
	.long	0                               # Padding
	.long	0                               # Offset of padding
	.long	8                               # Bytes of callee saved registers
	.long	0                               # Exception handler offset
	.short	0                               # Exception handler section
	.long	81920                           # Flags (defines frame register)
	.p2align	2, 0x0
.Ltmp95:
	.short	.Ltmp97-.Ltmp96                 # Record length
.Ltmp96:
	.short	4359                            # Record kind: S_CONSTANT
	.long	117                             # Type
	.byte	0x03, 0x80, 0xc9, 0xc4          # Value
	.byte	0x12, 0x00
	.asciz	"x"                             # Name
	.p2align	2, 0x0
.Ltmp97:
	.short	.Ltmp99-.Ltmp98                 # Record length
.Ltmp98:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	0                               # Flags
	.asciz	"out"
	.p2align	2, 0x0
.Ltmp99:
	.cv_def_range	 .Ltmp40 .Ltmp41, reg, 17
	.short	.Ltmp101-.Ltmp100               # Record length
.Ltmp100:
	.short	4355                            # Record kind: S_BLOCK32
	.long	0                               # PtrParent
	.long	0                               # PtrEnd
	.long	.Ltmp38-.Ltmp33                 # Code size
	.secrel32	.Ltmp33                 # Function section relative address
	.secidx	.Lfunc_begin2                   # Function section index
	.byte	0                               # Lexical block name
	.p2align	2, 0x0
.Ltmp101:
	.short	.Ltmp103-.Ltmp102               # Record length
.Ltmp102:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	256                             # Flags
	.asciz	"i"
	.p2align	2, 0x0
.Ltmp103:
	.short	2                               # Record length
	.short	6                               # Record kind: S_END
	.short	.Ltmp105-.Ltmp104               # Record length
.Ltmp104:
	.short	4355                            # Record kind: S_BLOCK32
	.long	0                               # PtrParent
	.long	0                               # PtrEnd
	.long	.Ltmp46-.Ltmp42                 # Code size
	.secrel32	.Ltmp42                 # Function section relative address
	.secidx	.Lfunc_begin2                   # Function section index
	.byte	0                               # Lexical block name
	.p2align	2, 0x0
.Ltmp105:
	.short	.Ltmp107-.Ltmp106               # Record length
.Ltmp106:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	256                             # Flags
	.asciz	"i"
	.p2align	2, 0x0
.Ltmp107:
	.short	2                               # Record length
	.short	6                               # Record kind: S_END
	.short	2                               # Record length
	.short	4431                            # Record kind: S_PROC_ID_END
.Ltmp91:
	.p2align	2, 0x0
	.cv_linetable	2, main, .Lfunc_end2
	.section	.debug$S,"dr"
	.long	241                             # Symbol subsection for globals
	.long	.Ltmp109-.Ltmp108               # Subsection size
.Ltmp108:
	.short	.Ltmp111-.Ltmp110               # Record length
.Ltmp110:
	.short	4365                            # Record kind: S_GDATA32
	.long	4103                            # Type
	.secrel32	SID                     # DataOffset
	.secidx	SID                             # Segment
	.asciz	"SID"                           # Name
	.p2align	2, 0x0
.Ltmp111:
	.short	.Ltmp113-.Ltmp112               # Record length
.Ltmp112:
	.short	4365                            # Record kind: S_GDATA32
	.long	116                             # Type
	.secrel32	enc_len                 # DataOffset
	.secidx	enc_len                         # Segment
	.asciz	"enc_len"                       # Name
	.p2align	2, 0x0
.Ltmp113:
	.short	.Ltmp115-.Ltmp114               # Record length
.Ltmp114:
	.short	4365                            # Record kind: S_GDATA32
	.long	116                             # Type
	.secrel32	ratio_x100              # DataOffset
	.secidx	ratio_x100                      # Segment
	.asciz	"ratio_x100"                    # Name
	.p2align	2, 0x0
.Ltmp115:
	.short	.Ltmp117-.Ltmp116               # Record length
.Ltmp116:
	.short	4365                            # Record kind: S_GDATA32
	.long	116                             # Type
	.secrel32	decode_ok               # DataOffset
	.secidx	decode_ok                       # Segment
	.asciz	"decode_ok"                     # Name
	.p2align	2, 0x0
.Ltmp117:
	.short	.Ltmp119-.Ltmp118               # Record length
.Ltmp118:
	.short	4365                            # Record kind: S_GDATA32
	.long	4104                            # Type
	.secrel32	v                       # DataOffset
	.secidx	v                               # Segment
	.asciz	"v"                             # Name
	.p2align	2, 0x0
.Ltmp119:
	.short	.Ltmp121-.Ltmp120               # Record length
.Ltmp120:
	.short	4365                            # Record kind: S_GDATA32
	.long	4104                            # Type
	.secrel32	enc                     # DataOffset
	.secidx	enc                             # Segment
	.asciz	"enc"                           # Name
	.p2align	2, 0x0
.Ltmp121:
	.short	.Ltmp123-.Ltmp122               # Record length
.Ltmp122:
	.short	4365                            # Record kind: S_GDATA32
	.long	4104                            # Type
	.secrel32	dec                     # DataOffset
	.secidx	dec                             # Segment
	.asciz	"dec"                           # Name
	.p2align	2, 0x0
.Ltmp123:
.Ltmp109:
	.p2align	2, 0x0
	.long	241
	.long	.Ltmp125-.Ltmp124               # Subsection size
.Ltmp124:
	.short	.Ltmp127-.Ltmp126               # Record length
.Ltmp126:
	.short	4360                            # Record kind: S_UDT
	.long	116                             # Type
	.asciz	"s32"
	.p2align	2, 0x0
.Ltmp127:
	.short	.Ltmp129-.Ltmp128               # Record length
.Ltmp128:
	.short	4360                            # Record kind: S_UDT
	.long	117                             # Type
	.asciz	"u32"
	.p2align	2, 0x0
.Ltmp129:
.Ltmp125:
	.p2align	2, 0x0
	.cv_filechecksums                       # File index to string table offset subsection
	.cv_stringtable                         # String table
	.long	241
	.long	.Ltmp131-.Ltmp130               # Subsection size
.Ltmp130:
	.short	.Ltmp133-.Ltmp132               # Record length
.Ltmp132:
	.short	4428                            # Record kind: S_BUILDINFO
	.long	4110                            # LF_BUILDINFO index
	.p2align	2, 0x0
.Ltmp133:
.Ltmp131:
	.p2align	2, 0x0
	.section	.debug$T,"dr"
	.p2align	2, 0x0
	.long	4                               # Debug section magic
	# ArgList (0x1000)
	.short	0xa                             # Record length
	.short	0x1201                          # Record kind: LF_ARGLIST
	.long	0x1                             # NumArgs
	.long	0x74                            # Argument: int
	# Procedure (0x1001)
	.short	0xe                             # Record length
	.short	0x1008                          # Record kind: LF_PROCEDURE
	.long	0x74                            # ReturnType: int
	.byte	0x0                             # CallingConvention: NearC
	.byte	0x0                             # FunctionOptions
	.short	0x1                             # NumParameters
	.long	0x1000                          # ArgListType: (int)
	# FuncId (0x1002)
	.short	0x16                            # Record length
	.short	0x1601                          # Record kind: LF_FUNC_ID
	.long	0x0                             # ParentScope
	.long	0x1001                          # FunctionType: int (int)
	.asciz	"rle_encode"                    # Name
	.byte	241
	# FuncId (0x1003)
	.short	0x16                            # Record length
	.short	0x1601                          # Record kind: LF_FUNC_ID
	.long	0x0                             # ParentScope
	.long	0x1001                          # FunctionType: int (int)
	.asciz	"rle_decode"                    # Name
	.byte	241
	# ArgList (0x1004)
	.short	0x6                             # Record length
	.short	0x1201                          # Record kind: LF_ARGLIST
	.long	0x0                             # NumArgs
	# Procedure (0x1005)
	.short	0xe                             # Record length
	.short	0x1008                          # Record kind: LF_PROCEDURE
	.long	0x74                            # ReturnType: int
	.byte	0x0                             # CallingConvention: NearC
	.byte	0x0                             # FunctionOptions
	.short	0x0                             # NumParameters
	.long	0x1004                          # ArgListType: ()
	# FuncId (0x1006)
	.short	0x12                            # Record length
	.short	0x1601                          # Record kind: LF_FUNC_ID
	.long	0x0                             # ParentScope
	.long	0x1005                          # FunctionType: int ()
	.asciz	"main"                          # Name
	.byte	243
	.byte	242
	.byte	241
	# Modifier (0x1007)
	.short	0xa                             # Record length
	.short	0x1001                          # Record kind: LF_MODIFIER
	.long	0x74                            # ModifiedType: int
	.short	0x1                             # Modifiers ( Const (0x1) )
	.byte	242
	.byte	241
	# Array (0x1008)
	.short	0xe                             # Record length
	.short	0x1503                          # Record kind: LF_ARRAY
	.long	0x74                            # ElementType: int
	.long	0x23                            # IndexType: unsigned __int64
	.short	0x60                            # SizeOf
	.byte	0                               # Name
	.byte	241
	# StringId (0x1009)
	.short	0x5a                            # Record length
	.short	0x1605                          # Record kind: LF_STRING_ID
	.long	0x0                             # Id
	.asciz	"C:\\Users\\mehme\\Documents\\\303\226devler\\CO_Project_5001230025_MehmetBatuhan\303\226zer\\build-o1" # StringData
	# StringId (0x100A)
	.short	0x5a                            # Record length
	.short	0x1605                          # Record kind: LF_STRING_ID
	.long	0x0                             # Id
	.asciz	"C:\\Users\\mehme\\Documents\\\303\226devler\\CO_Project_5001230025_MehmetBatuhan\303\226zer\\main.c" # StringData
	.byte	242
	.byte	241
	# StringId (0x100B)
	.short	0xa                             # Record length
	.short	0x1605                          # Record kind: LF_STRING_ID
	.long	0x0                             # Id
	.byte	0                               # StringData
	.byte	243
	.byte	242
	.byte	241
	# StringId (0x100C)
	.short	0x2e                            # Record length
	.short	0x1605                          # Record kind: LF_STRING_ID
	.long	0x0                             # Id
	.asciz	"C:\\Program Files\\LLVM\\bin\\clang-cl.exe" # StringData
	.byte	241
	# StringId (0x100D)
	.short	0x142a                          # Record length
	.short	0x1605                          # Record kind: LF_STRING_ID
	.long	0x0                             # Id
	.asciz	"\"-cc1\" \"-triple\" \"x86_64-pc-windows-msvc19.44.35228\" \"-Os\" \"-S\" \"-disable-free\" \"-clear-ast-before-backend\" \"-disable-llvm-verifier\" \"-discard-value-names\" \"-mrelocation-model\" \"pic\" \"-pic-level\" \"2\" \"-mframe-pointer=none\" \"-relaxed-aliasing\" \"-fmath-errno\" \"-ffp-contract=on\" \"-fno-rounding-math\" \"-mconstructor-aliases\" \"-fms-volatile\" \"-funwind-tables=2\" \"-target-cpu\" \"x86-64\" \"-mllvm\" \"-x86-asm-syntax=intel\" \"-tune-cpu\" \"generic\" \"-D_MT\" \"-flto-visibility-public-std\" \"--dependent-lib=libcmt\" \"--dependent-lib=oldnames\" \"--show-includes\" \"-sys-header-deps\" \"-stack-protector\" \"2\" \"-fdiagnostics-format\" \"msvc\" \"-gno-column-info\" \"-gcodeview\" \"-debug-info-kind=constructor\" \"-fdebug-compilation-dir=C:\\\\Users\\\\mehme\\\\Documents\\\\\303\226devler\\\\CO_Project_5001230025_MehmetBatuhan\303\226zer\\\\build-o1\" \"-ffunction-sections\" \"-fcoverage-compilation-dir=C:\\\\Users\\\\mehme\\\\Documents\\\\\303\226devler\\\\CO_Project_5001230025_MehmetBatuhan\303\226zer\\\\build-o1\" \"-resource-dir\" \"C:\\\\Program Files\\\\LLVM\\\\lib\\\\clang\\\\21\" \"-D\" \"WIN32\" \"-D\" \"_WINDOWS\" \"-internal-isystem\" \"C:\\\\Program Files\\\\LLVM\\\\lib\\\\clang\\\\21\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Tools\\\\MSVC\\\\14.44.35207\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Tools\\\\MSVC\\\\14.44.35207\\\\ATLMFC\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Auxiliary\\\\VS\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\include\\\\10.0.26100.0\\\\ucrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\um\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\shared\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\winrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\cppwinrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\NETFXSDK\\\\4.8\\\\include\\\\um\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Tools\\\\MSVC\\\\14.44.35207\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Tools\\\\MSVC\\\\14.44.35207\\\\ATLMFC\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Auxiliary\\\\VS\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\include\\\\10.0.26100.0\\\\ucrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\um\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\shared\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\winrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\cppwinrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\NETFXSDK\\\\4.8\\\\include\\\\um\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Tools\\\\MSVC\\\\14.44.35207\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Tools\\\\MSVC\\\\14.44.35207\\\\ATLMFC\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Auxiliary\\\\VS\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\include\\\\10.0.26100.0\\\\ucrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\um\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\shared\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\winrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\cppwinrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\NETFXSDK\\\\4.8\\\\include\\\\um\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Tools\\\\MSVC\\\\14.44.35207\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Tools\\\\MSVC\\\\14.44.35207\\\\ATLMFC\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Auxiliary\\\\VS\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\include\\\\10.0.26100.0\\\\ucrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\um\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\shared\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\winrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\cppwinrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\NETFXSDK\\\\4.8\\\\include\\\\um\" \"-ferror-limit\" \"19\" \"-fno-use-cxa-atexit\" \"-fms-extensions\" \"-fms-compatibility\" \"-fms-compatibility-version=19.44.35228\" \"-fskip-odr-check-in-gmf\" \"-fdelayed-template-parsing\" \"-vectorize-loops\" \"-vectorize-slp\" \"-faddrsig\" \"-x\" \"c\" \"C:\\\\Users\\\\mehme\\\\Documents\\\\\303\226devler\\\\CO_Project_5001230025_MehmetBatuhan\303\226zer\\\\main.c\"" # StringData
	.byte	241
	# BuildInfo (0x100E)
	.short	0x1a                            # Record length
	.short	0x1603                          # Record kind: LF_BUILDINFO
	.short	0x5                             # NumArgs
	.long	0x1009                          # Argument: C:\Users\mehme\Documents\Ödevler\CO_Project_5001230025_MehmetBatuhanÖzer\build-o1
	.long	0x100c                          # Argument: C:\Program Files\LLVM\bin\clang-cl.exe
	.long	0x100a                          # Argument: C:\Users\mehme\Documents\Ödevler\CO_Project_5001230025_MehmetBatuhanÖzer\main.c
	.long	0x100b                          # Argument
	.long	0x100d                          # Argument: "-cc1" "-triple" "x86_64-pc-windows-msvc19.44.35228" "-Os" "-S" "-disable-free" "-clear-ast-before-backend" "-disable-llvm-verifier" "-discard-value-names" "-mrelocation-model" "pic" "-pic-level" "2" "-mframe-pointer=none" "-relaxed-aliasing" "-fmath-errno" "-ffp-contract=on" "-fno-rounding-math" "-mconstructor-aliases" "-fms-volatile" "-funwind-tables=2" "-target-cpu" "x86-64" "-mllvm" "-x86-asm-syntax=intel" "-tune-cpu" "generic" "-D_MT" "-flto-visibility-public-std" "--dependent-lib=libcmt" "--dependent-lib=oldnames" "--show-includes" "-sys-header-deps" "-stack-protector" "2" "-fdiagnostics-format" "msvc" "-gno-column-info" "-gcodeview" "-debug-info-kind=constructor" "-fdebug-compilation-dir=C:\\Users\\mehme\\Documents\\Ödevler\\CO_Project_5001230025_MehmetBatuhanÖzer\\build-o1" "-ffunction-sections" "-fcoverage-compilation-dir=C:\\Users\\mehme\\Documents\\Ödevler\\CO_Project_5001230025_MehmetBatuhanÖzer\\build-o1" "-resource-dir" "C:\\Program Files\\LLVM\\lib\\clang\\21" "-D" "WIN32" "-D" "_WINDOWS" "-internal-isystem" "C:\\Program Files\\LLVM\\lib\\clang\\21\\include" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.44.35207\\include" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.44.35207\\ATLMFC\\include" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Auxiliary\\VS\\include" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.26100.0\\ucrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\um" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\shared" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\winrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\cppwinrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\include\\um" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.44.35207\\include" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.44.35207\\ATLMFC\\include" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Auxiliary\\VS\\include" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.26100.0\\ucrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\um" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\shared" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\winrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\cppwinrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\include\\um" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.44.35207\\include" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.44.35207\\ATLMFC\\include" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Auxiliary\\VS\\include" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.26100.0\\ucrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\um" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\shared" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\winrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\cppwinrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\include\\um" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.44.35207\\include" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.44.35207\\ATLMFC\\include" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Auxiliary\\VS\\include" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.26100.0\\ucrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\um" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\shared" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\winrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\cppwinrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\include\\um" "-ferror-limit" "19" "-fno-use-cxa-atexit" "-fms-extensions" "-fms-compatibility" "-fms-compatibility-version=19.44.35228" "-fskip-odr-check-in-gmf" "-fdelayed-template-parsing" "-vectorize-loops" "-vectorize-slp" "-faddrsig" "-x" "c" "C:\\Users\\mehme\\Documents\\Ödevler\\CO_Project_5001230025_MehmetBatuhanÖzer\\main.c"
	.byte	242
	.byte	241
	.addrsig
