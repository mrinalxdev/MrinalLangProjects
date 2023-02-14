// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzepplelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol';
import '@openzepplelin/contracts/utils/math/SafeMath.sol';

contract MintExample is ERC721Enumerable, Ownable{
    mapping (address => uint256) public balances;

    constructor(
        string memory name,
        string memory symbol
    )ERC721(name, symbol) {}

    function mint(uint256 numberOfMints) public payable {
        uint256 supply = totalSupply();

        for (uint256 i; i < numberOfMints; i++){
            _safeMint(msg.sender, supply + i);
            balances[msg.sender]++;
        }
    }
}