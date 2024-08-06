// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Immutable {
    // coding convention is to use uppercase for constants
    uint256 public immutable MY_NUM;
    address public immutable MY_ADDRESS;

    constructor(uint256 num, address addr) {
        MY_NUM = num;
        MY_ADDRESS = addr;
    }
}