// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {goDaddy} from "../src/goDaddy.sol";
import {Script, console} from "forge-std/Script.sol";

contract CounterTest is Test {
    goDaddy godaddy;
    string public name = "goDaddy";
    string public symbol = "GG";
    uint256 constant COST = 0.001 ether;
     

    function setUp() public {
        godaddy = new goDaddy(name, symbol);
        godaddy.list(name, COST);
    }
    function testNameAndSymbol() public {
        string memory displayName = godaddy.name();
        string memory displaySymbol = godaddy.symbol();
        assertEq(displayName, name);
        assertEq(displaySymbol, symbol);
    }

}
