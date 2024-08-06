// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Array {

    uint256[] public arrs;
    uint256[] public arrs2 = [1, 2, 3];
    // Fixed sized array, all elements initialize to 0
    uint256[10] public myFixedSizeArr;

    function get(uint256 i) public view returns (uint256) {
        return arrs[i];
    }

    // Solidity can return the entire array.
    // But this function should be avoided for
    // arrays that can grow indefinitely in length.
    function getArrs() public view returns (uint256[] memory) {
        return arrs;
    }

    function push(uint256 i) public {
        arrs.push(i);
    }

    function pop() public {
        // Remove the last element from array
        // This will decrease the array length by 1
        arrs.pop();
    }

    function getLength() public view returns (uint256) {
        return arrs.length;
    }

    function remove(uint256 i) public {
        // Remove the element at index i
        delete arrs[i];
    }

    function example() external pure {
        // Initialize a memory array
        uint256[] memory values = new uint256[](3);
        // Add elements to the array
        values[0] = 1;
    }
}

contract ArrayRemoveByShifting {
    uint256[] public arrs;

    // Deleting an element creates a gap in the array.
    // One trick to keep the array compact is to shift elements to the left.
    // Keep item order but may be slow for large arrays.
    function remove(uint256 index) public {
        // Shift elements to the left
        for (uint256 i = index; i < arrs.length - 1; i++) {
            arrs[i] = arrs[i + 1];
        }
        // Delete the last element
        arrs.pop();
    }

    function test() external {
        arrs = [1, 2, 3, 4, 5];
        remove(2);
        // arrs will be [1, 2, 4, 5]
        assert(arrs[0] == 1);
        assert(arrs[1] == 2);
        assert(arrs[2] == 4);
        assert(arrs[3] == 5);
        assert(arrs.length == 4);

        arrs = [1];
        remove(0);
        // arrs will be []
        assert(arrs.length == 0);
    }
}

contract ArrayReplaceFromEnd {
    uint256[] public arrs;

    // Deleting an element creates a gap in the array.
    // One trick to keep the array compact is to
    // move the last element into the place to delete.
    function remove(uint256 index) public {
        // Replace the element to be removed with the last element
        arrs[index] = arrs[arrs.length - 1];
        // Remove the last element
        arrs.pop();
    }
}