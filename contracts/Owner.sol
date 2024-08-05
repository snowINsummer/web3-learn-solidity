// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Owner {

    struct Test {
        uint256 a;
    }
    // 结构体 // Structure 
    struct Identity {
        address addr;
        string name;
        Test test;
    }
    // 枚举 // Enumeration 
    enum State {
        HasOwner,
        NoOwner
    }

    // 事件 // Event 
    // event 事件是一种特殊的函数，可以用来记录合约执行过程中发生的重要事件。可以认为事件就是 Solidity 的 log。你可以通过已连接的客户端来访问这些事件。
    // address 用于记录地址
    // indexed 用于过滤事件
    event OwnerSet(address indexed oldOwner, address indexed newOwner); 
    event OwnerRemoved(address indexed oldOwner);

    // 函数修饰器 // Function Decorator
    // 可以被用来修饰函数的行为。
    modifier isOwner() {
        // require 用于检查条件
        // msg.addr 用于获取调用者地址
        require(msg.sender == owner.addr, "Caller is not owner");
        // _; 用于执行函数
        _;
    }

    // 状态变量 // Status Variable
    // 会被永久保存在区块链上，并且可以在合约执行期间被读写。
    Identity private owner;
    State private state;

    // 函数是一组逻辑块，定义了合约可以执行的操作。它可以接受参数，并根据参数计算返回结果。函数可以被其他合约调用
    // 构造函数 // Constructor
    // 合约构造函数，在合约部署时自动执行。它将当前调用者设置为 owner，并设置合约的状态为 HasOwner
    constructor(string memory name) {
        owner.addr = msg.sender;
        owner.name = name;
        state = State.HasOwner;
        // emit 用于触发事件
        // address(0) 用于表示空地址
        emit OwnerSet(address(0), msg.sender); 
    }

    // 修改 owner
    // calldata 用于表示数据不可变
    // public isOwner 用于表示函数是公开的且需要验证
    function changeOwner(address addr, string calldata name) public isOwner {
        owner.addr = msg.sender;
        owner.name = name;
        emit OwnerSet(owner.addr, addr);
    }

    // 删除 owner
    // delete 用于删除数据
    function removeOnwer() public isOwner {
        emit OwnerRemoved(owner.addr);
        delete owner;
        state = State.NoOwner;
    }

    // 返回 owner 的地址和名称
    // external 用于表示函数是外部的
    // view 用于表示函数是只读的
    // memory 用于表示数据存储在内存中
    function getOwner() external view returns (address, string memory) {
        return (owner.addr, owner.name);
    }

    // 返回合约的状态
    function getState() external view returns (State) {
        return state;
    }

    /*
    函数主要的操作包括：
        在合约部署时，调用构造函数 constructor(string memory name) 设置 owner。
        调用函数 changeOwner(address addr, string calldata name) 修改 owner。
        调用函数 removeOwner() 删除 owner。
        所有重要的操作都需要使用函数修饰器 isOwner 进行保护，只有 owner 才能执行。
        这个合约还提供了一些辅助函数，如 getOwner 和 getState，用来查询 owner 的信息和合约的状态
        此外，这个合约还定义了两个事件：OwnerSet 和 OwnerRemoved，分别在 owner 被设置或删除时触发。这些事件可以被外部监听，从而做出相应的反应。
    小结
        状态变量: 储存在合约中的变量。在本例中，定义了私有状态变量 owner 和 state。
        函数: 合约中定义的可执行代码块。在本例中，有构造函数 constructor 和普通函数 changeOwner、removeOwner、getOwner 和 getState。
        函数修饰器: 在函数定义之前使用的一个声明，可以对函数的行为进行修饰。在本例中，使用了 isOwner 修饰器。
        事件: 合约中定义的日志记录，可以通过事件来跟踪合约的执行。在本例中，定义了事件 OwnerSet 和 OwnerRemoved。
        Error: 合约中定义的错误信息。
        结构体: 合约中定义的自定义数据类型。在本例中，定义了结构体 Identity。
        枚举: 合约中定义的自定义常量类型。在本例中，定义了枚举 State。
    */
}