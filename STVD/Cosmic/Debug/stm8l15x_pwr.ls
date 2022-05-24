   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.6 - 16 Dec 2021
   3                     ; Generator (Limited) V4.5.4 - 16 Dec 2021
   4                     ; Optimizer V4.5.4 - 16 Dec 2021
  50                     ; 82 void PWR_DeInit(void)
  50                     ; 83 {
  52                     .text:	section	.text,new
  53  0000               _PWR_DeInit:
  57                     ; 84   PWR->CSR1 = PWR_CSR1_PVDIF;
  59  0000 352050b2      	mov	20658,#32
  60                     ; 85   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
  62  0004 725f50b3      	clr	20659
  63                     ; 86 }
  66  0008 81            	ret	
 163                     ; 102 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
 163                     ; 103 {
 164                     .text:	section	.text,new
 165  0000               _PWR_PVDLevelConfig:
 167  0000 88            	push	a
 168       00000000      OFST:	set	0
 171                     ; 105   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
 173                     ; 108   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
 175  0001 c650b2        	ld	a,20658
 176  0004 a4f1          	and	a,#241
 177  0006 c750b2        	ld	20658,a
 178                     ; 111   PWR->CSR1 |= PWR_PVDLevel;
 180  0009 c650b2        	ld	a,20658
 181  000c 1a01          	or	a,(OFST+1,sp)
 182  000e c750b2        	ld	20658,a
 183                     ; 113 }
 186  0011 84            	pop	a
 187  0012 81            	ret	
 242                     ; 121 void PWR_PVDCmd(FunctionalState NewState)
 242                     ; 122 {
 243                     .text:	section	.text,new
 244  0000               _PWR_PVDCmd:
 248                     ; 124   assert_param(IS_FUNCTIONAL_STATE(NewState));
 250                     ; 126   if (NewState != DISABLE)
 252  0000 4d            	tnz	a
 253  0001 2705          	jreq	L111
 254                     ; 129     PWR->CSR1 |= PWR_CSR1_PVDE;
 256  0003 721050b2      	bset	20658,#0
 259  0007 81            	ret	
 260  0008               L111:
 261                     ; 134     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
 263  0008 721150b2      	bres	20658,#0
 264                     ; 136 }
 267  000c 81            	ret	
 302                     ; 171 void PWR_FastWakeUpCmd(FunctionalState NewState)
 302                     ; 172 {
 303                     .text:	section	.text,new
 304  0000               _PWR_FastWakeUpCmd:
 308                     ; 174   assert_param(IS_FUNCTIONAL_STATE(NewState));
 310                     ; 176   if (NewState != DISABLE)
 312  0000 4d            	tnz	a
 313  0001 2705          	jreq	L331
 314                     ; 179     PWR->CSR2 |= PWR_CSR2_FWU;
 316  0003 721450b3      	bset	20659,#2
 319  0007 81            	ret	
 320  0008               L331:
 321                     ; 184     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
 323  0008 721550b3      	bres	20659,#2
 324                     ; 186 }
 327  000c 81            	ret	
 363                     ; 194 void PWR_UltraLowPowerCmd(FunctionalState NewState)
 363                     ; 195 {
 364                     .text:	section	.text,new
 365  0000               _PWR_UltraLowPowerCmd:
 369                     ; 197   assert_param(IS_FUNCTIONAL_STATE(NewState));
 371                     ; 199   if (NewState != DISABLE)
 373  0000 4d            	tnz	a
 374  0001 2705          	jreq	L551
 375                     ; 202     PWR->CSR2 |= PWR_CSR2_ULP;
 377  0003 721250b3      	bset	20659,#1
 380  0007 81            	ret	
 381  0008               L551:
 382                     ; 207     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
 384  0008 721350b3      	bres	20659,#1
 385                     ; 209 }
 388  000c 81            	ret	
 423                     ; 232 void PWR_PVDITConfig(FunctionalState NewState)
 423                     ; 233 {
 424                     .text:	section	.text,new
 425  0000               _PWR_PVDITConfig:
 429                     ; 235   assert_param(IS_FUNCTIONAL_STATE(NewState));
 431                     ; 237   if (NewState != DISABLE)
 433  0000 4d            	tnz	a
 434  0001 2705          	jreq	L771
 435                     ; 240     PWR->CSR1 |= PWR_CSR1_PVDIEN;
 437  0003 721850b2      	bset	20658,#4
 440  0007 81            	ret	
 441  0008               L771:
 442                     ; 245     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
 444  0008 721950b2      	bres	20658,#4
 445                     ; 247 }
 448  000c 81            	ret	
 541                     ; 261 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
 541                     ; 262 {
 542                     .text:	section	.text,new
 543  0000               _PWR_GetFlagStatus:
 545  0000 88            	push	a
 546  0001 88            	push	a
 547       00000001      OFST:	set	1
 550                     ; 263   FlagStatus bitstatus = RESET;
 552                     ; 266   assert_param(IS_PWR_FLAG(PWR_FLAG));
 554                     ; 268   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
 556  0002 a501          	bcp	a,#1
 557  0004 2709          	jreq	L742
 558                     ; 270     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
 560  0006 720150b302    	btjf	20659,#0,L152
 561                     ; 272       bitstatus = SET;
 563  000b 2009          	jp	LC002
 564  000d               L152:
 565                     ; 276       bitstatus = RESET;
 566  000d 200b          	jp	L752
 567  000f               L742:
 568                     ; 281     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
 570  000f c650b2        	ld	a,20658
 571  0012 1502          	bcp	a,(OFST+1,sp)
 572  0014 2704          	jreq	L752
 573                     ; 283       bitstatus = SET;
 575  0016               LC002:
 577  0016 a601          	ld	a,#1
 580  0018 2001          	jra	L552
 581  001a               L752:
 582                     ; 287       bitstatus = RESET;
 585  001a 4f            	clr	a
 587  001b               L552:
 588                     ; 292   return((FlagStatus)bitstatus);
 592  001b 85            	popw	x
 593  001c 81            	ret	
 616                     ; 300 void PWR_PVDClearFlag(void)
 616                     ; 301 {
 617                     .text:	section	.text,new
 618  0000               _PWR_PVDClearFlag:
 622                     ; 303   PWR->CSR1 |= PWR_CSR1_PVDIF;
 624  0000 721a50b2      	bset	20658,#5
 625                     ; 304 }
 628  0004 81            	ret	
 678                     ; 311 ITStatus PWR_PVDGetITStatus(void)
 678                     ; 312 {
 679                     .text:	section	.text,new
 680  0000               _PWR_PVDGetITStatus:
 682  0000 89            	pushw	x
 683       00000002      OFST:	set	2
 686                     ; 313   ITStatus bitstatus = RESET;
 688                     ; 315   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
 692                     ; 317   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
 694  0001 c650b2        	ld	a,20658
 695  0004 a420          	and	a,#32
 696  0006 6b01          	ld	(OFST-1,sp),a
 698                     ; 318   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
 700  0008 c650b2        	ld	a,20658
 701  000b a410          	and	a,#16
 702  000d 6b02          	ld	(OFST+0,sp),a
 704                     ; 320   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
 706  000f 7b01          	ld	a,(OFST-1,sp)
 707  0011 2708          	jreq	L513
 709  0013 7b02          	ld	a,(OFST+0,sp)
 710  0015 2704          	jreq	L513
 711                     ; 322     bitstatus = (ITStatus)SET;
 713  0017 a601          	ld	a,#1
 716  0019 2001          	jra	L713
 717  001b               L513:
 718                     ; 326     bitstatus = (ITStatus)RESET;
 720  001b 4f            	clr	a
 722  001c               L713:
 723                     ; 328   return ((ITStatus)bitstatus);
 727  001c 85            	popw	x
 728  001d 81            	ret	
 752                     ; 336 void PWR_PVDClearITPendingBit(void)
 752                     ; 337 {
 753                     .text:	section	.text,new
 754  0000               _PWR_PVDClearITPendingBit:
 758                     ; 339   PWR->CSR1 |= PWR_CSR1_PVDIF;
 760  0000 721a50b2      	bset	20658,#5
 761                     ; 340 }
 764  0004 81            	ret	
 777                     	xdef	_PWR_PVDClearITPendingBit
 778                     	xdef	_PWR_PVDClearFlag
 779                     	xdef	_PWR_GetFlagStatus
 780                     	xdef	_PWR_PVDGetITStatus
 781                     	xdef	_PWR_PVDITConfig
 782                     	xdef	_PWR_UltraLowPowerCmd
 783                     	xdef	_PWR_FastWakeUpCmd
 784                     	xdef	_PWR_PVDCmd
 785                     	xdef	_PWR_PVDLevelConfig
 786                     	xdef	_PWR_DeInit
 805                     	end
