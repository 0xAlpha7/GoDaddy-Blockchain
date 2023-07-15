// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract goDaddy is ERC721 {
    uint256 public max_supply;
    uint256 public total_supply;
    address owner;
    string public name1 = "Domain";

    struct Domain {
        string name;
        uint256 cost;
        bool isOwner;
    }
    mapping (uint256 => Domain) public domains;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {
        owner = msg.sender;
    }

    function list(string memory _name, uint256 _cost) public {
        require(_cost > 0, "const will not be 0");
        max_supply++;
        domains[max_supply] = Domain(_name, _cost, false);
        
    }
}