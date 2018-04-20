   .syntax unified

   .arch armv6
   .fpu vfp

   .global intmul

intmul:
			push {r2-r7, lr}
			mov r2, r0 // r2 = a
			mov r3, r1 // r3 = b
			mov r4, #0 // res

                        mov r6, #0 // r6 represents neg or not
                        
                        cmp r2, #0 // check to see if num is negative
                        bge checksec
                        mvn r2, r2 // invert
                        
                        // call intadd
                        mov r0, r2
                        mov r1, #1
                        bl intadd
                        mov r2, r0
                        mvn r6, r6

                        /*mov r1, r2
                        ldr r0, printdata
                        bl printf */

checksec:               

                        /*mov r1, r2
                        ldr r0, printdata
                        bl printf */
                        
                        cmp r3, #0
                        bge while
                        mvn r3, r3

                        mov r0, r3
                        mov r1, #1
                        bl intadd
                        mov r3, r0
                        mvn r6, r6

                        /*mov r1, r6
                        ldr r0, printdata
                        bl printf  */
                        
                        // r5 is temp
while:	 	        
                        /*mov r1, r5
                        ldr r0, printdata
                        bl printf */

                        cmp r3, #1 //while loop
			blt end
			and r5, r3, #1 //if(b & 1 )
			
                        cmp r5, #1
			beq intaddfunct

endwhile:	        
                        LSL r2, r2, #1 //a = a << 1
			LSR r3, r3, #1 //b = b >> 1
                        
                        
                        b while

end:                    
                        cmp r6, #0
                        beq done
                        
                        mvn r4, r4
                        mov r0, r4
                        mov r1, #1
                        bl intadd
                        mov r4, r0

done:                   mov r0, r4
			pop {r2-r7, pc} //restore temp registers

intaddfunct:            
			mov r0, r4 //mov result into r0 to send to intadd
		        mov r1, r2 //mov a into r1 to send to intadd
                        
                        bl intadd //branch to intadd
			
                        mov r4, r0 //mov the return val of intadd to result(r6)
			
                        
                        b endwhile //branch to endwhile
			
printdata:
      .word  st1
st1:
      .asciz  "RET is %d\n"

