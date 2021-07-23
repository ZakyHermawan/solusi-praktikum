# program in MIPS assembly
addi $s0, $s0, 2
addi $s1, $s1, 2

addi $t0, $zero, -1
loop1:
addi $t0, $t0, 1
slt $t2, $t0, $s0
beq $t2, $zero, exit

addi $t1, $zero, -1
loop2:
addi $t1, $t1, 1
slt $t2, $t1, $s1
beq $t2, $zero, loop1
add $t3, $zero, $t1
sll $t3, $t3, 4
add $t3, $t3, $sp
add $t4, $t1, $t0
sw $t4, ($t3)
j loop2

exit:
addi $v0, $zero, 10
syscall
