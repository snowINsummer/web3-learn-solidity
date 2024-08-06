// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract EtherUnits {
    uint256 public oneWei = 1 wei;
    // 1 wei is equal to 1
    bool public isOneWei = oneWei == 1;

    uint256 public oneGwei = 1 gwei;
    // 1 gwei is equal to 1e9 wei 10^9
    bool public isOneGwei = oneGwei == 1e9;

    uint256 public oneEther = 1 ether;
    // 1 ether is equal to 1e18 wei 10^18
    bool public isOneEther = oneEther == 1e18;
}