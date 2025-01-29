#   def fibonacci(n):
#       if n < 2:
#           return n
#       else:
#           return fibonacci(n-1)+fibonacci(n-2)

.data 
input_msg: .asciiz "Enter a value: "
output_msg: .asciiz "Fibonacci for n: "

.text 0x00400000

main:
    # Sending the input_msg to console
    li $v0, 4
    la $a0, input_msg 
    syscall 

    # Collect user input, n
    li $v0, 5
    syscall 
    move $a0, $v0

    # Calling the fib function here and collecting the value
    jal fib 
    move $t0, $v0

    # Send the output_msg to console
    li $v0, 4
    la $a0, output_msg
    syscall 

    # Send the returned value
    li $v0, 1
    move $a0, $t0
    syscall 

end:
    # End gracefully
    li $v0, 10
    syscall

fib:
    # Base case if the number is less than 2, which we just return the number then
    blt $a0, 2, little_num
    move $t0, $a0 
    
    # Move the stack pointer and store
    # 8 bytes of data, 4 for the return
    # address and 4 for the input n
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $t0, 4($sp)

    # Compute the fib with n-1
    # then collect that value
    addi $a0, $t0, -1
    jal fib 
    move $t1, $v0

    # Restore the return address and original n
    lw $t0, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 8

    # Store return address and previous func value...
    # this could be simplified by not restoring the returning
    # address before and not storing it again here but restoring
    # it at the end
    #
    # I realized this after writing the code while commenting and
    # decided not to change it to preserve what I originally wrote
    addi $sp, $sp, -8
    sw $ra, 0($sp)
    sw $t1, 4($sp)

    # Compute fib with n-2
    addi $a0, $t0, -2
    jal fib 
    move $t2, $v0

    # Restore previous functions value and return address
    lw $t1, 4($sp)
    lw $ra, 0($sp)
    addi $sp, $sp, 8

    # Compute and return value
    add $v0, $t1, $t2

    jr $ra

little_num:
    # base case, just move argument to output
    move $v0, $a0
    jr $ra