// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

// Contrato del token ERC-20
contract ERC20Token {
    string public name;
    string public symbol;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(string memory _name, string memory _symbol, uint256 _totalSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply;
        balanceOf[msg.sender] = _totalSupply;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}

// Contrato del token ERC-721
contract ERC721Token {
    string public name;
    string public symbol;
    uint256 private tokenId = 0;

    mapping(uint256 => address) public ownerOf;
    mapping(uint256 => string) public tokenURI;

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
    }

    function mint(address _to, string memory _tokenURI) public returns (uint256) {
        uint256 newTokenId = tokenId++;
        ownerOf[newTokenId] = _to;
        tokenURI[newTokenId] = _tokenURI;
        emit Transfer(address(0), _to, newTokenId);
        return newTokenId;
    }
}
