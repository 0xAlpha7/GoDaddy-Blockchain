// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {goDaddy} from "../src/goDaddy.sol";
import {Script, console} from "forge-std/Script.sol";

contract CounterTest is Test {
    goDaddy godaddy;
    string public name = "goDaddy";
    string public symbol = "GG";
    string domainName = "www.gogogle.com";
    uint256 constant COST = 0.001 ether;
    address public PLAYER = makeAddr("player");
     

    function setUp() public {
        godaddy = new goDaddy(name, symbol);
        godaddy.list(domainName, COST);
    }
    function testNameAndSymbol() public {
        string memory displayName = godaddy.name();
        string memory displaySymbol = godaddy.symbol();
        assertEq(displayName, name);
        assertEq(displaySymbol, symbol);
    }

    function testMaxSupply() public {
        uint256 max_supply = godaddy.max_supply();
        assertEq(max_supply, 1);
    }
    function testTotalSupply() public {
        uint256 max_supply = godaddy.total_supply();
        assertEq(max_supply, 0);
    }

    function testDomain() public {
        assertEq(godaddy.getDomain(1).cost, COST);
        assertEq(godaddy.getDomain(1).isOwned, false);
        assertEq(godaddy.getDomain(1).name, domainName);
    }

    function testMint() public {
        vm.prank(PLAYER);
        uint256 ID = 1;
        godaddy.list(domainName, COST);
        // godaddy.mint{value: COST}(ID);
        godaddy.getDomain(ID);
    }
   

}
