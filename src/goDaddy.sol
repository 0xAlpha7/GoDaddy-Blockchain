// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract goDaddy is ERC721 {
    uint256 public max_supply;
    uint256 public total_supply;
    address public owner;
   
    struct Domain {
        string name;
        uint256 cost;
        bool isOwned;
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
    function mint(uint256 _id) public payable {
        require(_id != 0, "Id > 0");
        require(_id <= max_supply);
        require(!domains[_id].isOwned,"Domain already owned!");
        require(msg.value >= domains[_id].cost);
        domains[_id].isOwned = true;
        total_supply += 1 ;
        _safeMint(msg.sender, _id);
    }

}