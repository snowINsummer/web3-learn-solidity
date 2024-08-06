// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// import "hardhat/console.sol";

contract Bytes {
    bytes private data = "Hello, World!";

    // pure 用于表示函数是纯函数
    function getData() public view returns (bytes1) {
        bytes1 x = data[0];
        return x;
    }

    /*
        view 用于表示函数是视图函数
        memory 用于表示数据存储在内存中
        when you return complex data types like strings, arrays, or structs, 
        you need to specify where the data is located (memory or calldata), not storage.
    */
    function getString() public view returns (string memory) {
        // 先获取 bytes1
        bytes1 x = data[0];
        // 再将 bytes1 转换为 bytes
        bytes memory b = new bytes(1);
        b[0] = x;
        // 最后将 bytes 转换为 string
        return string(b);
    }

    /* 
        ? 为什么这里使用 pure 修饰符 ?
        因为函数内部没有读取状态变量, 也没有修改状态变量, 也没有调用其他函数, 也没有发送 ether
        ? pure 和 view 有什么区别 ?
        pure 表示函数内部没有读取状态变量, 也没有修改状态变量, 也没有调用其他函数, 也没有发送 ether
        view 表示函数内部没有修改状态变量, 也没有发送 ether
        ? 除了pure和view, 还有什么修饰符 ?
        payable 表示函数可以接收 ether
        ? 为什么这里使用 memory 修饰符 ?
        因为返回的字符串是动态的, 需要存储在内存中
    */
    function c() public pure returns (string memory) {
        bytes memory bstr = new bytes(10);
        // console.log(bstr);
        string memory message = string(bstr); // 使用string()函数转换
        return message;
    }
}