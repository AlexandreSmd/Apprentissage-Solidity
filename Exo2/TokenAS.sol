// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract TokenAs is ERC20 {
    address public admin;

    constructor() ERC20("TokenAs", "TAS") {
        _mint(msg.sender, 10000 * 10**18);
        admin = msg.sender;
    }

    function mint(address to, uint256 amount) external {
        require(msg.sender == admin, "Only Admin");
        _mint(to, amount);
    }

    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
