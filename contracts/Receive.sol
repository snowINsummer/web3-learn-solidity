// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Callee {
    uint a;
    receive() external payable {
        a += 1;
    }

}

contract Caller {

    address payable callee;

    constructor() {
        callee = payable(address(new Callee()));
        // callee = _callee;
    }

    function tryTransfer() external {
        callee.transfer(1);
    }
}