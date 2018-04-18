   .syntax unified

   .arch armv6
   .fpu vfp

   .global intsub
intsub:
         push {r4-r5, lr}
         mov r4, r0
         mov r5, r1
         sub r1, r0, r1
         ldr r0, printdata
         bl printf
         mov r0, r1
         pop {r4-r5, pc}


printdata:
      .word    results

s1:
   .asciz      "THis works\n"

results:
   .asciz      "DIff is %d\n"
