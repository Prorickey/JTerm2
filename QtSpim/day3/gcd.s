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
    # Collect the first number
    li $v0, 4
    la $a0, input_1
    syscall 

    li $v0, 5
    syscall 
    move $t0, $v0

    # Collect the second number
    li $v0, 4
    la $a0, input_2
    syscall 

    li $v0, 5
    syscall 
    move $t1, $v0

    # Move into argument registers
    move $a0, $t0
    move $a1, $t1

    # Execute function and collect return value
    jal gcd 
    move $t0, $v0 

    # Output return value
    li $v0, 4
    la $a0, output1
    syscall 

    li $v0, 1
    move $a0, $t0 
    syscall 

end:
    li $v0, 10
    syscall

# Implementation of the algorithm above
gcd:
    # divide and grab remainder and shuffle numbers
    div $a1, $a0 
    move $a1, $a0 
    mfhi $a0 

    # if zero, we're rolling smooth
    beq $a0, $zero, base

    # If not we save the return address and call it recursively 
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    jal gcd 

    lw $ra, 0($sp)
    addi $sp, $sp, 4

    jr $ra

base:
    move $v0, $a1
    jr $ra