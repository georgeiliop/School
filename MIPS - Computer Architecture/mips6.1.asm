.data
	odd: .asciiz "odd"
	even: .asciiz "even"
.text

.globl main

main:
	li $v0,5
	syscall
	move $t0,$v0
	
	andi $s0,$t0,1
	
	beq $s0,$zero,prompteven
	li $v0,4
	la $a0,odd
	syscall
	
	li $v0,10
	syscall
prompteven:
	li $v0,4
	la $a0,even
	syscall