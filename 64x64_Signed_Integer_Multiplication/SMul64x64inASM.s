		.syntax	unified
		.arch	armv7-m
		.text
		.thumb_func
		.align	2

// ------------------------------------------------------------------------------------------
// int64_t SMul64x64inASM(int64_t a, int64_t b)
// ------------------------------------------------------------------------------------------

		.globl  SMul64x64inASM
SMul64x64inASM:

	// The two parameters are passed to this function as follows:
	//
	// a<63..32> is in register R1; a<31..0> is in register R0
	// b<63..32> is in register R3; b<31..0> is in register R2
	//
	// Bits 63..32 of the product must be returned in register R1
	// Bits 31..0 of the product must be returned in register R0
	//
	// The value of all other registers must be preserved!

//Created by Joseph Phan
	PUSH {R4,R5,R6,R7}
    MOV R4, R0 //Contains a<31..0> Al
    MOV R5, R1 //Contains a<63..32> Ah
    MOV R6, R2 //Contains b<31..0> Bl
    MOV R7, R3 //Contains b<63..32> Bh

    UMULL R0, R1, R4, R6 //loXlo
    UMULL R2, R3, R7, R4 //hiXlo

    ADD R1, R1, R2 //add upper product and hiLow
    UMULL R2,R3, R6, R5 //loXhi

    //R0 is product
    ADD R1, R1, R2//add uppderproduct and loHi

    POP {R4,R5,R6,R7}
    BX	    LR		    	// Return to calling program.

        	.end
