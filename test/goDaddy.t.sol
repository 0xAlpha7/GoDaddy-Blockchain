// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {goDaddy} from "../src/goDaddy.sol";

contract CounterTest is Test {
    goDaddy godaddy;
    string public name = "test";
    string public symbol = "T";
     

    function setUp() public {
        godaddy = new goDaddy(name, symbol);
    }
    function testName() public {
        string memory displayName = godaddy.name1();
        assertEq(displayName, "Domain");
        
    }
}
