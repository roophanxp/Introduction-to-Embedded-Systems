		.syntax unified
		.arch	armv7-m
		.text
		.thumb_func
		.align	2

// ------------------------------------------------------------------------------------------
// uint32_t SqrtInASM(uint32_t x)
// ------------------------------------------------------------------------------------------

		.globl  SqrtInASM
SqrtInASM:
    //Created by Joseph Phan
    LDR R1, =0x40000000  //m
    LDR R2, =0 // y

    Loop:
        CMP R1, #0  //check is m!= 0
        IT EQ
        BEQ done
        ORR R3, R2, R1  //b = y | m ; R3 is B
        LSR R2, R2, #1 //y>>1

        CMP R3, R0 //check b<=x
        ITT LE
        SUBLE R0, R0, R3 //x = x-b
        ORRLE R2, R2, R1 //y = y | m

        LSR R1, R1, #2 //m = m >> 2
        B Loop

    done:
        MOV R0, R2
            //return y

		BX      LR

	        .end
