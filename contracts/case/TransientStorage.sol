pragma solidity ^0.8.19;

// Make sure EVM version and VM set to Cancun

// Storage - data is stored on the blockchain
// Memory - data is cleared out after a function call
// Transient storage - data is cleared out after a transaction

interface ITest {
    function val() external view returns (uint);
    function test() external;
}


contract Callback {
    uint256 public val;

    fallback() external {
        val = ITest(msg.sender).val();
    }

    function test(address target) external {
        ITest(target).test();
    }
}

contract TestStorage {
    uint256 public val;

    function test() public {
        val = 123;
        bytes memory b = "";
        msg.sender.call(b);
    }
}
contract C {
    uint b;
    function f(uint x) public view returns (uint r) {
        assembly {
            // We ignore the storage slot offset, we know it is zero
            // in this special case.
            // b.slot is the storage slot of b. it value is 0x00 
            // sload(b.slot) is the value of b
            // mul is the multiplication operation
            r := mul(x, sload(b.slot))
        }
    }

    function set(uint x) public {
        assembly {
            sstore(b.slot, x)
        }
    }
    function val() public view returns (uint v) {
        assembly {
            v := sload(b.slot)
        }
    }
}
contract ReentrancyGuard {
    bool private locked;

    modifier lock() {
        require(!locked);
        locked = true;
        _;
        locked = false;
    }

    // 35313 gas
    function test() public lock {
        // Ignore call error
        bytes memory b = "";
        msg.sender.call(b);
    }
}

contract ReentrancyGuardTransient {
    uint b;
    modifier lock() {
        assembly {
            if sload(b.slot) { 
                revert(0, 0) 
            }
            sstore(b.slot, 1)
        }
        _;
        assembly {
            sstore(b.slot, 0)
        }
    }

    function set(uint x) public {
        assembly {
            sstore(b.slot, x)
        }
    }

    function val() public view returns (uint v) {
        assembly {
            v := sload(b.slot)
        }
    }

    // 21887 gas
    function test() external lock {
        // Ignore call error
        bytes memory b = "";
        msg.sender.call(b);
    }
}