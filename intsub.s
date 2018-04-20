

      .global intsub
intsub:
		push {r2-r4, lr}
		mov r2, r0 //r2 = x
		mov r3, r1 //r3 = y
                mov r4, #0 //r4 = borrow

twosc:		eor r3, r3, #255
		mov r0, #1
		mov r1, r3
		bl intadd

		mov r3, r0     // new y
		
		mov r0, r2     // add again
		mov r1, r3
		bl intadd

		pop {r2-r4, pc}
while:
        cmp r3, #0
        beq return
        eor r2, r2, #255
        and r4, r2, r3
        eor r2, r2, r3
        LSL r3, r4, #1
        b while

return: mov r0, r2
        pop {r2-r4, pc}

