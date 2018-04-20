    .syntax unified

    @ Template file for Lab 3
    @ Kyle Chin, Jinchi Zhou

    .arch armv6
    .fpu vfp 
    .text
    .extern printf
    @ --------------------------------
    .global main
    .global intadd

main:
    @ driver function main lives here, modify this for your other functions


    @ You'll need to scan characters for the operation and to determine
    @ if the program should repeat.
    @ To scan a character, and compare it to another, do the following
      
      push    {r4-r7, lr}

res:  ldr     r0, printdata
      bl      printf
      //ldr     r0, printdata+4
      //bl      printf
      ldr     r0, =scandec
      mov     r1, sp          @ Save stack pointer to r1, you must create space
      bl      scanf           @ Scan user's answer
      //ldr     r1, =yes        @ Put address of 'y' in r1
      //ldrb    r5, [r1]        @ Load the actual character 'y' into r5
      ldr     r4, [sp]        @ Put the user's value in r4
      
      ldr     r0, printdata+4
      bl      printf
      ldr     r0, =scandec
      mov     r1, sp
      bl      scanf
      ldr     r6, [sp]        @ stores user's second value in r6

      ldr     r0, printdata+8
      bl      printf
      ldr     r0, =scanchar   @ scans the operand
      mov     r1, sp
      bl      scanf
      ldrb    r7, [sp]        @ loads actual operand into r7
      
      ldr     r1, =mult       @ put address of '*' in r1
      ldrb    r5, [r1]        @ load actual character '*'
      mov     r0, r4
      mov     r1, r6
      cmp     r7, r5
      bne     tadd
      bl      intmul
      bl      cont
      
tadd: ldr     r1, =addi       @ put address of '+' in r1
      ldrb    r5, [r1]        @ load actual character '+'
      mov     r0, r4
      mov     r1, r6
      cmp     r7, r5
      bne     tsub
      bl      intadd
      bl      cont
      
tsub: ldr     r1, =subt       @ put address of '-' in r1
      ldrb    r5, [r1]        @ load actual character '-'
      mov     r0, r4
      mov     r1, r6
      cmp     r7, r5
      bne     errc
      bl      intsub
      bl      cont


errc: ldr     r0, printdata+28
      bl      printf
      b       ag
      
cont: mov     r1, r0         @ store return value in r1 to be printed
      ldr     r0, printdata+12
      bl      printf

ag:   ldr     r0, printdata+16
      bl      printf
      
      ldr     r0, =scanchar   @ scans the char
      mov     r1, sp
      bl      scanf
      ldrb    r7, [sp]        @ loads actual char into r7
      
      ldr     r1, =yes        @ put address of 'y' in r1
      ldrb    r5, [r1]        @ load actual character 'y'
      cmp     r7, r5
      beq     res


end:  pop     {r4-r7, pc}
      /*//mov     r0, r2
      //bl      printf
      
      /*cmp     r4, r5          @ Compare user's answer to char 'y'
      //bge     main
      //cmp     r6, r5
      //bge     main
      //ldr     r0, printdata+12 
      //mov     r0, r2 */
    @ this only works for character scans. You'll need a different
    @ format specifier for scanf for an integer ("%d"), and you'll
    @ need to use the ldr instruction instead of ldrb to load an int.

printdata:
      .word    string1
      .word    string2
      .word    strop
      .word    strre
      .word    again
      .word    plz
      .word    works
      .word    errorcheck
errorcheck:
      .asciz   "Invalid\t \tOperation\tEntered.\n"
plz:
      .asciz   "Finished\n"
works:
      .asciz   "This is ending\n"
string1:
      .asciz   "Enter Number 1: "
string2:
      .asciz   "Enter Number 2: "
strop:
      .asciz   "Enter Operation: "
strre:
      .asciz   "Result is: %d\n"
again:
      .asciz   "Again? "
mult:
      .byte    '*'
subt:
      .byte    '-'
addi:
      .byte    '+'
yes:
      .byte   'y'
scandec:
    .asciz  " %d"
scanchar:
    .asciz  " %c"
