// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract HelloWorld {
    string private data = "Hello, World!";

    function getData() public view returns (string memory) {
        return data;
    }

    function setData(string memory _data) public {
        data = _data;
    }
}
