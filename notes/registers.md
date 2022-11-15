
# x86-64 ISA Registers

## General-purpose registers

There are 16 general-purpose registers.

- first 8 are legacy from 32-bit arch
- from these, four are **computational registers**
  - `%rax`: This is the accumulator. It is the most widely used general- purpose register for computation.
  - `%rbx`: This is known as the “base register.” This is often used for indexed addressing
  - `%rcx`: This is known as the “counter register.” It is historically used for counts when doing repetitive code (loops)
  - `%rdx`: This is known as the “data register.” It has some special significance in certain arithmetic operations and input/output  operations and is also sometimes used in some instructions in coordination with %rax, such as with the divq instruction

The next four are still general (in the sense they could be used for normal storage), but are originally intended specific tasks. There are 32-bit and 16-bit versions of these registers but you cannot access individual bytes here.

- `%rsi`: This is the “source index” register. It has special uses for working with longer spans of memory
- `%rdi`: This is the “destination index” register. It is often used in conjunction with %rsi for working with longer spans of memory
- `%rbp`: This is the “base pointer”
- `%rsp`: This is the “stack pointer”

There are another eight general purpose registers: `%r8` through `%r15`. These registers also have 32-bit (`%r11d`), 16-bit (`%r11w`) and least-significant byte (`%r11b`) access.

## Special-purpose registers

- `%rip`: instruction pointer. We don't touch this ourselves - it gets incremented automatically on each clock cycle tick, or modified with the `jmp ADDRESS_OR_LABEL` instruction. This is also known as an inconditional jump.
- `%eflags`: represent comparison flags based on which we conditionally jump. Some useful ones:
  - `ZF`: set to 1 if last arithmetic operation is 0, or 0 if it isn't.
  - `CF`: Carry flag; set to 1 if result of last arithmetic operation resulted in a 'carry' (result is bigger than destination register)

We make use of these flags with conditional jumps:

- `jz`: jump if zero
- `jnz`: jump if **not** zero
- `jc`: jump if carry
- `jnc`: jump if **not** carry
