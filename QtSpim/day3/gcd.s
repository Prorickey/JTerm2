#   def gcd(a, b):
#       a, b = b % a, a
#       if a == 0:
#           BASE CASE
#           return b
#       else:
#           RECURSIVE CASE
#           return gcd(a, b)
#
#   print(gcd(42, 28))
#   print(gcd(28, 42))
#   print(gcd(345, 766))

.data 
input_1: .asciiz "Input #1: "
input_2: .asciiz "Input #2: "
output1: .asciiz "Greatest Common Divisor: "

.text 0x00400000

main:
    li $v0, 4
    la $a0, input_1
    syscall 

    li $v0, 5
    syscall 
    move $t0, $v0

    li $v0, 4
    la $a0, input_2
    syscall 

    li $v0, 5
    syscall 
    move $t1, $v0

    move $a0, $t0
    move $a1, $t1

    jal gcd 

    move $t0, $v0 

    li $v0, 4
    la $a0, output1
    syscall 

    li $v0, 1
    move $a0, $t0 
    syscall 

end:
    li $v0, 10
    syscall

gcd:
    div $a1, $a0 
    move $a1, $a0 
    mfhi $a0 

    beq $a0, $zero, base

    addi $sp, $sp, -4
    sw $ra, 0($sp)

    jal gcd 

    lw $ra, 0($sp)
    addi $sp, $sp, 4

    jr $ra

base:
    move $v0, $a1
    jr $ra