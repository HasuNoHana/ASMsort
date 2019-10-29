.data
buf:	.space	100 
text:	.asciiz "Enter string: \n" 
check:	.asciiz "a\n"
.text
.globl main 

main: 	la $a0, text 	
	li $v0, 4 	
	syscall 	
	 	
	la $a0, buf 	
	li $a1, 100 	
	li $v0, 8 	
	syscall
	
	la $t0, buf
	li $t1, 1 #i
	li $t2, 0 #n
	
count:	lb $t3, ($t0)
	beq $t3, '\n', start
	addi $t2,$t2,1
	addi $t0,$t0,1
	b count
	
start:	li $t1, 1
	la $t0, buf
	
loop1:	bgt $t1, $t2, ending
	addi $t0, $t0,1
	addi $t1, $t1,1
	lb $t5, -1($t0)
	lb $t6, ($t0)
	
	ble $t5, $t6, loop1
	
	sb $t5, ($t0)
	sb $t6, -1($t0)
	b loop1
	
ending:	beq $t2, 1, end
	addi $t2,$t2, -1
	b start
	
	 
	
end: 	la $a0, buf 	
	li $v0, 4 	
	syscall 	 	
	
	li $v0, 10 	
	syscall