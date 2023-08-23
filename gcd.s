.cpu cortex-a53
.fpu neon-fp-armv8

.data
prompt1: .asciz "Enter first positive integer: "
prompt2: .asciz "Enter secondpositive integer: "
output: .asciz "The GCD is: %d\n"
input: .asciz "%d"
tinput:	.asciz	"%d"

line:	.asciz	"\n"
.balign 4
a: .word 	0
b: .word	0

.text
.align 2
.global main
.type main, %function

main:

mov r10,lr

ldr r0, =prompt1		@printing prompt1 
bl printf 

ldr r0, =input
ldr r1,=a
bl scanf

ldr r0,=a
ldr r5, [r0]		@store a into r5

@second input b
ldr r0, =prompt2
bl printf


ldr r0, =tinput
ldr r1, =b
bl scanf
ldr r1,=b
ldr r6, [r1]		@store b into r6


mov r4,#0

compare: 
cmp r5, r6 
bge loop  
  

swap: 

add r5, r5, r6
sub r6, r5, r6
sub r5, r5, r6



loop:


udiv r4, r5, r6			@r4 is the saved result from r5(a) and r6(b)
mul r4, r4, r6			@r4= r4 * r6  this is where issue is
sub r4, r5, r4			@r4 = r4-r6
cmp r4, #0			@r4 < 0 go to done
beq done

mov r5, r6
mov r6, r4  		@ r6 ,remainer

b loop

done:
ldr r0, =output	@output the gcd
mov r1, r6   @ moves value of r6 into %d of output message
bl printf

 
 
mov lr,r10
bx lr