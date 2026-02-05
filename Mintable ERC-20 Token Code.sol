// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title MintableToken
 * @dev Standard ERC20 token with a minting function restricted to the owner.
 */
contract MintableToken is ERC20, Ownable {

    /**
     * @dev Constructor that gives msg.sender all of existing tokens.
     * @param name Name of the token
     * @param symbol Symbol of the token
     * @param initialOwner The address that will be the owner and can mint tokens
     */
    constructor(string memory name, string memory symbol, address initialOwner) 
        ERC20(name, symbol) 
        Ownable(initialOwner) 
    {}

    /**
     * @dev Function to mint tokens
     * @param to The address that will receive the minted tokens.
     * @param amount The amount of tokens to mint.
     * @return A boolean that indicates if the operation was successful.
     */
    function mint(address to, uint256 amount) public onlyOwner returns (bool) {
        _mint(to, amount);
        return true;
    }
}


