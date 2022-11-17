# Intro to assembly

This is a companion codebase to `Learn to program with assembly` book. I'm liberally jumping over parts that I don't feel are conducive to my grasp of x86-64 assembly and expanding on those that I need to understand more.

This is loosely based on chapters and each portion is desgined to go along with the book.

## Development

I added a Dockerfile to run the compiling/linking on an alpine linux assembler since I'm running this on a mac (which doesn't have the same assembler syntax).

There's a `devcontainer` for VS container conveniently setup, which will load an image with all the required prequisites loaded along with syntax highlighting and automatic linting.

Optionally you can build with:

```shell
docker build -t intro_assembly . 
```

Run with:

```shell
docker run -it -v $(pwd):/workspace intro_assembly
```

The included `Makefile` has some quality-of-life additions I found lacking after coming from a heavily automated workflow (run these inside the Docker container):

- `make all` will compile and link all `*.s` files
- `make lint` uses [asmfmt](https://github.com/klauspost/asmfmt) to lint all your assembly files
- `make clean` removes all object and binary files

## Reference

It's good to keep in mind the following for writing good assembly. The linter will take care of most of this for you.

![assembly_layout](docs/code_layout.png)
