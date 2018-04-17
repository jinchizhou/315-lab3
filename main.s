    .syntax unified

    @ Template file for Lab 3
    @ Kyle Chin, Jinchi Zhou

    .arch armv7a
    .fpu vfp 
    @ --------------------------------
    .global main

main:
    @ driver function main lives here, modify this for your other functions


    @ You'll need to scan characters for the operation and to determine
    @ if the program should repeat.
    @ To scan a character, and compare it to another, do the following
      
      ldr     r0, printdata
      bl      printf
      ldr     r0, printdata+4
      bl      printf
      ldr     r0, =scanchar
      mov     r1, sp          @ Save stack pointer to r1, you must create space
      bl      scanf           @ Scan user's answer
      ldr     r1, =yes        @ Put address of 'j' in r1
      ldrb    r1, [r1]        @ Load the actual character 'j' into r1
      ldrb    r0, [sp]        @ Put the user's value in r0
      cmp     r0, r1          @ Compare user's answer to char 'j'
      bge     main
      //ldr     r0, printdata+8
      //mov     r0, r2
      bl      printf
//b       loop            @ branch to appropriate location
    @ this only works for character scans. You'll need a different
    @ format specifier for scanf for an integer ("%d"), and you'll
    @ need to use the ldr instruction instead of ldrb to load an int.

pd:
      .word    done
printdata:
      .word    string1
      .word    string2
      .word    done
string1:
      .asciz   "Enter Number 1:"
      .space   2
string2:
      .asciz   "Enter Number 2:"
done:
      .asciz   "Finished"
yes:
    .byte   'j'
scandec:
    .asciz  " %d"
scanchar:
    .asciz  " %c"
