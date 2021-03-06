		.syntax	unified
		.arch	armv7-m
		.text
		.thumb_func
		.align	2

// ------------------------------------------------------------------------------------------
// uint32_t ReverseByteOrder(uint32_t word)
// ------------------------------------------------------------------------------------------

		.globl  ReverseByteOrder
ReverseByteOrder:

		// On entry: R0 = word
        AND R1, R0, 0x000000FF//byte 4
        LSL R1, R1, #24
        AND R2, R0, 0x0000FF00//byte3
        LSL R2, R2, #8
        AND R3, R0, 0x00FF0000//byte2
        LSR R3, R3, #8
        LSR R0, R0, #24
        ADD R0, R0, R1
        ADD R0, R0, R2
        ADD R0, R0, R3
		BX	LR		    // Return result in R0

		.end
