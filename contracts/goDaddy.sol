// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract goDaddy is ERC721 {
    uint256 public max_supply;
    uint256 public total_supply;
    address owner;

    struct Domain {
        string name;
        uint256 cost;
        bool isOwner;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    constructor(string memory _name, string memory _symbol) ERC721(_name, _supply) {
        owner = msg.sender;
    }
}