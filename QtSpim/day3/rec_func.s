#   def fact(n):
#       if n == 0:
#           return 1
#       else:
#           return n*fact(n-1)
#
#   print(fact(5))

.text 0x00400000

main:
    # get the factorial of 10 and print to console
    li $a0, 10
    jal fact 
    move $t0, $v0

    li $v0, 1
    move $a0, $t0 
    syscall

    li $v0, 10
    syscall

fact:
    move $t0, $a0 # argument n

    # if zero, return 1
    beq $t0, $zero, base_case 

    # store return address and n in stack
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $t0, 4($sp)

    # Go back and find the factorial of previous number, then 
    # collect the value
    addi $a0, $t0, -1
    jal fact 
    move $t1, $v0

    # Restore return address and n from stack
    lw $t0, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 8

    # Computation and return
    mul $v0, $t0, $t1

    jr $ra

base_case:
    li $v0, 1
    jr $ra # Return to where return address is