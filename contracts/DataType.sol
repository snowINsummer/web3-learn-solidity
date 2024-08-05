// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// 浮点数
// contract Fixed {

//     function calculate() public pure returns (ufixed) {
//         return 1.32;
//     }
// }

// contract Ufixed {
//     ufixed private ufixedNumber = 1.23;

//     function calculate() public view returns (ufixed result) {
//         result = ufixedNumber * 2 * 0.3;
//         return result;
//     }
// }

contract Bytes {
    bytes private data = "Hello, World!";

    // pure 用于表示函数是纯函数
    function getData() public pure returns (bytes1) {
        bytes3 s = 'abc';
        return s[0];
    }
}

contract Enum {
    enum State {
        Active,
        Inactive
    }

    State private state;

    function setState(State _state) public {
        state = _state;
    }

    function getState() public view returns (State) {
        return state;
    }
}

contract Udvt {
    type Weight is uint128;
    type Price  is uint128;
    Weight w = Weight.wrap(10);
    Weight w1 = Weight.wrap(10);
    Price  p = Price.wrap(5);
    
    function add() public view returns (Weight wp) {
        // Weight wp = w+p;
        // Price  pw = p+w;
        //  wp = Weight.wrap(10 + Weight.unwrap(w));
    }
}

contract Array {
    uint[] private numbers = new uint[](10);
    
    constructor() {
        numbers = [1, 2, 3, 4, 5];
    }

    function add(uint number) public {
        numbers.push(number);
    }

    function get(uint index) public view returns (uint) {
        return numbers[index];
    }

    function length() public view returns (uint) {
        return numbers.length;
    }
    
    function getArray() public view returns (uint[] memory) {
        return numbers;
    }

    function extracFourBytes(string calldata payload) public view {
        string memory leading4Bytes = string(payload[:4]);
        // console.log("leading 4 bytes: %s", leading4Bytes);
    }

    function xx() public pure {
        uint[3][2][2] memory arr = [[[uint(1), 2, 3], [uint(4), 5, 6]],[[uint(1), 2, 3], [uint(4), 5, 6]]]; 
    }
}
