// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/repbitArray.sol";

contract repbitArrayTest is Test {
    repbitArray public bitArrayContract;

    function setUp() public {
        bitArrayContract = new repbitArray();
    }

// Test Flagging and Unflagging
// Extend to fuzzing
    function testFlag() public {
        // pos 0 list 0 
        bitArrayContract.flagOrder(2);
        
        // pos 1 list  1
        bitArrayContract.flagOrder(2);
        
        // pos 2 list 3
        bitArrayContract.flagOrder(2);
        
        // pos 3 list 7
        bitArrayContract.flagOrder(2);

        // pos 4 list 15
        bitArrayContract.flagOrder(2);

        bitArrayContract.unflagOrder(2,0);
        // pos 5 list 14


        assertEq(bitArrayContract.replist(2), 14);

        assertEq(bitArrayContract.position(2), 5);
    }


}
