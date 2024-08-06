// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/*
- storage variable is a state variable (store on blockchain)
- memory variable is in memory and it exists while a function is being called
- calldata special data location that contains function arguments
*/

contract DataLocations {
    uint256 public arr;
    mapping(uint256 => address) public map;

    struct MyStruct{
        uint256 myUint;
    }
    mapping(uint256 => MyStruct) public myStructs;

    function f() public {

        MyStruct storage myStruct = myStructs[1];

        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(uint256[] memory _arr,
        mapping(uint256 => address) storage _map,
        MyStruct storage _myStruct) internal {

    }

    function g(uint256[] memory _arr) public returns (uint256[] memory) {
        uint256[] memory arr = _arr;
        return arr;
    }

    function h(uint256[] calldata _arr) external {
        arr = _arr[0];
    }

}