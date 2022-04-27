   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
  15                     	bsct
  16  0000               _speed:
  17  0000 00            	dc.b	0
  55                     ; 16 void setup(void){
  57                     	switch	.text
  58  0000               _setup:
  62                     ; 17 CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); //Nastavení vstupù a výstupù, rozbìhnutí hodin
  64  0000 4f            	clr	a
  65  0001 cd0000        	call	_CLK_HSIPrescalerConfig
  67                     ; 18 init_milis();
  69  0004 cd0000        	call	_init_milis
  71                     ; 19 GPIO_Init(LCD_RS_PORT, LCD_RS_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
  73  0007 4bc0          	push	#192
  74  0009 4b01          	push	#1
  75  000b ae501e        	ldw	x,#20510
  76  000e cd0000        	call	_GPIO_Init
  78  0011 85            	popw	x
  79                     ; 20 GPIO_Init(LCD_RW_PORT, LCD_RW_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
  81  0012 4bc0          	push	#192
  82  0014 4b04          	push	#4
  83  0016 ae500a        	ldw	x,#20490
  84  0019 cd0000        	call	_GPIO_Init
  86  001c 85            	popw	x
  87                     ; 21 GPIO_Init(LCD_E_PORT,LCD_E_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
  89  001d 4bc0          	push	#192
  90  001f 4b08          	push	#8
  91  0021 ae500a        	ldw	x,#20490
  92  0024 cd0000        	call	_GPIO_Init
  94  0027 85            	popw	x
  95                     ; 23 GPIO_Init(LCD_D4_PORT,LCD_D4_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
  97  0028 4bc0          	push	#192
  98  002a 4b40          	push	#64
  99  002c ae500f        	ldw	x,#20495
 100  002f cd0000        	call	_GPIO_Init
 102  0032 85            	popw	x
 103                     ; 24 GPIO_Init(LCD_D5_PORT,LCD_D5_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
 105  0033 4bc0          	push	#192
 106  0035 4b20          	push	#32
 107  0037 ae500f        	ldw	x,#20495
 108  003a cd0000        	call	_GPIO_Init
 110  003d 85            	popw	x
 111                     ; 25 GPIO_Init(LCD_D6_PORT,LCD_D6_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
 113  003e 4bc0          	push	#192
 114  0040 4b01          	push	#1
 115  0042 ae5014        	ldw	x,#20500
 116  0045 cd0000        	call	_GPIO_Init
 118  0048 85            	popw	x
 119                     ; 26 GPIO_Init(LCD_D7_PORT,LCD_D7_PIN,GPIO_MODE_OUT_PP_LOW_SLOW);
 121  0049 4bc0          	push	#192
 122  004b 4b02          	push	#2
 123  004d ae500a        	ldw	x,#20490
 124  0050 cd0000        	call	_GPIO_Init
 126  0053 85            	popw	x
 127                     ; 28 GPIO_Init(GPIOB, GPIO_PIN_1,GPIO_MODE_IN_FL_NO_IT);
 129  0054 4b00          	push	#0
 130  0056 4b02          	push	#2
 131  0058 ae5005        	ldw	x,#20485
 132  005b cd0000        	call	_GPIO_Init
 134  005e 85            	popw	x
 135                     ; 29 GPIO_Init(GPIOB, GPIO_PIN_0,GPIO_MODE_IN_FL_NO_IT);
 137  005f 4b00          	push	#0
 138  0061 4b01          	push	#1
 139  0063 ae5005        	ldw	x,#20485
 140  0066 cd0000        	call	_GPIO_Init
 142  0069 85            	popw	x
 143                     ; 33 GPIO_Init(GPIOB,GPIO_PIN_2,GPIO_MODE_OUT_PP_LOW_SLOW);
 145  006a 4bc0          	push	#192
 146  006c 4b04          	push	#4
 147  006e ae5005        	ldw	x,#20485
 148  0071 cd0000        	call	_GPIO_Init
 150  0074 85            	popw	x
 151                     ; 35 GPIO_Init(GPIOC,GPIO_PIN_5,GPIO_MODE_OUT_PP_LOW_SLOW);
 153  0075 4bc0          	push	#192
 154  0077 4b20          	push	#32
 155  0079 ae500a        	ldw	x,#20490
 156  007c cd0000        	call	_GPIO_Init
 158  007f 85            	popw	x
 159                     ; 36 GPIO_Init(GPIOE, GPIO_PIN_4,GPIO_MODE_IN_FL_NO_IT);
 161  0080 4b00          	push	#0
 162  0082 4b10          	push	#16
 163  0084 ae5014        	ldw	x,#20500
 164  0087 cd0000        	call	_GPIO_Init
 166  008a 85            	popw	x
 167                     ; 38 UART1_DeInit();         // smažu starou konfiguraci
 169  008b cd0000        	call	_UART1_DeInit
 171                     ; 39 UART1_Init((uint32_t) 115200,
 171                     ; 40 						UART1_WORDLENGTH_8D,
 171                     ; 41 						UART1_STOPBITS_1,
 171                     ; 42 						UART1_PARITY_NO,
 171                     ; 43 						UART1_SYNCMODE_CLOCK_DISABLE,
 171                     ; 44 						UART1_MODE_TXRX_ENABLE);
 173  008e 4b0c          	push	#12
 174  0090 4b80          	push	#128
 175  0092 4b00          	push	#0
 176  0094 4b00          	push	#0
 177  0096 4b00          	push	#0
 178  0098 aec200        	ldw	x,#49664
 179  009b 89            	pushw	x
 180  009c ae0001        	ldw	x,#1
 181  009f 89            	pushw	x
 182  00a0 cd0000        	call	_UART1_Init
 184  00a3 5b09          	addw	sp,#9
 185                     ; 45 UART1_ITConfig(UART1_IT_RXNE_OR, ENABLE);   // povolí pøerušení UART1 Rx
 187  00a5 4b01          	push	#1
 188  00a7 ae0205        	ldw	x,#517
 189  00aa cd0000        	call	_UART1_ITConfig
 191  00ad 84            	pop	a
 192                     ; 46 enableInterrupts();
 195  00ae 9a            rim
 197                     ; 47 UART1_Cmd(ENABLE);  // povolí UART1
 200  00af a601          	ld	a,#1
 201  00b1 cd0000        	call	_UART1_Cmd
 203                     ; 48 }
 206  00b4 81            	ret
 209                     	bsct
 210  0001               _zvuk:
 211  0001 0000          	dc.w	0
 212  0003               L52_ready1:
 213  0003 0001          	dc.w	1
 214  0005               L72_ready2:
 215  0005 0001          	dc.w	1
 269                     .const:	section	.text
 270  0000               L01:
 271  0000 000001f4      	dc.l	500
 272                     ; 51 int8_t check_pruchod(void){
 273                     	switch	.text
 274  00b5               _check_pruchod:
 276  00b5 5204          	subw	sp,#4
 277       00000004      OFST:	set	4
 280                     ; 52 uint32_t cas = 0;
 282                     ; 55 if (GPIO_ReadInputPin(IR_RX_1_PORT,IR_RX_1_PIN)!=RESET){
 284  00b7 4b01          	push	#1
 285  00b9 ae5005        	ldw	x,#20485
 286  00bc cd0000        	call	_GPIO_ReadInputPin
 288  00bf 5b01          	addw	sp,#1
 289  00c1 4d            	tnz	a
 290  00c2 2705          	jreq	L75
 291                     ; 56 ready1 = 1;
 293  00c4 ae0001        	ldw	x,#1
 294  00c7 bf03          	ldw	L52_ready1,x
 295  00c9               L75:
 296                     ; 58 if (GPIO_ReadInputPin(IR_RX_2_PORT,IR_RX_2_PIN)!=RESET){
 298  00c9 4b02          	push	#2
 299  00cb ae5005        	ldw	x,#20485
 300  00ce cd0000        	call	_GPIO_ReadInputPin
 302  00d1 5b01          	addw	sp,#1
 303  00d3 4d            	tnz	a
 304  00d4 2705          	jreq	L16
 305                     ; 59 ready2 = 1;
 307  00d6 ae0001        	ldw	x,#1
 308  00d9 bf05          	ldw	L72_ready2,x
 309  00db               L16:
 310                     ; 61 if (GPIO_ReadInputPin(IR_RX_1_PORT,IR_RX_1_PIN)==RESET && ready1 == 1){
 312  00db 4b01          	push	#1
 313  00dd ae5005        	ldw	x,#20485
 314  00e0 cd0000        	call	_GPIO_ReadInputPin
 316  00e3 5b01          	addw	sp,#1
 317  00e5 4d            	tnz	a
 318  00e6 2646          	jrne	L36
 320  00e8 be03          	ldw	x,L52_ready1
 321  00ea a30001        	cpw	x,#1
 322  00ed 263f          	jrne	L36
 323                     ; 62 cas = milis();
 325  00ef cd0000        	call	_milis
 327  00f2 cd0000        	call	c_uitolx
 329  00f5 96            	ldw	x,sp
 330  00f6 1c0001        	addw	x,#OFST-3
 331  00f9 cd0000        	call	c_rtol
 335  00fc 2019          	jra	L17
 336  00fe               L56:
 337                     ; 64 if (GPIO_ReadInputPin(IR_RX_2_PORT,IR_RX_2_PIN)==RESET){
 339  00fe 4b02          	push	#2
 340  0100 ae5005        	ldw	x,#20485
 341  0103 cd0000        	call	_GPIO_ReadInputPin
 343  0106 5b01          	addw	sp,#1
 344  0108 4d            	tnz	a
 345  0109 260c          	jrne	L17
 346                     ; 65 zvuk=1;
 348  010b ae0001        	ldw	x,#1
 349  010e bf01          	ldw	_zvuk,x
 350                     ; 66 ready1=0;
 352  0110 5f            	clrw	x
 353  0111 bf03          	ldw	L52_ready1,x
 354                     ; 67 return 1;
 356  0113 a601          	ld	a,#1
 358  0115 2051          	jra	L21
 359  0117               L17:
 360                     ; 63 while ((milis() - cas)< 500){
 362  0117 cd0000        	call	_milis
 364  011a cd0000        	call	c_uitolx
 366  011d 96            	ldw	x,sp
 367  011e 1c0001        	addw	x,#OFST-3
 368  0121 cd0000        	call	c_lsub
 370  0124 ae0000        	ldw	x,#L01
 371  0127 cd0000        	call	c_lcmp
 373  012a 25d2          	jrult	L56
 374  012c 2052          	jra	L77
 375  012e               L36:
 376                     ; 74 else if (GPIO_ReadInputPin(IR_RX_2_PORT,IR_RX_2_PIN)==RESET && ready2==1){
 378  012e 4b02          	push	#2
 379  0130 ae5005        	ldw	x,#20485
 380  0133 cd0000        	call	_GPIO_ReadInputPin
 382  0136 5b01          	addw	sp,#1
 383  0138 4d            	tnz	a
 384  0139 2645          	jrne	L77
 386  013b be05          	ldw	x,L72_ready2
 387  013d a30001        	cpw	x,#1
 388  0140 263e          	jrne	L77
 389                     ; 75 cas = milis();
 391  0142 cd0000        	call	_milis
 393  0145 cd0000        	call	c_uitolx
 395  0148 96            	ldw	x,sp
 396  0149 1c0001        	addw	x,#OFST-3
 397  014c cd0000        	call	c_rtol
 401  014f 201a          	jra	L701
 402  0151               L301:
 403                     ; 77 if (GPIO_ReadInputPin(IR_RX_1_PORT,IR_RX_1_PIN)==RESET){
 405  0151 4b01          	push	#1
 406  0153 ae5005        	ldw	x,#20485
 407  0156 cd0000        	call	_GPIO_ReadInputPin
 409  0159 5b01          	addw	sp,#1
 410  015b 4d            	tnz	a
 411  015c 260d          	jrne	L701
 412                     ; 78 zvuk=1;
 414  015e ae0001        	ldw	x,#1
 415  0161 bf01          	ldw	_zvuk,x
 416                     ; 79 ready2=0;
 418  0163 5f            	clrw	x
 419  0164 bf05          	ldw	L72_ready2,x
 420                     ; 80 return -1;
 422  0166 a6ff          	ld	a,#255
 424  0168               L21:
 426  0168 5b04          	addw	sp,#4
 427  016a 81            	ret
 428  016b               L701:
 429                     ; 76 while ((milis() - cas)< 500){
 431  016b cd0000        	call	_milis
 433  016e cd0000        	call	c_uitolx
 435  0171 96            	ldw	x,sp
 436  0172 1c0001        	addw	x,#OFST-3
 437  0175 cd0000        	call	c_lsub
 439  0178 ae0000        	ldw	x,#L01
 440  017b cd0000        	call	c_lcmp
 442  017e 25d1          	jrult	L301
 443  0180               L77:
 444                     ; 86 }
 446  0180 20e6          	jra	L21
 547                     	switch	.const
 548  0004               L61:
 549  0004 00000047      	dc.l	71
 550  0008               L22:
 551  0008 0000001f      	dc.l	31
 552                     ; 93 void main(void){
 553                     	switch	.text
 554  0182               _main:
 556  0182 5233          	subw	sp,#51
 557       00000033      OFST:	set	51
 560                     ; 95 	int8_t check = 0;
 562                     ; 96 	int8_t check_zvuk = 0;
 564  0184 0f31          	clr	(OFST-2,sp)
 566                     ; 97 	int8_t pruchody = 0;
 568  0186 0f32          	clr	(OFST-1,sp)
 570                     ; 98 	uint32_t timeA = 0;
 572  0188 ae0000        	ldw	x,#0
 573  018b 1f27          	ldw	(OFST-12,sp),x
 574  018d ae0000        	ldw	x,#0
 575  0190 1f25          	ldw	(OFST-14,sp),x
 577                     ; 99 	uint32_t timeB = 0;
 579  0192 ae0000        	ldw	x,#0
 580  0195 1f2b          	ldw	(OFST-8,sp),x
 581  0197 ae0000        	ldw	x,#0
 582  019a 1f29          	ldw	(OFST-10,sp),x
 584                     ; 100 	uint32_t timeC = 0;
 586  019c ae0000        	ldw	x,#0
 587  019f 1f2f          	ldw	(OFST-4,sp),x
 588  01a1 ae0000        	ldw	x,#0
 589  01a4 1f2d          	ldw	(OFST-6,sp),x
 591                     ; 101 	setup();
 593  01a6 cd0000        	call	_setup
 595                     ; 102 	lcd_init();
 597  01a9 cd0000        	call	_lcd_init
 599  01ac               L361:
 600                     ; 104 		if (GPIO_ReadInputPin(IR_RX_1_PORT,IR_RX_1_PIN)==RESET || GPIO_ReadInputPin(IR_RX_2_PORT,IR_RX_2_PIN)==RESET){
 602  01ac 4b01          	push	#1
 603  01ae ae5005        	ldw	x,#20485
 604  01b1 cd0000        	call	_GPIO_ReadInputPin
 606  01b4 5b01          	addw	sp,#1
 607  01b6 4d            	tnz	a
 608  01b7 270d          	jreq	L171
 610  01b9 4b02          	push	#2
 611  01bb ae5005        	ldw	x,#20485
 612  01be cd0000        	call	_GPIO_ReadInputPin
 614  01c1 5b01          	addw	sp,#1
 615  01c3 4d            	tnz	a
 616  01c4 2609          	jrne	L761
 617  01c6               L171:
 618                     ; 105 		GPIO_WriteHigh(GPIOC,GPIO_PIN_5);
 620  01c6 4b20          	push	#32
 621  01c8 ae500a        	ldw	x,#20490
 622  01cb cd0000        	call	_GPIO_WriteHigh
 624  01ce 84            	pop	a
 625  01cf               L761:
 626                     ; 107 		if ((milis() - timeA) > 70){
 628  01cf cd0000        	call	_milis
 630  01d2 cd0000        	call	c_uitolx
 632  01d5 96            	ldw	x,sp
 633  01d6 1c0025        	addw	x,#OFST-14
 634  01d9 cd0000        	call	c_lsub
 636  01dc ae0004        	ldw	x,#L61
 637  01df cd0000        	call	c_lcmp
 639  01e2 252e          	jrult	L371
 640                     ; 108 		timeA = milis();
 642  01e4 cd0000        	call	_milis
 644  01e7 cd0000        	call	c_uitolx
 646  01ea 96            	ldw	x,sp
 647  01eb 1c0025        	addw	x,#OFST-14
 648  01ee cd0000        	call	c_rtol
 651                     ; 109 		lcd_gotoxy(0 ,0);
 653  01f1 5f            	clrw	x
 654  01f2 cd0000        	call	_lcd_gotoxy
 656                     ; 110 		sprintf(text,"lidi uvnitr :%3d",pruchody+0);
 658  01f5 7b32          	ld	a,(OFST-1,sp)
 659  01f7 5f            	clrw	x
 660  01f8 4d            	tnz	a
 661  01f9 2a01          	jrpl	L02
 662  01fb 53            	cplw	x
 663  01fc               L02:
 664  01fc 97            	ld	xl,a
 665  01fd 89            	pushw	x
 666  01fe ae000c        	ldw	x,#L571
 667  0201 89            	pushw	x
 668  0202 96            	ldw	x,sp
 669  0203 1c0009        	addw	x,#OFST-42
 670  0206 cd0000        	call	_sprintf
 672  0209 5b04          	addw	sp,#4
 673                     ; 111 		lcd_puts(text);	
 675  020b 96            	ldw	x,sp
 676  020c 1c0005        	addw	x,#OFST-46
 677  020f cd0000        	call	_lcd_puts
 679  0212               L371:
 680                     ; 114 		if ((milis() - timeB ) > 30){
 682  0212 cd0000        	call	_milis
 684  0215 cd0000        	call	c_uitolx
 686  0218 96            	ldw	x,sp
 687  0219 1c0029        	addw	x,#OFST-10
 688  021c cd0000        	call	c_lsub
 690  021f ae0008        	ldw	x,#L22
 691  0222 cd0000        	call	c_lcmp
 693  0225 2533          	jrult	L771
 694                     ; 115 		timeB = milis();
 696  0227 cd0000        	call	_milis
 698  022a cd0000        	call	c_uitolx
 700  022d 96            	ldw	x,sp
 701  022e 1c0029        	addw	x,#OFST-10
 702  0231 cd0000        	call	c_rtol
 705                     ; 116 		check = check_pruchod();
 707  0234 cd00b5        	call	_check_pruchod
 709  0237 6b33          	ld	(OFST+0,sp),a
 711                     ; 117 		if (check!=1 && check != -1 && check != 0 ){
 713  0239 7b33          	ld	a,(OFST+0,sp)
 714  023b a101          	cp	a,#1
 715  023d 270c          	jreq	L102
 717  023f 7b33          	ld	a,(OFST+0,sp)
 718  0241 a1ff          	cp	a,#255
 719  0243 2706          	jreq	L102
 721  0245 0d33          	tnz	(OFST+0,sp)
 722  0247 2702          	jreq	L102
 723                     ; 118 		check=0;
 725  0249 0f33          	clr	(OFST+0,sp)
 727  024b               L102:
 728                     ; 120 		pruchody += check;
 730  024b 7b32          	ld	a,(OFST-1,sp)
 731  024d 1b33          	add	a,(OFST+0,sp)
 732  024f 6b32          	ld	(OFST-1,sp),a
 734                     ; 121 		if (pruchody < 0){
 736  0251 9c            	rvf
 737  0252 7b32          	ld	a,(OFST-1,sp)
 738  0254 a100          	cp	a,#0
 739  0256 2e02          	jrsge	L771
 740                     ; 122 		pruchody=0;
 742  0258 0f32          	clr	(OFST-1,sp)
 744  025a               L771:
 745                     ; 125 	if (zvuk == 1 && milis()-timeC > (100+speed*100)){
 747  025a be01          	ldw	x,_zvuk
 748  025c a30001        	cpw	x,#1
 749  025f 2703          	jreq	L62
 750  0261 cc01ac        	jp	L361
 751  0264               L62:
 753  0264 cd0000        	call	_milis
 755  0267 cd0000        	call	c_uitolx
 757  026a 96            	ldw	x,sp
 758  026b 1c002d        	addw	x,#OFST-6
 759  026e cd0000        	call	c_lsub
 761  0271 96            	ldw	x,sp
 762  0272 1c0001        	addw	x,#OFST-50
 763  0275 cd0000        	call	c_rtol
 766  0278 5f            	clrw	x
 767  0279 b600          	ld	a,_speed
 768  027b 2a01          	jrpl	L42
 769  027d 53            	cplw	x
 770  027e               L42:
 771  027e 97            	ld	xl,a
 772  027f a664          	ld	a,#100
 773  0281 cd0000        	call	c_bmulx
 775  0284 1c0064        	addw	x,#100
 776  0287 cd0000        	call	c_itolx
 778  028a 96            	ldw	x,sp
 779  028b 1c0001        	addw	x,#OFST-50
 780  028e cd0000        	call	c_lcmp
 782  0291 2503          	jrult	L03
 783  0293 cc01ac        	jp	L361
 784  0296               L03:
 785                     ; 126 	timeC = milis();
 787  0296 cd0000        	call	_milis
 789  0299 cd0000        	call	c_uitolx
 791  029c 96            	ldw	x,sp
 792  029d 1c002d        	addw	x,#OFST-6
 793  02a0 cd0000        	call	c_rtol
 796                     ; 127 	GPIO_WriteReverse(GPIOB,GPIO_PIN_2);
 798  02a3 4b04          	push	#4
 799  02a5 ae5005        	ldw	x,#20485
 800  02a8 cd0000        	call	_GPIO_WriteReverse
 802  02ab 84            	pop	a
 803                     ; 128 	check_zvuk ++;
 805  02ac 0c31          	inc	(OFST-2,sp)
 807                     ; 129 	if (check_zvuk == 2){
 809  02ae 7b31          	ld	a,(OFST-2,sp)
 810  02b0 a102          	cp	a,#2
 811  02b2 2703          	jreq	L23
 812  02b4 cc01ac        	jp	L361
 813  02b7               L23:
 814                     ; 130 		zvuk=0;
 816  02b7 5f            	clrw	x
 817  02b8 bf01          	ldw	_zvuk,x
 818                     ; 131 		check_zvuk=0;
 820  02ba 0f31          	clr	(OFST-2,sp)
 822  02bc acac01ac      	jpf	L361
 869                     ; 136 INTERRUPT_HANDLER(UART1_RX_IRQHandler, 18)
 869                     ; 137 {
 871                     	switch	.text
 872  02c0               f_UART1_RX_IRQHandler:
 874  02c0 8a            	push	cc
 875  02c1 84            	pop	a
 876  02c2 a4bf          	and	a,#191
 877  02c4 88            	push	a
 878  02c5 86            	pop	cc
 879       00000001      OFST:	set	1
 880  02c6 3b0002        	push	c_x+2
 881  02c9 be00          	ldw	x,c_x
 882  02cb 89            	pushw	x
 883  02cc 3b0002        	push	c_y+2
 884  02cf be00          	ldw	x,c_y
 885  02d1 89            	pushw	x
 886  02d2 88            	push	a
 889                     ; 139     char c = UART1_ReceiveData8();
 891  02d3 cd0000        	call	_UART1_ReceiveData8
 893  02d6 6b01          	ld	(OFST+0,sp),a
 895                     ; 140     UART1_SendData8(c);
 897  02d8 7b01          	ld	a,(OFST+0,sp)
 898  02da cd0000        	call	_UART1_SendData8
 900                     ; 141 		number= c - '0';
 902  02dd 7b01          	ld	a,(OFST+0,sp)
 903  02df a030          	sub	a,#48
 904  02e1 6b01          	ld	(OFST+0,sp),a
 906                     ; 142 		if (number >=0 && number <=9){
 908  02e3 7b01          	ld	a,(OFST+0,sp)
 909  02e5 a10a          	cp	a,#10
 910  02e7 2404          	jruge	L332
 911                     ; 143 		speed = number; 
 913  02e9 7b01          	ld	a,(OFST+0,sp)
 914  02eb b700          	ld	_speed,a
 915  02ed               L332:
 916                     ; 146 }
 919  02ed 84            	pop	a
 920  02ee 85            	popw	x
 921  02ef bf00          	ldw	c_y,x
 922  02f1 320002        	pop	c_y+2
 923  02f4 85            	popw	x
 924  02f5 bf00          	ldw	c_x,x
 925  02f7 320002        	pop	c_x+2
 926  02fa 80            	iret
 961                     ; 148 char putchar (char c)
 961                     ; 149 {
 963                     	switch	.text
 964  02fb               _putchar:
 966  02fb 88            	push	a
 967       00000000      OFST:	set	0
 970                     ; 151   UART1_SendData8(c);
 972  02fc cd0000        	call	_UART1_SendData8
 975  02ff               L552:
 976                     ; 153   while (UART1_GetFlagStatus(UART1_FLAG_TXE) == RESET);
 978  02ff ae0080        	ldw	x,#128
 979  0302 cd0000        	call	_UART1_GetFlagStatus
 981  0305 4d            	tnz	a
 982  0306 27f7          	jreq	L552
 983                     ; 155   return (c);
 985  0308 7b01          	ld	a,(OFST+1,sp)
 988  030a 5b01          	addw	sp,#1
 989  030c 81            	ret
1025                     ; 158 char getchar (void)
1025                     ; 159 {
1026                     	switch	.text
1027  030d               _getchar:
1029  030d 88            	push	a
1030       00000001      OFST:	set	1
1033                     ; 160 char c = 0;
1036  030e               L103:
1037                     ; 161 while (UART1_GetFlagStatus(UART1_FLAG_RXNE) == RESET);
1039  030e ae0020        	ldw	x,#32
1040  0311 cd0000        	call	_UART1_GetFlagStatus
1042  0314 4d            	tnz	a
1043  0315 27f7          	jreq	L103
1044                     ; 162 	c = UART1_ReceiveData8();
1046  0317 cd0000        	call	_UART1_ReceiveData8
1048  031a 6b01          	ld	(OFST+0,sp),a
1050                     ; 163 return (c);
1052  031c 7b01          	ld	a,(OFST+0,sp)
1055  031e 5b01          	addw	sp,#1
1056  0320 81            	ret
1091                     ; 178 void assert_failed(u8* file, u32 line)
1091                     ; 179 { 
1092                     	switch	.text
1093  0321               _assert_failed:
1097  0321               L323:
1098  0321 20fe          	jra	L323
1131                     	xdef	f_UART1_RX_IRQHandler
1132                     	xdef	_main
1133                     	xdef	_check_pruchod
1134                     	xdef	_zvuk
1135                     	xdef	_setup
1136                     	xdef	_speed
1137                     	xref	_lcd_puts
1138                     	xref	_lcd_gotoxy
1139                     	xref	_lcd_init
1140                     	xref	_sprintf
1141                     	xdef	_putchar
1142                     	xdef	_getchar
1143                     	xref	_init_milis
1144                     	xref	_delay_ms
1145                     	xref	_milis
1146                     	xdef	_assert_failed
1147                     	xref	_UART1_GetFlagStatus
1148                     	xref	_UART1_SendData8
1149                     	xref	_UART1_ReceiveData8
1150                     	xref	_UART1_ITConfig
1151                     	xref	_UART1_Cmd
1152                     	xref	_UART1_Init
1153                     	xref	_UART1_DeInit
1154                     	xref	_GPIO_ReadInputPin
1155                     	xref	_GPIO_WriteReverse
1156                     	xref	_GPIO_WriteHigh
1157                     	xref	_GPIO_Init
1158                     	xref	_CLK_HSIPrescalerConfig
1159                     	switch	.const
1160  000c               L571:
1161  000c 6c6964692075  	dc.b	"lidi uvnitr :%3d",0
1162                     	xref.b	c_x
1163                     	xref.b	c_y
1183                     	xref	c_itolx
1184                     	xref	c_bmulx
1185                     	xref	c_lcmp
1186                     	xref	c_lsub
1187                     	xref	c_rtol
1188                     	xref	c_uitolx
1189                     	end
