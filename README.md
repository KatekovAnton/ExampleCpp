# ExampleCpp

Sample repo to introduce basic concepts of `c++` and `docker`.

## Prerequisites

Install:

1. Git
1. CMake
1. Visual Studio Code
1. Visual Studio 2022 (Community edition is ok)
1. Docker

## Windows

To configure the project, run `Make_win.bat` from Visual Studio command line.

It will create a folder `build` and will prepare a solution `ExampleCpp.sln` that you
can open with Visual Studio.

## Docker 

Repo has some primitive sample for docker. Try to investigate docker-related
targets in Makefile.

```
docker run -v $(pwd):$(pwd) --rm -it --workdir $(pwd) example_cpp /bin/bash
```
