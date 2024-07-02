// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract OneToOneSwap {
    IERC20 public swapToken;
    constructor(address _swapToken) {
        swapToken = IERC20(_swapToken);
    }

    function swapToToken() public payable {
        swapToken.transfer(msg.sender, msg.value);
    }

    function swapToNative(uint256 amount) public {
        swapToken.transferFrom(msg.sender, address(this), amount);
        payable(msg.sender).transfer(amount);
    }
}
