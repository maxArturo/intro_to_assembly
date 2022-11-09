# Intro to assembly

This is a companion codebase to [Programming from the ground up](http://savannah.c3sl.ufpr.br/pgubook/ProgrammingGroundUp-1-0-booksize.pdf) book. I'm liberally jumping over parts that I don't feel are conducive to my grasp of x86 assembly and expanding on those that I need to understand more. 

This is loosely based on chapters and each portion is desgined to go along with the book. I've included the book PDF for anyone who wants to follow along with it too. 

## Development

I added a Dockerfile to run the compiling/linking on an alpine linux assembler since I'm running this on a mac (which doesn't have the same assembler syntax).

Build with: 

```shell
$ docker build -t intro_assembly . 
```

Run with: 

```shell
$ docker run -it -v $(pwd):/workspace intro_assembly
```

