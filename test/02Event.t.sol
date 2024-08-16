//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import {EventDemo} from "../src/02Event.sol";
import "forge-std/console.sol";

contract EventTest is Test {
    EventDemo eventDemo;

    function setUp() public {
        eventDemo = new EventDemo();
    }

    function testEvent01() public {
        eventDemo.emitEventAssembly(bytes32("2222"));
    }
}
