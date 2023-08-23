.cpu cortex-a53
.fpu neon-fp-armv8

.data
prompt1: .asciz "Enter two positive integers: "
input: .asciz "%d %d"
output: .asciz "The prime numbers between %d and %d are:  \n"
result:	.asciz	"%d "


.balign
a:	.word 	0
b:	.word	0

.text
.align 2
.global main
.type main, %function


main:

push {fp, lr}
add fp, sp, #4


@print prompt
ldr r0, =prompt1
bl printf

@scanf to read the 2 numbers
ldr r0, =input
ldr r1,=a
ldr r2,=b
bl scanf

ldr r0,=a
ldr r1, [r0]	@a is in r1

ldr r0,=b
ldr r2, [r0]	@b in r2


ldr r0,=output
mov r3, r1 @ n1 a
mov r4, r2 @ n2 b
bl printf

add r6, r3, #2 @i(r6) = n1(r3) + 1

loop:
cmp r6, r4    @i < n2
bge done      

@flag = checkprime(i)
mov r0,r6	@put i(r6) in r0 to pass to funct.
bl checkPrimeNumber 

mov r5,r0	@ flag is r5
@ if flag(r5) == 1
cmp r5, #1  

@printf %d,i
ldr r0,=result
mov r1,r6
bleq printf   


add r6,r6,#1	@i++
b loop


done:
sub sp,fp, #4
pop {fp, pc}