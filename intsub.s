intsub:
		push {r2-r4}
		mov r2, r0 //r2 = x
		mov r3, r1 //r3 = y
		mov r4, #0 //r4 = ret

		eor r3, r3, #255

		mov r0, #1
		mov r1, r3
		bl intadd

		mov r3, r0
		
		mov r0, r2
		mov r1, r3
		bl intadd

		pop {r2-r4}

