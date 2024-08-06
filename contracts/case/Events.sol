// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Events {
    // Event declaration
    // Up to 3 parameters can be indexed.
    // Indexed parameters helps you filter the logs by the indexed parameter
    event Log(address indexed sender,string message);
    /*
        In log, topic is the hash of the signature of the event.
        from is the address of the contract that emitted the event.
    */
    event AnotherLog();

    function log() public {
        emit Log(msg.sender, "Hello World!");
        emit Log(msg.sender, "Hello EVM!");
        emit AnotherLog();
    }
}