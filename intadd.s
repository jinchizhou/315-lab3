      .syntax unified
      .arch armv6
      .fpu vfp
      .text
      .extern printf

      .global intadd

intadd:
		push {r2-r4, lr}
		mov r2, r0 //r2 = x
		mov r3, r1 //r3 = y
		mov r4, #0 //r4 = carry

while:
		cmp r3, #0
		beq return
		and r4, r2, r3
		eor r2, r2, r3
		LSL r3, r4, #1
		b while

return:         mov r0, r2
		pop {r2-r4, pc}



/*
int Add(int x, int y)
{
    // Iterate till there is no carry  
    while (y != 0){
        // carry now contains common 
        //set bits of x and y
        int carry = x & y;  
 
        // Sum of bits of x and y where at 
        //least one of the bits is not set
        x = x ^ y; 
 
        // Carry is shifted by one so that adding
        // it to x gives the required sum
        y = carry << 1;
    }
    return x;
}




*/
