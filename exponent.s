.data 
int_msg: .asciiz "Enter an integer: "
exp_msg: .asciiz "Enter an exponent: "
out_msg: .asciiz "Answer: "

.text 0x00400000

# Ask for integer
li $v0, 4 
la $a0, int_msg 
syscall 

# Collect integer
li $v0, 5
syscall 
move $t0, $v0 

# Ask for exponent
li $v0, 4
la $a0, exp_msg 
syscall 

# Collect exponent
li $v0, 5
syscall 
move $t1, $v0 

# n times iterated
add $t2, $zero, $t1 

# final num 
add $t3, $zero, $t0

L_MUL:
    mul $t3, $t3, $t0 # Multiply and store in t3

    add $t0, $t0, 1 # add 1 to n
    blt $t2, $t1, L_MUL # restart if n is smaller than t1
    
# Output message
li $v0, 4
la $a0, out_msg
syscall 

# Output message
li $v0, 1
move $a0, $t3
syscall 

li $v0, 10
syscall