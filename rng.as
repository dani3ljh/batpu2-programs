LDI r15 buffer_chars
define num_out 2
define rng 6
define controller_input 7

.loop
    // check controller input
    LOD r15 r1 controller_input
    LDI r2 0b00100000 // A button bitmask
	LDI r3 0b00010000 // B button bitmask
    AND r1 r2 r4
	AND r1 r3 r5
	
	// Halt if B button pressed
	CMP r5 r3
	BRH EQ .end
	
	// loop if A button not pressed
    CMP r4 r2
    BRH NE .loop

    // generate random number
    LOD r15 r1 rng
    STR r15 r1 num_out
    JMP .loop

.end
	HLT