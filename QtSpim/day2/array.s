.text 0x00400000

li $t2, 1 # Loop counter
li $t1, 0 # Offset counter

start: # Ask user to input values for array
    li $v0, 4
    la $a0, ask_for_input
    syscall 

    # Collect the input
    li $v0, 5 
    syscall 

    move $t0, $v0 
    sw $t0, arrayA($t1) # Move collected value into the memory location specified

    addi $t1, $t1, 4 # Update offset counter
    addi $t2, $t2, 1 # Update the counter
    bne $t2, 10, start 

li $v0, 10
syscall

.data 
ask_for_input: .asciiz "Enter an integer value: "

.align 2
arrayA: .space 40