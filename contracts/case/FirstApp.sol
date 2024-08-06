// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Counter {
    uint256 private count;

    function increment() public {
        count += 1;
    }

    function decrement() public {
        count -= 1;
    }

    function getCount() public view returns (uint256) {
        return count;
    }
}