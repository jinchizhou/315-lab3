

      .global intsub
intsub:
		push {r2-r5, lr}
		mov r2, r0 //r2 = x
		mov r3, r1 //r3 = y
        	mov r4, #0 //r4 = borrow
		mov r5, #0 //r5 = (~x)

while:
        cmp r3, #0
        beq return
        mvn r5, r2
        and r4, r5, r3
        eor r2, r2, r3
        LSL r3, r4, #1
        b while

return: mov r0, r2
        pop {r2-r5, pc}
