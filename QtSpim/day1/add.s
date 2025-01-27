.text 0x00400000

# Recursive calls and stuff
addi    $t1,    $zero,  10  # Here we put 10 in register t1
addi    $t3,    $zero,  30

li $v0, 10         # Exit system call
syscall