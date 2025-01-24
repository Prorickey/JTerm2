.data
input_mess: .asciiz "Enter an integer value: "
entered: .asciiz "You entered: "
another_one: .asciiz "\nLets enter another number: "
add_up_to: .asciiz "\nYour numbers add up to: "

.text 0x00400000

# Ask user for their first number
li  $v0, 4 # Func four: display message
la $a0, input_mess # LOAD THE MESSAGE
syscall

# Read the number
li $v0, 5    # function 5 reads an integer
syscall     # call the function
move $t1, $v0   # move to t1

# Echo back the number
li  $v0, 4
la $a0, entered
syscall

li $v0, 1   # Function 1 displays the integer in console
move $a0, $t1
syscall

# Ask user for another integer
li  $v0, 4 # Func four: display message
la $a0, another_one # LOAD THE MESSAGE
syscall

# Read the number
li $v0, 5    # function 5 reads an integer
syscall     # call the function
move $t2, $v0   # move to t1

# Echo back the number
li  $v0, 4
la $a0, entered
syscall

li $v0, 1   # Function 1 displays the integer in console
move $a0, $t2
syscall

add $t3, $t1, $t2 # add first and second input together and store in t3
div $t4, $t2, 2 # divide the second integer by two
sub $t5, $t3, $t4 # subtract division by addition

# Message for added numbers
li  $v0, 4
la $a0, add_up_to
syscall

li $v0, 1   # Function 1 displays the integer in console
move $a0, $t5
syscall

li  $v0,10
syscall 