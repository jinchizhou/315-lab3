   .syntax unified

   .arch armv6
   .fpu vfp

   .global intsub
intsub:
         push {r4-r6, lr}
         mov r4, r0
         mov r5, r1
         sub r1, r0, r1
         mov r6, r1
         ldr r0, printdata
         bl printf
         mov r0, r6
         pop {r4-r6, pc}


printdata:
      .word    results

s1:
   .asciz      "THis works\n"

results:
   .asciz      "DIff is %d\n"
