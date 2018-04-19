   .syntax unified

   .arch armv6
   .fpu vfp

   .global intadd
intadd:
         push {r4-r6, lr}
         mov r4, r0
         mov r5, r1
         add r1, r4, r5
         mov r6, r1                   @ it is necessary to put into another var to return
         ldr r0, printdata
         bl printf 
         //mov r1, #12
         mov r0, r6

         /*
         ldr r0, printdata
         bl printf 
         mov r4, r1
         mov r0, r4 */
         /*mov r1, r0
         ldr r0, printdata
         bl printf 
         mov r0, #5 */
         pop {r4-r6, pc}


printdata:
      .word    results

s1:
   .asciz      "THis works\n"

results:
   .asciz      "SUm is %d\n"
