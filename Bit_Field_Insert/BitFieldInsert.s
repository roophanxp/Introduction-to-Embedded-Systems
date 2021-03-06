		.syntax	unified
		.arch	armv7-m
		.text
		.thumb_func
		.align	2

// ------------------------------------------------------------------------------------------
// uint32_t BitFieldInsert(uint32_t word, int lsb, int width, uint32_t value)
// ------------------------------------------------------------------------------------------

		.globl  BitFieldInsert
BitFieldInsert:
        //Completed by Joseph Phan
		// On entry: R0 = word, R1 = lsb, R2 = width, R3 = value
        PUSH {R4,R5,R6}
        MOV R4, R2 //R4 is now width
        MOV R5, R3 //R5 is now value
        MOV R6, R1 //R6 is now lsb

        LDR R2, =1 //R2 is now mask
        ADD R3, R6, R4 //lsb + width
        LSL R3, R2, R3 //R3 contains (1<<(lsb+width)
        LSL R2, R2, R6 //R2 contains (1 << lsb)
        SUB R2, R3, R2 //(1<<(lsb+width) - (1<<lsb)
        MVN R2, R2 // ~mask
        AND R0, R0, R2 //word &= ~mask

        LDR R2, =1
        LSL R2, R2, R4 // 1<<width
        SUB R2, R2, #1 //
        AND R2, R2, R5 // value &= mask

        LSL R2, R2, R6 //value << lsb
        ORR R0, R0, R2 // word | (value << lsb)

        ORR R0, R0, R2


        POP {R4, R5, R6}
		BX      LR		            // return result in R0

		.end
