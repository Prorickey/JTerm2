.data 
msg_1: .asciiz "\nPower "
msg_2: .asciiz ": "

.text 0x00400000

# Recursive calls and stuff
addi    $t0,    $zero,  1  # Here we put 10 in register t1

# Loop through powers 1-10
L1:

    # do the math and store result in t2
    add $t1, $zero, $zero
    addi $t2, $zero, 1
    L2:
        mul $t2, $t2, 2

        addi $t1, $t1, 1
        blt $t1, $t0, L2

    # Print first part of message
    li  $v0, 4  
    la  $a0, msg_1   
    syscall

    # Print current power
    li  $v0, 1 
    move $a0, $t0 
    syscall

    # Print second half of message
    li  $v0, 4  
    la  $a0, msg_2  
    syscall

    # Print result
    li  $v0, 1 
    move $a0, $t2
    syscall

    # Loop
    addi $t0, $t0, 1
    blt $t0, 11, L1

li  $v0, 10
syscall 