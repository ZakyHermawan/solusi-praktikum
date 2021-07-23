# recursion in MIPS assembly
.data
answer: .word 0

.text
addi $a0, $zero, 7 # nilai n
jal f
sw $v0, answer
j exit

f:
addi $sp, $sp, -12
sw $a0, ($sp)
sw $ra, 4($sp)

# base case
addi $v0, $zero, 1
beq $a0, 1, ret
beq $a0, 2, ret

addi $a0, $a0, -1
jal f
add $t0, $zero, $v0
sw $t0, 8($sp)
addi $a0, $a0, -1
jal f
lw $t0, 8($sp)
add $t1, $zero, $v0
add $v0, $t0, $t1

ret:
lw $a0, ($sp)
lw $ra, 4($sp)
addi $sp, $sp, 12
jr $ra

exit:
lw $a0, answer
addi $v0, $zero, 1
syscall

addi $v0, $zero, 10
syscall
