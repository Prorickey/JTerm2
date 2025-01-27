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
    beq $t2, 0, cannot_put_zero

    sw $t2, array($t1)

    addi $t0, $t0, 1 # Increment counter by 1
    addi $t1, $t1, 4 # Increment byte counter by 4
    bne $t0, 5, L1 # If we haven't done 5 iterations, go back to loop 

L2:
    li $v0, 4 
    la $a0, ask_for_num 
    syscall 

    li $v0, 5 
    syscall 

    move $t2, $v0 # t2 stores the input value
    beq $t2, 0, end

    li $t3, 0 # 0 being false

    li $t0, 0 # Reset counter for loop 2
    li $t1, 0 # Reset byte counter

    j L3

# Search for input
L3: 
    lw $t4, array($t1)
    beq $t4, $t2, L3_found

    j L3_end
    
L3_found:
    addi $t3, $zero, 1

    j Res

L3_end:
    addi $t0, $t0, 1 # Increment counter by 1
    addi $t1, $t1, 4 # Increment byte counter by 4
    bne $t0, 5, L3 # If we haven't done 5 iterations, go back to loop 

    j Res

Res:
    beq $t3, 1, found 

    li $v0, 4
    la $a0, did_not_find
    syscall 

    j L2

found: 
    li $v0, 4
    la $a0, found_that_num
    syscall 

    j L2

end:
    li $v0, 10
    syscall

cannot_put_zero:
    li $v0, 4
    la $a0, cant_put_zero
    syscall 

    j L1

.data 
    ask_for_input: .asciiz "Enter a number for the array: "
    ask_for_num: .asciiz "Enter a number to search for: "
    found_that_num: .asciiz "Found the number in array\n"
    did_not_find: .asciiz "Did not find the number in array\n"
    cant_put_zero: .asciiz "You cannot enter a zero\n"

.align 2
    array: .space 20 # 5 numbers of 4 bytes