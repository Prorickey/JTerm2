.text 0x00400000

li $t0, 1
start:      
    ble $t0, 9999999, next
    j leave_loop

next:
    # Print the value
    li $v0, 1
    move $a0, $t0 
    syscall

    # Print a new line
    li $v0, 4 
    la $a0, cr 
    syscall 

    add $t0, $t0, 1
    j start 

leave_loop:
    li $v0, 10
    syscall 

.data
cr: .asciiz "\n"