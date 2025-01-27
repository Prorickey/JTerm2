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
li $t1, 0 # Reset byte counter

li $t2, 0 # Stored sum

start:
    # Check if num is neg
    lw $t3, array($t1)
    bge $t3, 0, pos 

    sub $t2, $t2, $t3

    j end

pos:
    add $t2, $t2, $t3

    j end

end:
    addi $t0, $t0, 1 # Increment counter by 1
    addi $t1, $t1, 4 # Increment byte counter by 4
    bne $t0, 5, start # If we haven't done 5 iterations, go back to loop 

    j finish

finish:
    li $v0, 4
    la $a0, output 
    syscall 

    li $v0, 1
    move $a0, $t2
    syscall 

    li $v0, 10
    syscall

.data 
    ask_for_input: .asciiz "Input number: "
    output: .asciiz "Output: "

.align 2
    array: .space 20 # 5 numbers of 4 bytes