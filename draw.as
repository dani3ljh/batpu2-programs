// define port offsets
define x -8
define y -7
define draw_pixel -6
define clear_pixel -5
define load_pixel -4
define push_screen_buffer -3
define clear_screen_buffer -2

define write_char -1
LDI r15 buffer_chars
define clear_chars_buffer 1


STR r15 r0 clear_screen_buffer
LDI r1 0
LDI r2 0
LDI r3 5
LDI r4 3
CAL .draw_line
HLT

// plot point at r1 r2
.plot_point
	STR r15 r1 x
	STR r15 r2 y
	STR r15 r0 draw_pixel
	STR r15 r0 push_screen_buffer
	RET

// draws line from (r1, r2) to (r3, r4)
.draw_line
	// r5 = dx = x1 - x0
	SUB r3 r1 r5
	
	// r6 = 2*dy = 2*(y1 - y0)
	SUB r4 r2 r6
	LSH r6 r6
	
	// p = 2*dy - dx
	SUB r6 r5 r7
	
	// r5 = 2*dx
	LSH r5 r5
	
	.for_loop
		CAL .plot_point
		
		// if p > 0
		CMP r7 r0
		BRH EQ .end_if
		BRH LT .end_if
			INC r2
			// p -= 2*dx
			SUB r7 r5 r7
		.end_if
		// p += 2*dy
		ADD r7 r6 r7
		
		// x++
		INC r1
		
		// if x <= x1 loop
		CMP r1 r3
		BRH LT .for_loop
		BRH EQ .for_loop
	RET