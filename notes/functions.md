# x86-64 Functions

## Linux System V ABI

### Preservation of registers

Function being called should preserve %rbp, %rbx, and %r12 through %r15
This also means if you call a function, any other registers than these can be overwritten

### Parameter registers

The positions correspond to the registers as follows:

1. %rdi
2. %rsi
3. %rdx
4. %rcx
5. %r8
6. %r9

If there are more than six parameters, all additional parameters get pushed onto the stack as quadwords (using `pushq`), with last parameter first.

### Function return value

Stored in `%rax`. If more values are needed, %rax can be pointer to array of values, etc

full documentation [here](https://gitlab.com/x86-psABIs/x86-64-ABI)

### Aligning the stack

According to the System V ABI, the stack is supposed to be aligned to a multiple of 16 bytes immediately before every function call. “Aligned to 16 bytes” means that the address of the stack pointer (%rsp) should be a multiple of 16.

Make sure you allocate multiples of 16 bytes on the stack. Ex: if you would call `enter $8, $0` instead call `enter $16, $0`.
