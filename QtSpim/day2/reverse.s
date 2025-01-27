# Description

.text 0x00400000

li $t0, 0 # Loop counter
li $t1, 0 # Position counter

L1:
    li $v0, 4
    la $a0, ask_for_input
    syscall 

    li $v0, 5 
    syscall 

    move $t2, $v0 # t2 stores the input value
    sw $t2, array($t1)

    addi $t0, $t0, 1 # Increment counter by 1
    addi $t1, $t1, 4 # Increment byte counter by 4
    bne $t0, 5, L1 # If we haven't done 5 iterations, go back to loop 

li $t0, 0 # Reset counter for loop 2
li $t1, 16 # Reset byte counter

L2: 
    # Print the output string
    li $v0, 4
    la $a0, output
    syscall 

    # Print the number from the array
    li $v0, 1
    lw $a0, array($t1)
    syscall 

    # Do a little math and do conditional for loop
    sub $t1, $t1, 4
    addi $t0, $t0, 1
    bne $t0, 5, L2 

li $v0, 10
syscall

.data 
    ask_for_input: .asciiz "Enter a number: "
    output: .asciiz "\nOutput number in reverse order: "

.align 2
    array: .space 20 # 5 numbers of 4 bytes