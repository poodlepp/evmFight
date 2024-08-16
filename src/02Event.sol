//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

event ExampleEventAsm(bytes32 tokenId);

// event Event_custom();

// event Event_custom2(address indexed aa, bytes32 bb);

// event CollateralDeposited();

event ExampleEventAsm2(bytes32 indexed tokenId, bytes32 aa, bytes32 bb);

contract EventDemo {
    function emitEventAssembly(bytes32 tokenId) public {
        bytes32 topicHash = ExampleEventAsm.selector;
        bytes32 aa = bytes32("aaa");
        bytes32 bb = bytes32("bbb");
        // assembly {
        //     let freeMemoryPointer := mload(0x40)
        //     mstore(freeMemoryPointer, aa)
        //     mstore(add(freeMemoryPointer, 32), bb)

        //     // emit the `ExampleEventAsm` event with 2 topics
        //     log2(
        //         freeMemoryPointer, // `p` = starting offset in memory
        //         64, // `s` = number of bytes in memory from `p` to include in the event data
        //         topicHash, // topic for filtering the event itself
        //         tokenId // 1st indexed parameter
        //     )
        // }
        // emit Event_custom();
        // emit Event_custom2(address(1234), bytes32("asdasfasfs"));
        // emit CollateralDeposited();
        emit ExampleEventAsm2(tokenId, aa, bb);

        // 通过debug发现两者在调用log2 opcode时，参数是一致的；
        //虽然  forge test  -vvvvv  展示样式并不同
    }

    function callDemo() public {
        bytes memory data = bytes("23232323");
        (bool success, bytes memory returnedData) = payable(address(1234)).call{value: 2323}(data);
    }
}
