// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Variables {
    // State variables are stored on the blockchain.
    string public text = "Hello, World!";
    uint256 public num = 123;

    function doSomething() public view{
        // Local variables are not saved to the blockchain.
        uint256 i = 456;
        // Here are some global variables
        uint256 timestamp = block.timestamp; // Current block timestamp
        address sender = msg.sender; // address of the caller
    }

    function set(uint256 _num) public {
        num = _num;
    }

    function get() public view returns (uint256) {
        return num;
    }
}