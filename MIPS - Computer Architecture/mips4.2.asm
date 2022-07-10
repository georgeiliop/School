.data
	pos: .asciiz "Positive"
	nega: .asciiz "Non Positive"
.text

.globl main

main:
	li $v0,5
	syscall
	move $t0,$v0
	
	slt $s0,$t0,$zero
	beq $s0,$zero,promtpos
	li $v0,4
	la $a0,nega
	syscall
	
	li $v0,10
	syscall
promtpos:
	li $v0,4
	la $a0,pos
	syscall
	
	