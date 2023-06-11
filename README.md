# Summary

This contract defines a bit array of size 256 represented as a uint Each bit in the uint represents a flag for a position.

## Intuition 

1. The state of the bit array of value is given replist and the current position to flag is 0. 
    - replist[2] = 0
    - position[2] = 0
    - Bit array = [0,0,0,...,0]


2. Call flagOrder(2).
    - replist[2] = 1
    - position[2] = 1
    - Bit array = [1,0,0,...,0]

3. Call flagOrder(2)
    - replist[2] = 3
    - Position[2] = 2
    - Bit array = [1,1,0,...,0]

4. Call unflagOrder(2,0)
    - replist[2] = 2
    - position[2] = 2
    - Bit array = [0,1,0,...,0]

## Improvement/Todo
The bit array needs to simulate allocating and deallocating memory
dynamically if we reach the end of the array. Whether this is done using an array or through reordering of the bit array.