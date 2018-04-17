   .syntax unified

   .arch armv6
   .fpu vfp

   .global intadd
intadd:
         push {r4-r5, lr}
         mov r4, r0
         mov r5, r1
         ldr r0, printdata
         bl printf
         add r1, r4, r5
         ldr r0, printdata+4
         bl printf
         pop {r4-r5, pc}


printdata:
      .word    s1
      .word    results

s1:
   .asciz      "THis works\n"

results:
   .asciz      "SUm is %d\n"
