#   def fibonacci(n):
#       if n < 2:
#           return n
#       else:
#           return fibonacci(n-1)+fibonacci(n-2)

.data 
input_msg: .asciiz "Enter a value: "
output_msg: .asciiz "Fibonacci for n: "

.text 0x00400000

main:
    li $v0, 4
    la $a0, input_msg 
    syscall 

    li $v0, 5
    syscall 
    move $a0, $v0

    jal fib 
    move $t0, $v0

    li $v0, 4
    la $a0, output_msg
    syscall 

    li $v0, 1
    move $a0, $t0
    syscall 

    li $v0, 10
    syscall

fib:
    blt $a0, 2, little_num
    move $t0, $a0 

    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $t0, 4($sp)

    addi $a0, $t0, -1
    jal fib 
    move $t1, $v0

    lw $t0, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 8

    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $t1, 4($sp)

    addi $a0, $t0, -2
    jal fib 
    move $t2, $v0

    lw $t1, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 8

    add $v0, $t1, $t2

    jr $ra

little_num:
    move $v0, $a0
    jr $ra