# sorting program in MIPS assembly
addi $t0, $t0, 2
sw $t0, ($sp)
addi $t0, $zero, 4
sw $t0, 4($sp)
addi $t0, $zero, 3
sw $t0, 8($sp)
addi $t0, $zero, 6
sw $t0, 12($sp)
addi $t0, $zero, 1
sw $t0, 16($sp)

add $s3, $zero, $zero
addi $s2, $zero, 5

addi $s3, $zero, -1
loop1:
addi $s3, $s3, 1
slt $t0, $s3, $s2 # s3 = i
beq $t0, $zero, exit

addi $s4, $s3, 1 # s4 = j
loop2:

slt $t0, $s4, $s2
beq $t0, $zero, loop1

sll $t0, $s4, 2
add $t0, $t0, $sp # address of arr[j]
add $a0, $t0, $zero
lw $t1, ($t0) # arr[j]
sll $t0, $s3, 2
add $t0, $t0, $sp
add $a1, $t0, $zero
lw $t2, ($t0)
slt $t0, $t1, $t2
bne $t0, $zero, swap
rethere:
addi $s4, $s4, 1
j loop2 

swap:
lw $s0, ($a0)
lw $s1, ($a1)
sw $s0, ($a1)
sw $s1, ($a0)
j rethere


exit:
addi $v0, $zero, 10
syscall
