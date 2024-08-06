// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract IterableMapping {
    mapping(address => uint) data;
    address[] keys;
    mapping(address => bool) isExist;

    function add(address key, uint value) public {
        if (!isExist[key]) {
            keys.push(key);
            isExist[key] = true;
        }
        data[key] = value;
    }

    function remove(address key) public {
        if (!isExist[key]) {
            return;
        }
        delete data[key];
        isExist[key] = false;
        for (uint i = 0; i < keys.length; i++) {
            if (keys[i] == key) {
                keys[i] = keys[keys.length - 1];
                keys.pop();
                break;
            }
        }
    }

    function get(address key) public view returns (uint) {
        return data[key];
    }

    function getData() public view returns (address[] memory, uint[] memory) {
        uint[] memory _values = new uint[](keys.length);
        for (uint i = 0; i < keys.length; i++) {
            _values[i] = data[keys[i]];
        }
        return (keys, _values);
    } 
}