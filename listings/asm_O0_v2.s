	.def	@feat.00;
	.scl	3;
	.type	0;
	.endef
	.globl	@feat.00
@feat.00 = 0
	.intel_syntax noprefix
	.file	"main_v2.c"
	.def	rle_encode;
	.scl	2;
	.type	32;
	.endef
	.text
	.globl	rle_encode                      # -- Begin function rle_encode
	.p2align	4
rle_encode:                             # @rle_encode
.Lfunc_begin0:
	.cv_func_id 0
	.cv_file	1 "C:\\Users\\mehme\\Documents\\\303\226devler\\CO_Project_5001230025_MehmetBatuhan\303\226zer\\main_v2.c" "D3BECD9BD3CDE35643F8F4CFDCF1B5F1" 1
	.cv_loc	0 1 27 0                        # main_v2.c:27:0
.seh_proc rle_encode
# %bb.0:
	sub	rsp, 24
	.seh_stackalloc 24
	.seh_endprologue
	mov	dword ptr [rsp + 20], ecx
.Ltmp0:
	.cv_loc	0 1 28 0                        # main_v2.c:28:0
	mov	dword ptr [rsp + 16], 0
	.cv_loc	0 1 29 0                        # main_v2.c:29:0
	mov	dword ptr [rsp + 12], 0
.LBB0_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB0_3 Depth 2
	.cv_loc	0 1 30 0                        # main_v2.c:30:0
	mov	eax, dword ptr [rsp + 16]
	cmp	eax, dword ptr [rsp + 20]
	jge	.LBB0_8
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
.Ltmp1:
	.cv_loc	0 1 31 0                        # main_v2.c:31:0
	mov	dword ptr [rsp + 8], 1
.LBB0_3:                                #   Parent Loop BB0_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	.cv_loc	0 1 32 0                        # main_v2.c:32:0
	mov	ecx, dword ptr [rsp + 16]
	add	ecx, dword ptr [rsp + 8]
	xor	eax, eax
                                        # kill: def $al killed $al killed $eax
	cmp	ecx, dword ptr [rsp + 20]
	mov	byte ptr [rsp + 7], al          # 1-byte Spill
	jge	.LBB0_5
# %bb.4:                                #   in Loop: Header=BB0_3 Depth=2
	mov	eax, dword ptr [rsp + 16]
	add	eax, dword ptr [rsp + 8]
	movsxd	rcx, eax
	lea	rax, [rip + v]
	mov	eax, dword ptr [rax + 4*rcx]
	movsxd	rdx, dword ptr [rsp + 16]
	lea	rcx, [rip + v]
	cmp	eax, dword ptr [rcx + 4*rdx]
	sete	al
	mov	byte ptr [rsp + 7], al          # 1-byte Spill
.LBB0_5:                                #   in Loop: Header=BB0_3 Depth=2
	mov	al, byte ptr [rsp + 7]          # 1-byte Reload
	test	al, 1
	jne	.LBB0_6
	jmp	.LBB0_7
.LBB0_6:                                #   in Loop: Header=BB0_3 Depth=2
.Ltmp2:
	.cv_loc	0 1 32 0                        # main_v2.c:32:0
	mov	eax, dword ptr [rsp + 8]
	add	eax, 1
	mov	dword ptr [rsp + 8], eax
.Ltmp3:
	.cv_loc	0 1 32 0                        # main_v2.c:32:0
	jmp	.LBB0_3
.LBB0_7:                                #   in Loop: Header=BB0_1 Depth=1
	.cv_loc	0 1 33 0                        # main_v2.c:33:0
	movsxd	rcx, dword ptr [rsp + 16]
	lea	rax, [rip + v]
	mov	edx, dword ptr [rax + 4*rcx]
	shl	edx, 8
	or	edx, dword ptr [rsp + 8]
	movsxd	rcx, dword ptr [rsp + 12]
	lea	rax, [rip + enc]
	mov	dword ptr [rax + 4*rcx], edx
	.cv_loc	0 1 34 0                        # main_v2.c:34:0
	mov	eax, dword ptr [rsp + 12]
	add	eax, 1
	mov	dword ptr [rsp + 12], eax
	.cv_loc	0 1 35 0                        # main_v2.c:35:0
	mov	eax, dword ptr [rsp + 8]
	add	eax, dword ptr [rsp + 16]
	mov	dword ptr [rsp + 16], eax
.Ltmp4:
	.cv_loc	0 1 30 0                        # main_v2.c:30:0
	jmp	.LBB0_1
.LBB0_8:
	.cv_loc	0 1 37 0                        # main_v2.c:37:0
	mov	eax, dword ptr [rsp + 12]
	.seh_startepilogue
	add	rsp, 24
	.seh_endepilogue
	ret
.Ltmp5:
.Lfunc_end0:
	.seh_endproc
                                        # -- End function
	.def	rle_decode;
	.scl	2;
	.type	32;
	.endef
	.globl	rle_decode                      # -- Begin function rle_decode
	.p2align	4
rle_decode:                             # @rle_decode
.Lfunc_begin1:
	.cv_func_id 1
	.cv_loc	1 1 42 0                        # main_v2.c:42:0
.seh_proc rle_decode
# %bb.0:
	sub	rsp, 24
	.seh_stackalloc 24
	.seh_endprologue
	mov	dword ptr [rsp + 20], ecx
.Ltmp6:
	.cv_loc	1 1 43 0                        # main_v2.c:43:0
	mov	dword ptr [rsp + 16], 0
.Ltmp7:
	.cv_loc	1 1 44 0                        # main_v2.c:44:0
	mov	dword ptr [rsp + 12], 0
.LBB1_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_3 Depth 2
	mov	eax, dword ptr [rsp + 12]
	cmp	eax, dword ptr [rsp + 20]
	jge	.LBB1_8
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
.Ltmp8:
	.cv_loc	1 1 45 0                        # main_v2.c:45:0
	movsxd	rcx, dword ptr [rsp + 12]
	lea	rax, [rip + enc]
	mov	eax, dword ptr [rax + 4*rcx]
	sar	eax, 8
	mov	dword ptr [rsp + 8], eax
	.cv_loc	1 1 46 0                        # main_v2.c:46:0
	movsxd	rcx, dword ptr [rsp + 12]
	lea	rax, [rip + enc]
	mov	eax, dword ptr [rax + 4*rcx]
	and	eax, 255
	mov	dword ptr [rsp + 4], eax
.Ltmp9:
	.cv_loc	1 1 47 0                        # main_v2.c:47:0
	mov	dword ptr [rsp], 0
.LBB1_3:                                #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	mov	eax, dword ptr [rsp]
	cmp	eax, dword ptr [rsp + 4]
	jge	.LBB1_6
# %bb.4:                                #   in Loop: Header=BB1_3 Depth=2
.Ltmp10:
	.cv_loc	1 1 48 0                        # main_v2.c:48:0
	mov	eax, dword ptr [rsp + 8]
	mov	dl, al
	mov	eax, dword ptr [rsp + 16]
	mov	ecx, eax
	add	ecx, 1
	mov	dword ptr [rsp + 16], ecx
	movsxd	rcx, eax
	lea	rax, [rip + dec]
	mov	byte ptr [rax + rcx], dl
.Ltmp11:
# %bb.5:                                #   in Loop: Header=BB1_3 Depth=2
	.cv_loc	1 1 47 0                        # main_v2.c:47:0
	mov	eax, dword ptr [rsp]
	add	eax, 1
	mov	dword ptr [rsp], eax
	jmp	.LBB1_3
.Ltmp12:
.LBB1_6:                                #   in Loop: Header=BB1_1 Depth=1
	.cv_loc	1 1 50 0                        # main_v2.c:50:0
	jmp	.LBB1_7
.Ltmp13:
.LBB1_7:                                #   in Loop: Header=BB1_1 Depth=1
	.cv_loc	1 1 44 0                        # main_v2.c:44:0
	mov	eax, dword ptr [rsp + 12]
	add	eax, 1
	mov	dword ptr [rsp + 12], eax
	jmp	.LBB1_1
.Ltmp14:
.LBB1_8:
	.cv_loc	1 1 51 0                        # main_v2.c:51:0
	mov	eax, dword ptr [rsp + 16]
	.seh_startepilogue
	add	rsp, 24
	.seh_endepilogue
	ret
.Ltmp15:
.Lfunc_end1:
	.seh_endproc
                                        # -- End function
	.def	main;
	.scl	2;
	.type	32;
	.endef
	.globl	main                            # -- Begin function main
	.p2align	4
main:                                   # @main
.Lfunc_begin2:
	.cv_func_id 2
	.cv_loc	2 1 55 0                        # main_v2.c:55:0
.seh_proc main
# %bb.0:
	sub	rsp, 56
	.seh_stackalloc 56
	.seh_endprologue
	mov	dword ptr [rsp + 52], 0
.Ltmp16:
	.cv_loc	2 1 57 0                        # main_v2.c:57:0
	mov	dword ptr [rsp + 48], 1230025
.Ltmp17:
	.cv_loc	2 1 58 0                        # main_v2.c:58:0
	mov	dword ptr [rsp + 44], 0
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	cmp	dword ptr [rsp + 44], 24
	jge	.LBB2_4
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
.Ltmp18:
	.cv_loc	2 1 59 0                        # main_v2.c:59:0
	imul	eax, dword ptr [rsp + 48], 1664525
	add	eax, 1013904223
	mov	dword ptr [rsp + 48], eax
	.cv_loc	2 1 60 0                        # main_v2.c:60:0
	mov	edx, dword ptr [rsp + 48]
	shr	edx, 16
	and	edx, 1
	add	edx, 0
	movsxd	rcx, dword ptr [rsp + 44]
	lea	rax, [rip + v]
	mov	dword ptr [rax + 4*rcx], edx
.Ltmp19:
# %bb.3:                                #   in Loop: Header=BB2_1 Depth=1
	.cv_loc	2 1 58 0                        # main_v2.c:58:0
	mov	eax, dword ptr [rsp + 44]
	add	eax, 1
	mov	dword ptr [rsp + 44], eax
	jmp	.LBB2_1
.Ltmp20:
.LBB2_4:
	.cv_loc	2 1 62 0                        # main_v2.c:62:0
	mov	ecx, 24
	call	rle_encode
	mov	dword ptr [rip + enc_len], eax
	.cv_loc	2 1 63 0                        # main_v2.c:63:0
	mov	ecx, dword ptr [rip + enc_len]
	call	rle_decode
	mov	dword ptr [rsp + 40], eax
	.cv_loc	2 1 64 0                        # main_v2.c:64:0
	imul	eax, dword ptr [rip + enc_len], 100
	mov	ecx, 24
	cdq
	idiv	ecx
	mov	dword ptr [rip + ratio_x100], eax
	.cv_loc	2 1 65 0                        # main_v2.c:65:0
	cmp	dword ptr [rsp + 40], 24
	sete	al
	and	al, 1
	movzx	eax, al
	mov	dword ptr [rip + decode_ok], eax
.Ltmp21:
	.cv_loc	2 1 66 0                        # main_v2.c:66:0
	mov	dword ptr [rsp + 36], 0
.LBB2_5:                                # =>This Inner Loop Header: Depth=1
	cmp	dword ptr [rsp + 36], 24
	jge	.LBB2_10
# %bb.6:                                #   in Loop: Header=BB2_5 Depth=1
.Ltmp22:
	.cv_loc	2 1 67 0                        # main_v2.c:67:0
	movsxd	rcx, dword ptr [rsp + 36]
	lea	rax, [rip + dec]
	movzx	eax, byte ptr [rax + rcx]
	movsxd	rdx, dword ptr [rsp + 36]
	lea	rcx, [rip + v]
	cmp	eax, dword ptr [rcx + 4*rdx]
	je	.LBB2_8
# %bb.7:                                #   in Loop: Header=BB2_5 Depth=1
.Ltmp23:
	.cv_loc	2 1 68 0                        # main_v2.c:68:0
	mov	dword ptr [rip + decode_ok], 0
.Ltmp24:
.LBB2_8:                                #   in Loop: Header=BB2_5 Depth=1
	.cv_loc	2 1 70 0                        # main_v2.c:70:0
	jmp	.LBB2_9
.Ltmp25:
.LBB2_9:                                #   in Loop: Header=BB2_5 Depth=1
	.cv_loc	2 1 66 0                        # main_v2.c:66:0
	mov	eax, dword ptr [rsp + 36]
	add	eax, 1
	mov	dword ptr [rsp + 36], eax
	jmp	.LBB2_5
.Ltmp26:
.LBB2_10:
	.cv_loc	2 1 71 0                        # main_v2.c:71:0
	xor	eax, eax
	.seh_startepilogue
	add	rsp, 56
	.seh_endepilogue
	ret
.Ltmp27:
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
	.zero	24

	.section	.drectve,"yni"
	.ascii	" /DEFAULTLIB:libcmt.lib"
	.ascii	" /DEFAULTLIB:oldnames.lib"
	.section	.debug$S,"dr"
	.p2align	2, 0x0
	.long	4                               # Debug section magic
	.long	241
	.long	.Ltmp29-.Ltmp28                 # Subsection size
.Ltmp28:
	.short	.Ltmp31-.Ltmp30                 # Record length
.Ltmp30:
	.short	4353                            # Record kind: S_OBJNAME
	.long	0                               # Signature
	.asciz	"C:\\Users\\mehme\\Documents\\\303\226devler\\CO_Project_5001230025_MehmetBatuhan\303\226zer\\build-od\\CMakeFiles\\rle_v2.dir\\main_v2.c.obj" # Object name
	.p2align	2, 0x0
.Ltmp31:
	.short	.Ltmp33-.Ltmp32                 # Record length
.Ltmp32:
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
.Ltmp33:
.Ltmp29:
	.p2align	2, 0x0
	.long	241                             # Symbol subsection for rle_encode
	.long	.Ltmp35-.Ltmp34                 # Subsection size
.Ltmp34:
	.short	.Ltmp37-.Ltmp36                 # Record length
.Ltmp36:
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
	.byte	192                             # Flags
	.asciz	"rle_encode"                    # Function name
	.p2align	2, 0x0
.Ltmp37:
	.short	.Ltmp39-.Ltmp38                 # Record length
.Ltmp38:
	.short	4114                            # Record kind: S_FRAMEPROC
	.long	24                              # FrameSize
	.long	0                               # Padding
	.long	0                               # Offset of padding
	.long	0                               # Bytes of callee saved registers
	.long	0                               # Exception handler offset
	.short	0                               # Exception handler section
	.long	81920                           # Flags (defines frame register)
	.p2align	2, 0x0
.Ltmp39:
	.short	.Ltmp41-.Ltmp40                 # Record length
.Ltmp40:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	1                               # Flags
	.asciz	"n"
	.p2align	2, 0x0
.Ltmp41:
	.cv_def_range	 .Ltmp0 .Ltmp5, frame_ptr_rel, 20
	.short	.Ltmp43-.Ltmp42                 # Record length
.Ltmp42:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	0                               # Flags
	.asciz	"i"
	.p2align	2, 0x0
.Ltmp43:
	.cv_def_range	 .Ltmp0 .Ltmp5, frame_ptr_rel, 16
	.short	.Ltmp45-.Ltmp44                 # Record length
.Ltmp44:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	0                               # Flags
	.asciz	"k"
	.p2align	2, 0x0
.Ltmp45:
	.cv_def_range	 .Ltmp0 .Ltmp5, frame_ptr_rel, 12
	.short	.Ltmp47-.Ltmp46                 # Record length
.Ltmp46:
	.short	4355                            # Record kind: S_BLOCK32
	.long	0                               # PtrParent
	.long	0                               # PtrEnd
	.long	.Ltmp4-.Ltmp1                   # Code size
	.secrel32	.Ltmp1                  # Function section relative address
	.secidx	.Lfunc_begin0                   # Function section index
	.byte	0                               # Lexical block name
	.p2align	2, 0x0
.Ltmp47:
	.short	.Ltmp49-.Ltmp48                 # Record length
.Ltmp48:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	0                               # Flags
	.asciz	"run"
	.p2align	2, 0x0
.Ltmp49:
	.cv_def_range	 .Ltmp1 .Ltmp4, frame_ptr_rel, 8
	.short	2                               # Record length
	.short	6                               # Record kind: S_END
	.short	2                               # Record length
	.short	4431                            # Record kind: S_PROC_ID_END
.Ltmp35:
	.p2align	2, 0x0
	.cv_linetable	0, rle_encode, .Lfunc_end0
	.long	241                             # Symbol subsection for rle_decode
	.long	.Ltmp51-.Ltmp50                 # Subsection size
.Ltmp50:
	.short	.Ltmp53-.Ltmp52                 # Record length
.Ltmp52:
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
	.byte	192                             # Flags
	.asciz	"rle_decode"                    # Function name
	.p2align	2, 0x0
.Ltmp53:
	.short	.Ltmp55-.Ltmp54                 # Record length
.Ltmp54:
	.short	4114                            # Record kind: S_FRAMEPROC
	.long	24                              # FrameSize
	.long	0                               # Padding
	.long	0                               # Offset of padding
	.long	0                               # Bytes of callee saved registers
	.long	0                               # Exception handler offset
	.short	0                               # Exception handler section
	.long	81920                           # Flags (defines frame register)
	.p2align	2, 0x0
.Ltmp55:
	.short	.Ltmp57-.Ltmp56                 # Record length
.Ltmp56:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	1                               # Flags
	.asciz	"len"
	.p2align	2, 0x0
.Ltmp57:
	.cv_def_range	 .Ltmp6 .Ltmp15, frame_ptr_rel, 20
	.short	.Ltmp59-.Ltmp58                 # Record length
.Ltmp58:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	0                               # Flags
	.asciz	"o"
	.p2align	2, 0x0
.Ltmp59:
	.cv_def_range	 .Ltmp6 .Ltmp15, frame_ptr_rel, 16
	.short	.Ltmp61-.Ltmp60                 # Record length
.Ltmp60:
	.short	4355                            # Record kind: S_BLOCK32
	.long	0                               # PtrParent
	.long	0                               # PtrEnd
	.long	.Ltmp14-.Ltmp7                  # Code size
	.secrel32	.Ltmp7                  # Function section relative address
	.secidx	.Lfunc_begin1                   # Function section index
	.byte	0                               # Lexical block name
	.p2align	2, 0x0
.Ltmp61:
	.short	.Ltmp63-.Ltmp62                 # Record length
.Ltmp62:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	0                               # Flags
	.asciz	"j"
	.p2align	2, 0x0
.Ltmp63:
	.cv_def_range	 .Ltmp7 .Ltmp14, frame_ptr_rel, 12
	.short	.Ltmp65-.Ltmp64                 # Record length
.Ltmp64:
	.short	4355                            # Record kind: S_BLOCK32
	.long	0                               # PtrParent
	.long	0                               # PtrEnd
	.long	.Ltmp13-.Ltmp8                  # Code size
	.secrel32	.Ltmp8                  # Function section relative address
	.secidx	.Lfunc_begin1                   # Function section index
	.byte	0                               # Lexical block name
	.p2align	2, 0x0
.Ltmp65:
	.short	.Ltmp67-.Ltmp66                 # Record length
.Ltmp66:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	0                               # Flags
	.asciz	"value"
	.p2align	2, 0x0
.Ltmp67:
	.cv_def_range	 .Ltmp8 .Ltmp13, frame_ptr_rel, 8
	.short	.Ltmp69-.Ltmp68                 # Record length
.Ltmp68:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	0                               # Flags
	.asciz	"run"
	.p2align	2, 0x0
.Ltmp69:
	.cv_def_range	 .Ltmp8 .Ltmp13, frame_ptr_rel, 4
	.short	.Ltmp71-.Ltmp70                 # Record length
.Ltmp70:
	.short	4355                            # Record kind: S_BLOCK32
	.long	0                               # PtrParent
	.long	0                               # PtrEnd
	.long	.Ltmp12-.Ltmp9                  # Code size
	.secrel32	.Ltmp9                  # Function section relative address
	.secidx	.Lfunc_begin1                   # Function section index
	.byte	0                               # Lexical block name
	.p2align	2, 0x0
.Ltmp71:
	.short	.Ltmp73-.Ltmp72                 # Record length
.Ltmp72:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	0                               # Flags
	.asciz	"t"
	.p2align	2, 0x0
.Ltmp73:
	.cv_def_range	 .Ltmp9 .Ltmp12, frame_ptr_rel, 0
	.short	2                               # Record length
	.short	6                               # Record kind: S_END
	.short	2                               # Record length
	.short	6                               # Record kind: S_END
	.short	2                               # Record length
	.short	6                               # Record kind: S_END
	.short	2                               # Record length
	.short	4431                            # Record kind: S_PROC_ID_END
.Ltmp51:
	.p2align	2, 0x0
	.cv_linetable	1, rle_decode, .Lfunc_end1
	.long	241                             # Symbol subsection for main
	.long	.Ltmp75-.Ltmp74                 # Subsection size
.Ltmp74:
	.short	.Ltmp77-.Ltmp76                 # Record length
.Ltmp76:
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
	.byte	192                             # Flags
	.asciz	"main"                          # Function name
	.p2align	2, 0x0
.Ltmp77:
	.short	.Ltmp79-.Ltmp78                 # Record length
.Ltmp78:
	.short	4114                            # Record kind: S_FRAMEPROC
	.long	56                              # FrameSize
	.long	0                               # Padding
	.long	0                               # Offset of padding
	.long	0                               # Bytes of callee saved registers
	.long	0                               # Exception handler offset
	.short	0                               # Exception handler section
	.long	81920                           # Flags (defines frame register)
	.p2align	2, 0x0
.Ltmp79:
	.short	.Ltmp81-.Ltmp80                 # Record length
.Ltmp80:
	.short	4414                            # Record kind: S_LOCAL
	.long	117                             # TypeIndex
	.short	0                               # Flags
	.asciz	"x"
	.p2align	2, 0x0
.Ltmp81:
	.cv_def_range	 .Ltmp16 .Ltmp27, frame_ptr_rel, 48
	.short	.Ltmp83-.Ltmp82                 # Record length
.Ltmp82:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	0                               # Flags
	.asciz	"out"
	.p2align	2, 0x0
.Ltmp83:
	.cv_def_range	 .Ltmp16 .Ltmp27, frame_ptr_rel, 40
	.short	.Ltmp85-.Ltmp84                 # Record length
.Ltmp84:
	.short	4355                            # Record kind: S_BLOCK32
	.long	0                               # PtrParent
	.long	0                               # PtrEnd
	.long	.Ltmp20-.Ltmp17                 # Code size
	.secrel32	.Ltmp17                 # Function section relative address
	.secidx	.Lfunc_begin2                   # Function section index
	.byte	0                               # Lexical block name
	.p2align	2, 0x0
.Ltmp85:
	.short	.Ltmp87-.Ltmp86                 # Record length
.Ltmp86:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	0                               # Flags
	.asciz	"i"
	.p2align	2, 0x0
.Ltmp87:
	.cv_def_range	 .Ltmp17 .Ltmp20, frame_ptr_rel, 44
	.short	2                               # Record length
	.short	6                               # Record kind: S_END
	.short	.Ltmp89-.Ltmp88                 # Record length
.Ltmp88:
	.short	4355                            # Record kind: S_BLOCK32
	.long	0                               # PtrParent
	.long	0                               # PtrEnd
	.long	.Ltmp26-.Ltmp21                 # Code size
	.secrel32	.Ltmp21                 # Function section relative address
	.secidx	.Lfunc_begin2                   # Function section index
	.byte	0                               # Lexical block name
	.p2align	2, 0x0
.Ltmp89:
	.short	.Ltmp91-.Ltmp90                 # Record length
.Ltmp90:
	.short	4414                            # Record kind: S_LOCAL
	.long	116                             # TypeIndex
	.short	0                               # Flags
	.asciz	"i"
	.p2align	2, 0x0
.Ltmp91:
	.cv_def_range	 .Ltmp21 .Ltmp26, frame_ptr_rel, 36
	.short	2                               # Record length
	.short	6                               # Record kind: S_END
	.short	2                               # Record length
	.short	4431                            # Record kind: S_PROC_ID_END
.Ltmp75:
	.p2align	2, 0x0
	.cv_linetable	2, main, .Lfunc_end2
	.long	241                             # Symbol subsection for globals
	.long	.Ltmp93-.Ltmp92                 # Subsection size
.Ltmp92:
	.short	.Ltmp95-.Ltmp94                 # Record length
.Ltmp94:
	.short	4365                            # Record kind: S_GDATA32
	.long	4103                            # Type
	.secrel32	SID                     # DataOffset
	.secidx	SID                             # Segment
	.asciz	"SID"                           # Name
	.p2align	2, 0x0
.Ltmp95:
	.short	.Ltmp97-.Ltmp96                 # Record length
.Ltmp96:
	.short	4365                            # Record kind: S_GDATA32
	.long	116                             # Type
	.secrel32	enc_len                 # DataOffset
	.secidx	enc_len                         # Segment
	.asciz	"enc_len"                       # Name
	.p2align	2, 0x0
.Ltmp97:
	.short	.Ltmp99-.Ltmp98                 # Record length
.Ltmp98:
	.short	4365                            # Record kind: S_GDATA32
	.long	116                             # Type
	.secrel32	ratio_x100              # DataOffset
	.secidx	ratio_x100                      # Segment
	.asciz	"ratio_x100"                    # Name
	.p2align	2, 0x0
.Ltmp99:
	.short	.Ltmp101-.Ltmp100               # Record length
.Ltmp100:
	.short	4365                            # Record kind: S_GDATA32
	.long	116                             # Type
	.secrel32	decode_ok               # DataOffset
	.secidx	decode_ok                       # Segment
	.asciz	"decode_ok"                     # Name
	.p2align	2, 0x0
.Ltmp101:
	.short	.Ltmp103-.Ltmp102               # Record length
.Ltmp102:
	.short	4365                            # Record kind: S_GDATA32
	.long	4104                            # Type
	.secrel32	v                       # DataOffset
	.secidx	v                               # Segment
	.asciz	"v"                             # Name
	.p2align	2, 0x0
.Ltmp103:
	.short	.Ltmp105-.Ltmp104               # Record length
.Ltmp104:
	.short	4365                            # Record kind: S_GDATA32
	.long	4104                            # Type
	.secrel32	enc                     # DataOffset
	.secidx	enc                             # Segment
	.asciz	"enc"                           # Name
	.p2align	2, 0x0
.Ltmp105:
	.short	.Ltmp107-.Ltmp106               # Record length
.Ltmp106:
	.short	4365                            # Record kind: S_GDATA32
	.long	4105                            # Type
	.secrel32	dec                     # DataOffset
	.secidx	dec                             # Segment
	.asciz	"dec"                           # Name
	.p2align	2, 0x0
.Ltmp107:
.Ltmp93:
	.p2align	2, 0x0
	.long	241
	.long	.Ltmp109-.Ltmp108               # Subsection size
.Ltmp108:
	.short	.Ltmp111-.Ltmp110               # Record length
.Ltmp110:
	.short	4360                            # Record kind: S_UDT
	.long	116                             # Type
	.asciz	"s32"
	.p2align	2, 0x0
.Ltmp111:
	.short	.Ltmp113-.Ltmp112               # Record length
.Ltmp112:
	.short	4360                            # Record kind: S_UDT
	.long	117                             # Type
	.asciz	"u32"
	.p2align	2, 0x0
.Ltmp113:
	.short	.Ltmp115-.Ltmp114               # Record length
.Ltmp114:
	.short	4360                            # Record kind: S_UDT
	.long	32                              # Type
	.asciz	"u8"
	.p2align	2, 0x0
.Ltmp115:
.Ltmp109:
	.p2align	2, 0x0
	.cv_filechecksums                       # File index to string table offset subsection
	.cv_stringtable                         # String table
	.long	241
	.long	.Ltmp117-.Ltmp116               # Subsection size
.Ltmp116:
	.short	.Ltmp119-.Ltmp118               # Record length
.Ltmp118:
	.short	4428                            # Record kind: S_BUILDINFO
	.long	4111                            # LF_BUILDINFO index
	.p2align	2, 0x0
.Ltmp119:
.Ltmp117:
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
	# Array (0x1009)
	.short	0xe                             # Record length
	.short	0x1503                          # Record kind: LF_ARRAY
	.long	0x20                            # ElementType: unsigned char
	.long	0x23                            # IndexType: unsigned __int64
	.short	0x18                            # SizeOf
	.byte	0                               # Name
	.byte	241
	# StringId (0x100A)
	.short	0x5a                            # Record length
	.short	0x1605                          # Record kind: LF_STRING_ID
	.long	0x0                             # Id
	.asciz	"C:\\Users\\mehme\\Documents\\\303\226devler\\CO_Project_5001230025_MehmetBatuhan\303\226zer\\build-od" # StringData
	# StringId (0x100B)
	.short	0x5e                            # Record length
	.short	0x1605                          # Record kind: LF_STRING_ID
	.long	0x0                             # Id
	.asciz	"C:\\Users\\mehme\\Documents\\\303\226devler\\CO_Project_5001230025_MehmetBatuhan\303\226zer\\main_v2.c" # StringData
	.byte	243
	.byte	242
	.byte	241
	# StringId (0x100C)
	.short	0xa                             # Record length
	.short	0x1605                          # Record kind: LF_STRING_ID
	.long	0x0                             # Id
	.byte	0                               # StringData
	.byte	243
	.byte	242
	.byte	241
	# StringId (0x100D)
	.short	0x2e                            # Record length
	.short	0x1605                          # Record kind: LF_STRING_ID
	.long	0x0                             # Id
	.asciz	"C:\\Program Files\\LLVM\\bin\\clang-cl.exe" # StringData
	.byte	241
	# StringId (0x100E)
	.short	0x1402                          # Record length
	.short	0x1605                          # Record kind: LF_STRING_ID
	.long	0x0                             # Id
	.asciz	"\"-cc1\" \"-triple\" \"x86_64-pc-windows-msvc19.44.35228\" \"-O0\" \"-S\" \"-disable-free\" \"-clear-ast-before-backend\" \"-disable-llvm-verifier\" \"-discard-value-names\" \"-mrelocation-model\" \"pic\" \"-pic-level\" \"2\" \"-mframe-pointer=none\" \"-relaxed-aliasing\" \"-fmath-errno\" \"-ffp-contract=on\" \"-fno-rounding-math\" \"-mconstructor-aliases\" \"-fms-volatile\" \"-funwind-tables=2\" \"-target-cpu\" \"x86-64\" \"-mllvm\" \"-x86-asm-syntax=intel\" \"-tune-cpu\" \"generic\" \"-D_MT\" \"-flto-visibility-public-std\" \"--dependent-lib=libcmt\" \"--dependent-lib=oldnames\" \"--show-includes\" \"-sys-header-deps\" \"-stack-protector\" \"2\" \"-fdiagnostics-format\" \"msvc\" \"-gno-column-info\" \"-gcodeview\" \"-debug-info-kind=constructor\" \"-fdebug-compilation-dir=C:\\\\Users\\\\mehme\\\\Documents\\\\\303\226devler\\\\CO_Project_5001230025_MehmetBatuhan\303\226zer\\\\build-od\" \"-fcoverage-compilation-dir=C:\\\\Users\\\\mehme\\\\Documents\\\\\303\226devler\\\\CO_Project_5001230025_MehmetBatuhan\303\226zer\\\\build-od\" \"-resource-dir\" \"C:\\\\Program Files\\\\LLVM\\\\lib\\\\clang\\\\21\" \"-D\" \"WIN32\" \"-D\" \"_WINDOWS\" \"-internal-isystem\" \"C:\\\\Program Files\\\\LLVM\\\\lib\\\\clang\\\\21\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Tools\\\\MSVC\\\\14.44.35207\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Tools\\\\MSVC\\\\14.44.35207\\\\ATLMFC\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Auxiliary\\\\VS\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\include\\\\10.0.26100.0\\\\ucrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\um\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\shared\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\winrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\cppwinrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\NETFXSDK\\\\4.8\\\\include\\\\um\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Tools\\\\MSVC\\\\14.44.35207\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Tools\\\\MSVC\\\\14.44.35207\\\\ATLMFC\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Auxiliary\\\\VS\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\include\\\\10.0.26100.0\\\\ucrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\um\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\shared\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\winrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\cppwinrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\NETFXSDK\\\\4.8\\\\include\\\\um\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Tools\\\\MSVC\\\\14.44.35207\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Tools\\\\MSVC\\\\14.44.35207\\\\ATLMFC\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Auxiliary\\\\VS\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\include\\\\10.0.26100.0\\\\ucrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\um\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\shared\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\winrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\cppwinrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\NETFXSDK\\\\4.8\\\\include\\\\um\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Tools\\\\MSVC\\\\14.44.35207\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Tools\\\\MSVC\\\\14.44.35207\\\\ATLMFC\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files\\\\Microsoft Visual Studio\\\\2022\\\\Community\\\\VC\\\\Auxiliary\\\\VS\\\\include\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\include\\\\10.0.26100.0\\\\ucrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\um\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\shared\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\winrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\10\\\\\\\\include\\\\10.0.26100.0\\\\\\\\cppwinrt\" \"-internal-isystem\" \"C:\\\\Program Files (x86)\\\\Windows Kits\\\\NETFXSDK\\\\4.8\\\\include\\\\um\" \"-ferror-limit\" \"19\" \"-fno-use-cxa-atexit\" \"-fms-extensions\" \"-fms-compatibility\" \"-fms-compatibility-version=19.44.35228\" \"-fno-inline\" \"-fskip-odr-check-in-gmf\" \"-fdelayed-template-parsing\" \"-faddrsig\" \"-x\" \"c\" \"C:\\\\Users\\\\mehme\\\\Documents\\\\\303\226devler\\\\CO_Project_5001230025_MehmetBatuhan\303\226zer\\\\main_v2.c\"" # StringData
	.byte	242
	.byte	241
	# BuildInfo (0x100F)
	.short	0x1a                            # Record length
	.short	0x1603                          # Record kind: LF_BUILDINFO
	.short	0x5                             # NumArgs
	.long	0x100a                          # Argument: C:\Users\mehme\Documents\Ödevler\CO_Project_5001230025_MehmetBatuhanÖzer\build-od
	.long	0x100d                          # Argument: C:\Program Files\LLVM\bin\clang-cl.exe
	.long	0x100b                          # Argument: C:\Users\mehme\Documents\Ödevler\CO_Project_5001230025_MehmetBatuhanÖzer\main_v2.c
	.long	0x100c                          # Argument
	.long	0x100e                          # Argument: "-cc1" "-triple" "x86_64-pc-windows-msvc19.44.35228" "-O0" "-S" "-disable-free" "-clear-ast-before-backend" "-disable-llvm-verifier" "-discard-value-names" "-mrelocation-model" "pic" "-pic-level" "2" "-mframe-pointer=none" "-relaxed-aliasing" "-fmath-errno" "-ffp-contract=on" "-fno-rounding-math" "-mconstructor-aliases" "-fms-volatile" "-funwind-tables=2" "-target-cpu" "x86-64" "-mllvm" "-x86-asm-syntax=intel" "-tune-cpu" "generic" "-D_MT" "-flto-visibility-public-std" "--dependent-lib=libcmt" "--dependent-lib=oldnames" "--show-includes" "-sys-header-deps" "-stack-protector" "2" "-fdiagnostics-format" "msvc" "-gno-column-info" "-gcodeview" "-debug-info-kind=constructor" "-fdebug-compilation-dir=C:\\Users\\mehme\\Documents\\Ödevler\\CO_Project_5001230025_MehmetBatuhanÖzer\\build-od" "-fcoverage-compilation-dir=C:\\Users\\mehme\\Documents\\Ödevler\\CO_Project_5001230025_MehmetBatuhanÖzer\\build-od" "-resource-dir" "C:\\Program Files\\LLVM\\lib\\clang\\21" "-D" "WIN32" "-D" "_WINDOWS" "-internal-isystem" "C:\\Program Files\\LLVM\\lib\\clang\\21\\include" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.44.35207\\include" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.44.35207\\ATLMFC\\include" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Auxiliary\\VS\\include" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.26100.0\\ucrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\um" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\shared" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\winrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\cppwinrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\include\\um" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.44.35207\\include" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.44.35207\\ATLMFC\\include" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Auxiliary\\VS\\include" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.26100.0\\ucrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\um" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\shared" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\winrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\cppwinrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\include\\um" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.44.35207\\include" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.44.35207\\ATLMFC\\include" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Auxiliary\\VS\\include" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.26100.0\\ucrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\um" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\shared" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\winrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\cppwinrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\include\\um" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.44.35207\\include" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.44.35207\\ATLMFC\\include" "-internal-isystem" "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Auxiliary\\VS\\include" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.26100.0\\ucrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\um" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\shared" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\winrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\10\\\\include\\10.0.26100.0\\\\cppwinrt" "-internal-isystem" "C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\include\\um" "-ferror-limit" "19" "-fno-use-cxa-atexit" "-fms-extensions" "-fms-compatibility" "-fms-compatibility-version=19.44.35228" "-fno-inline" "-fskip-odr-check-in-gmf" "-fdelayed-template-parsing" "-faddrsig" "-x" "c" "C:\\Users\\mehme\\Documents\\Ödevler\\CO_Project_5001230025_MehmetBatuhanÖzer\\main_v2.c"
	.byte	242
	.byte	241
	.addrsig
	.addrsig_sym rle_encode
	.addrsig_sym rle_decode
	.addrsig_sym enc_len
	.addrsig_sym ratio_x100
	.addrsig_sym decode_ok
	.addrsig_sym v
	.addrsig_sym enc
	.addrsig_sym dec
