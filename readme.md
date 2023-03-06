# Codebreaker Compilation Server
Codebreaker Compilation Server

- Docker Container application built to run serverlessly on AWS Lambda for static compilation of C++ executables
	+ Compiles code executables as part of grading State Machine
	+ Compiles checker executables as part 
- Performs compilation on Ubuntu 20.04 stable release in line with [IOI 2022 regulations](https://ioi2022.id/contest-environment/))
- Containers are compiuled using AWS Code Build and exported to Elastic Container Registry (ECR)

### Repostiory Directory
- `app.py`: Main application file for Lambda function
- `awstools.py`: AWS tools file that manages S3 and dynamo interactions
- `compilesub.py`: Main logic that compiles C++ codes
- `compilechecker.py`: Main logic that compiles C++ checkers (admin side)

### Checker Documentation

##### without `testlib.h`

If you are not using `testlib.h`, checker is called with $3$ arguments in this order:

- input file (`argv[1]`)
- participant output file (`argv[2]`)
- jury output file (`argv[3]`)

The checker should output a real number between $0$ and $1$. The score will be multiplied by the subtask score.

##### with `testlib.h`

If you are using `testlib.h`, the following is behaviour of the modified `testlib.h` (modification is in `InStream::quit` function starting at line 2596)

- `_ok`: prints 1
- `_wa`: prints 0
- `_pe`: prints 0
- `_fail`: prints nothing (checker fail)
- `_dirt`: prints 0
- `_points`: prints custom error message that you specified. Example use is `quitf(_points,"%.2f\n",0.69420);` to give $69.42\%$ of the subtask score
- `__unexpected_eof`: prints 0
