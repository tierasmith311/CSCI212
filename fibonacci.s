.cpu cortex-a53
.fpu neon-fp-armv8

.data @variables

output1: .asciz "enter fibonacci term: "
output2: .asciz "the Fibonacci number is: %d\n"	@printf("fib number is",a)
input: .asciz "%d"

.balign 4
a: .word 0


.text
.align 2
.global main
.type main, %function

main:


push {lr}		@mov r4,lr
@mov r4,lr

ldr r0, =output1		@print "enter fib term"
bl printf

@scanf("%d"r0,&a r1)
ldr r0, =input		@get input "%d"
ldr r1,=a		
bl scanf

ldr r0,=a
ldr r5,[r0]		@a is in r5

mov r2, #1	@ previous changed 
mov r3, #1	@current term
mov r6,#0	@ "next" for the else condition

cmp r5, #1
beq exit

cmp r5, #2
beq exit

mov r10, #2 	@ i = 2

loop:
cmp r10,r5		

bge done

add r6,r2,r3		@find next term that gets stored into r8
mov r2,r3		@updating previous 
mov r3,r6	@updating current


add r10,r10,#1		@i++

b loop

exit:		@since 1 and 2 = 1 branch to exit
ldr r0,=output2
mov r1,r2
bl printf
bx lr 

done:

ldr r0,=output2		@print output r6
mov r1, r6
bl printf

pop {lr}
bx lr @return 0
