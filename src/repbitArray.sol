// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


// This contract defines a bit array of size 256.
// Each bit represents a flag for a position.

// Intuition:
// replist[2] = 0
// position[2] = 0
//
// call flagOrder(2)
// replist[2] = 1   [1,0,0,...,0]
// position[2] = 1 
//
// call flagOrder(2)
// replist[2] = 3   [1,1,0,...,0]
// position[2] = 2
//
// call unflagOrder(2,0)
// replist[2] = 2   [0,1,0,...,0]
// position[2] = 2
//


// Improvements: The bit array needs to 
// simulate allocating and deallocating memory 
// dynamically. Whether this is done using an array
// or through reordering. 

contract repBitArray {


mapping(uint => uint) public replist; // Uint256 respresentation of the bit array for a given price
mapping(uint => uint) public position; // Current Position Counter of the bit array for a given price


function flagOrder(uint256 _price) public returns (uint256){
        uint256 _orderid = position[_price];
        position[_price] = _orderid + 1;
        // Take order ID and set the bit at that position to 1
        // Then XOR with the current bit array
        replist[_price] = replist[_price] ^ 1 << _orderid;

        return replist[_price]; 

}

function unflagOrder(uint256 _price ,uint256 _orderid) public returns (uint256){
        replist[_price] = replist[_price]  ^ 1 << _orderid;
        return replist[_price];
}


}
