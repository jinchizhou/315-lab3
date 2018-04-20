   .syntax unified

   .arch armv6
   .fpu vfp

   .global intmul

intmul:
			push {r4-r7, lr}
			//mov r4, r0 // r4 = a
			//mov r5, r1 // r5 = b
			mov r6, #0 // res



                        // r7 is temp
while:	 	        
                        /*mov r1, r5
                        ldr r0, printdata
                        bl printf */
                        cmp r5, #1 //while loop
			blt end
			and r7, r5, #1 //if(b & 1 )
			
                        cmp r7, #1
			beq intaddfunct

endwhile:	        
                        LSL r4, r4, #1 //a = a << 1
			LSR r5, r5, #1 //b = b >> 1
                        
                        /*mov r1, r4
                        ldr r0, printdata
                        bl printf
                        mov r1, r5
                        ldr r0, printdata
                        bl printf
			pop {r4-r7, pc} //restore temp registers
			*/
                        
                        b while

end:                 
                        mov r0, r6
			pop {r4-r7, pc} //restore temp registers

intaddfunct:            
			mov r0, r6 //mov result into r0 to send to intadd
		        mov r1, r4 //mov a into r1 to send to intadd
                        
                        bl intadd //branch to intadd
			
                        mov r6, r0 //mov the return val of intadd to result(r6)
			
                        /*mov r1, r6
                        ldr r0, printdata
                        bl printf
			pop {r4-r7, pc} //restore temp registers
                        */
                        
                        /*mov r1, r4
                        ldr r0, printdata
                        bl printf
                        mov r1, r5
                        ldr r0, printdata
                        bl printf
			pop {r4-r7, pc} //restore temp registers
*/
                        
                        b endwhile //branch to endwhile
			
printdata:
      .word  st1
      //.word  st2
st1:
      .asciz  "RET is %d\n"

