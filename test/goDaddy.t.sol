// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {goDaddy} from "../src/goDaddy.sol";
import {Script} from "forge-std/Script.sol";
import {Test, console} from "forge-std/Test.sol";

contract CounterTest is Test {
    goDaddy godaddy;
    string public name = "goDaddy";
    string public symbol = "GG";
    string domainName = "www.gogogle.com";
    uint256 constant COST = 0.001 ether;
    address public PLAYER = makeAddr("player");
    address public PLAYER2 = makeAddr("player2");

    uint256 public constant STARTING_BALANCE = 10 ether;
     

    function setUp() public {
        vm.prank(PLAYER);
        godaddy = new goDaddy(name, symbol);
        godaddy.list(domainName, COST);  //return id = 1
        vm.deal(PLAYER, STARTING_BALANCE);
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
        godaddy.mint{value: COST}(ID);
        godaddy.getDomain(ID);
        assertEq(godaddy.getDomain(ID).isOwned, true);
    }

    function testOwnerCanWithdraw() public {
        vm.prank(PLAYER);
        uint256 ID = 1;
        godaddy.mint{value: COST}(ID);
        godaddy.withdraw();
        assert(godaddy.getBalance() == 0);
    }
    function testWithdrawByNotOwner() public {
        vm.prank(PLAYER);
        uint256 id = 1;
        godaddy.mint{value: COST}(id);
        // Try to withdraw the balance as a non-owner.
        vm.prank(PLAYER2);
        vm.expectRevert();
        godaddy.withdraw();
        // Assert that the balance was not withdrawn.
        assert(godaddy.getBalance() > 0);   
    }

    function testWithdrawwithNoContractBalance() public {
        vm.expectRevert();
        godaddy.withdraw();
    }
}
