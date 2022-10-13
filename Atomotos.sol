pragma solidity >=0.8.4 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; // Adding ERC20.. 

Contact atomotos is ERC20 {
    uint constant _initial_supply = 100 * (10**18);
    constructor() ERC20("atomotos", "ATS") public {
        _mint(msg.sender, _initial_supply);
    }
}