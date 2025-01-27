.data
input_x: .asciiz "Enter a number for X: "
input_a: .asciiz "Enter a number for A: "
input_b: .asciiz "Enter a number for B: "
input_c: .asciiz "Enter a number for C: "
output: .asciiz "Result: "

.text 0x00400000

# Input message for X
li $v0, 4
la $a0, input_x 
syscall 

# Collect X
li $v0, 5
syscall 
move $t0, $v0

# Input message for A
li $v0, 4
la $a0, input_a
syscall 

# Collect A
li $v0, 5
syscall 
move $t1, $v0

# Input message for B
li $v0, 4
la $a0, input_b
syscall 

# Collect B
li $v0, 5
syscall 
move $t2, $v0

# Input message for C
li $v0, 4
la $a0, input_c 
syscall 

# Collect C
li $v0, 5
syscall 
move $t3, $v0

mul $t1, $t1, $t0 
mul $t1, $t1, $t0
add $t3, $t3, $t1 
mul $t2, $t2, $t0 
add $t3, $t3, $t2

# output message
li $v0, 4
la $a0, output
syscall 

# output var
li $v0, 1
move $a0, $t3
syscall 

li $v0, 10
syscall