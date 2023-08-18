LCD_data equ P2    ;LCD Data port
LCD_rs   equ P0.0  ;LCD Register Select
LCD_rw   equ P0.1  ;LCD Read/Write
LCD_en   equ P0.2  ;LCD Enable


org 0000h
	ljmp main
	
org 001bh
inc r0	
reti	
	
org 030h
	
	
	main: 
	
	mov P2,#00h
      mov P1,#00h
	  ;initial delay for lcd power up

	;here1:setb p1.0
      	  acall delay
	;clr p1.0
	  acall delay
	;sjmp here1


	  acall lcd_init      ;initialise LCD
	  
	   mov a,#80h		 ;Put cursor on first row,1 column
	  acall lcd_command	 ;send command to LCD
	  acall delay
	  mov dptr,#my_string1   ;Load DPTR with sring1 Addr
	  acall lcd_sendstring	   ;call text strings sending routine
	  acall delay

	
	mov r0,#00h
	mov tmod,#11h
	mov ie,#10001000b
	mov th1,#0B1H
	mov tl1,#0E0H ////for duration of 10ms
	setb tr1	
	
	order1:
	
	cpl p0.7
	acall delay1
	cjne r0,#17h, order1	///for duration
	mov r0,#00h
	clr tr1
	mov th1,#0B1H
	mov tl1,#0E0H
	setb tr1
	ljmp order2
	
	
;-----------order1 done---------
order2:
	
	cpl p0.7
	acall delay2
	cjne r0,#17H, order2 ///for duration
	mov r0,#00h
	clr tr1
	mov th1,#0B1H
	mov tl1,#0E0H
	setb tr1
	ljmp order3
	
	
;----------------order2 done--------
order3:
	
	cpl p0.7
	acall delay3
	cjne r0,#17H, order3 ///for duration
	mov r0,#00h
	clr tr1
	mov th1,#0B1H
	mov tl1,#0E0H
	setb tr1
	ljmp order4
	
	
	
;----------------order3 done--------	
order4:
	
	cpl p0.7
	acall delay2
	cjne r0,#17H, order4 ///for duration
	mov r0,#00h
	clr tr1
	mov th1,#0B1H
	mov tl1,#0E0H
	setb tr1
	ljmp order5
	
	
;----------------order4 done--------	
order5:

	cpl p0.7
	acall delay4
	cjne r0,#23H, order5 ///for duration
	mov r0,#00h
	clr tr1
	mov th1,#0B1H
	mov tl1,#0E0H
	setb tr1
	ljmp order6
	
;----------------order5 done--------
order6:

	clr p0.7
	acall delay2
	cjne r0,#11H, order6 ///for duration
	mov r0,#00h
	clr tr1
	mov th1,#0B1H
	mov tl1,#0E0H
	setb tr1
	ljmp order7
	
	
	
;----------------order6 done--------	
order7:

	cpl p0.7
	acall delay4
	cjne r0,#23H, order7 ///for duration
	mov r0,#00h
	clr tr1
	mov th1,#0B1H
	mov tl1,#0E0H
	setb tr1
	ljmp order8
	
	
	
;----------------order7 done--------	
order8:

	cpl p0.7
	acall delay5
	cjne r0,#23H, order8 ///for duration
	mov r0,#00h
	clr tr1
	mov th1,#0B1H
	mov tl1,#0E0H
	setb tr1
	ljmp main
	
	
	
	
	org 200h
;------------------------LCD Initialisation routine----------------------------------------------------
lcd_init:
         mov   LCD_data,#38H  ;Function set: 2 Line, 8-bit, 5x7 dots
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
	     acall delay

         mov   LCD_data,#0CH  ;Display on, Curson off
         clr   LCD_rs         ;Selected instruction register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         
		 acall delay
         mov   LCD_data,#01H  ;Clear LCD
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         
		 acall delay

         mov   LCD_data,#06H  ;Entry mode, auto increment with no shift
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en

		 acall delay
         
         ret                  ;Return from routine

;-----------------------command sending routine-------------------------------------
 lcd_command:
         mov   LCD_data,A     ;Move the command to LCD port
         clr   LCD_rs         ;Selected command register
         clr   LCD_rw         ;We are writing in instruction register
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
		 acall delay
    
         ret  
;-----------------------data sending routine-------------------------------------		     
 lcd_senddata:
         mov   LCD_data,A     ;Move the command to LCD port
         setb  LCD_rs         ;Selected data register
         clr   LCD_rw         ;We are writing
         setb  LCD_en         ;Enable H->L
		 acall delay
         clr   LCD_en
         acall delay
		 acall delay
         ret                  ;Return from busy routine

;-----------------------text strings sending routine-------------------------------------
lcd_sendstring:
	push 0e0h
	lcd_sendstring_loop:
	 	 clr   a                 ;clear Accumulator for any previous data
	         movc  a,@a+dptr         ;load the first character in accumulator
	         jz    exit              ;go to exit if zero
	         acall lcd_senddata      ;send first char
	         inc   dptr              ;increment data pointer
	         sjmp  LCD_sendstring_loop    ;jump back to send the next character
exit:    pop 0e0h
         ret                     ;End of routine


;----------------------delay routine-----------------------------------------------------
delay:	 push 0
	 push 1
         mov r0,#1
loop2:	 mov r1,#255
	 loop1:	 djnz r1, loop1
	 djnz r0, loop2
	 pop 1
	 pop 0
	 ret
	 ; ------------all the durations invloved-------
	 delay5:
	mov th0,#0F4H ///for freq
	mov tl0,#02Ah
	setb tr0
	again5: jnb tf0,again5
	clr tr0
	clr tf0
	ret
	
	delay4:
	mov th0,#0F5H ///for freq
	mov tl0,#072h
	setb tr0
	again4: jnb tf0,again4
	clr tr0
	clr tf0
	ret
	
	delay2:
	mov th0,#0F0H ///for freq
	mov tl0,#038h
	setb tr0
	again2: jnb tf0,again2
	clr tr0
	clr tf0
	ret
	
	delay3:
	mov th0,#0F2H ///for freq
	mov tl0,#0B7h
	setb tr0
	again3: jnb tf0,again3
	clr tr0
	clr tf0
	ret
	
	delay1:
	mov th0,#0EEH ///for freq
	mov tl0,#03Fh
	setb tr0
	again1: jnb tf0,again1
	clr tr0
	clr tf0
	ret
;------------- ROM text strings---------------------------------------------------------------
org 300h
	my_string1:
         DB   "ROLLING TIME", 00H
			 
			 end