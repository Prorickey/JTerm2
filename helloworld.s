.data 
msg: .asciiz "\nHello, World: "

.text 0x00400000

# Recursive calls and stuff
addi    $t0,    $zero,  0  # Here we put 10 in register t1

L1:
    li  $v0, 4  # load function to print string
    la  $a0, msg    # Load the message by address
    syscall

    li  $v0, 1 # function to print integer to console
    move $a0, $t0 # Move the integer into the a0 register
    syscall

    addi $t0, $t0, 1
    blt $t0, 100, L1

li  $v0,10
syscall 