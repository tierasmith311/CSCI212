.cpu cortex-a53
.fpu neon-fp-armv8

.data


.text
.align 2
.global checkPrimeNumber
.type checkPrimeNumber, %function

checkPrimeNumber:

push {fp,lr}	@ save lr onto stack
add fp,sp,#4

mov r7,r0	@move n frrom the main
mov r5,#1 @flag = 1
mov r6,#2 @ j = 2
udiv r8,r7,r6	@n / 2 is in r8

loop:
cmp r6,r8	@j <= n/2(r8)
bgt endloop

@ r2 = r0 /r1
udiv r8, r7,r6		@ if n%j == 0, flag = 0
@c = c* b
mul r4,r8,r6	@ r4 = r8 * r6
@ c = a -c
sub r2,r7,r4	@n%j = r2

cmp r2,#0
beq flag	@go to flag to set to 0

add r6,r6,#1	@j++
b loop

flag:
mov r5, #0	@flag = 0
b endloop

endloop:
mov r0,r5	@flag is now in r0 to pass to main


sub sp,fp,#4
pop {fp,pc}