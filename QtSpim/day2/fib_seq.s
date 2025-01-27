.text 0x00400000 

li $v0, 4
la $a0, ask_for_num
syscall 

li $v0, 5
syscall 
 
move $t0, $v0 

# If the num is 0 
blez $t0, end

# Print first Fibonacci number (0)
li $v0, 1
li $a0, 0  
syscall

# Print newline
li $v0, 4
la $a0, cr 
syscall

# If the num is 1
beq $t0, 1, end

# Print second Fibonacci number (1)
li $v0, 1
li $a0, 1  
syscall

# Print newline
li $v0, 4
la $a0, cr 
syscall

li $t1, 2 # Loop counter

li $t2, 0 # n-2 
li $t3, 1 # n-1

L1:
    bge $t1, $t0, end

    add $t4, $t2, $t3 
    
    li $v0, 1
    move $a0, $t4 
    syscall 

    li $v0, 4
    la $a0, cr 
    syscall

    move $t2, $t3 
    move $t3, $t4 

    addi $t1, $t1, 1
    j L1

end:
    li $v0, 10
    syscall

.data 
    ask_for_num: .asciiz "How many times do you wanna see the Fibonacci sequence: "
    cr: .asciiz "\n"