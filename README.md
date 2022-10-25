# 5 stage pipeline implementation of RISC-V 32I Processor.

In this repository I have implemented 5 stage Pipelined processor which is actually the conversion of my previous single cycle implementation of processor into pipeline. Link to Previous single cycle implementation is given as: https://github.com/EmJunaid/RiscV-Single-Cycle-Processor.git.

In case of pipelined implementation what we do is that we divide our instruction into multiple stages and in case of 5 stage pipelined implementation we will offcourse divide the instruction into 5 different stages. Five different stages are given as:

    Instruction Fetch
    Instruction Decode
    Instruction Execution
    Memory Read/Write
    Write Back

This pipelined implementation of processor supports six basic instructions:

    R-Type
    I-Type
    S-Type
    B-Type
    J-Type
    U-Type

Just to mention here that in case of pipelined Implementation we face a problem know as hazards. And in this implementation I have also taken care of that and hazard unit is implemented to handle all types of hazards (Data and Control Hazards).

## Datapath

The Datapath that has been followed is shown below 

![Pipeline](https://user-images.githubusercontent.com/104595329/197798101-64ee25a9-08f2-42db-9231-d0c28b22d6eb.png)
