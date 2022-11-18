# x86-64 OS Interop

## System calls

`%rax` has the value for the desired syscall. For other syscalls, more info may be needed. It's stored in these registers (with ordering for esoteric reasons):

  1. `%rdi`
  2. `%rsi`
  3. `%rdx`
  4. `%r10`
  5. `%r8`
  6. `%r9`

Registers that get modified with a `syscall`:

- `%rcx`: stores next instruction address for when kernel returns
- `%r11`: stores contents of `%eflags`
- `%rax`: stores any return value from kernel

## Syscall examples

### unix time in seconds since epoch

- syscall number: `0xc9`
- parameters:
  - %rdi: pointer to address to store time
  - %rax: syscall number `0xc9`

### write output

There are 3 file descriptors available for a given process in linux

- 0 (stdin)
- 1 (stdout)
- 2 (stderr)

syscall number for writing is `0x01`. parameters are:

- %rdi: file descriptor
- %rsi: pointer to data to write out
- %rdx: length of the data

If data is null terminated, *do not* send null char (kernel uses count, not null terminator for end of data)

Get more info on syscalls by running

```shell
man 2 syscalls
```

or going [here](https://chromium.googlesource.com/chromiumos/docs/+/HEAD/constants/syscalls.md).
