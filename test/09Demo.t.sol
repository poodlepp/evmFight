//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import {Demo09} from "../src/09Demo.sol";
import "forge-std/console.sol";

contract EventTest09 is Test {
    Demo09 demo;

    function setUp() public {
        demo = new Demo09();
    }

    function testEvent01() public {
        demo.test01();
    }

    function testEvent02() public {
        demo.test02();
    }

    function testEvent03() public {
        demo.test03();
    }

    function testEvent04() public {
        demo.test04();
    }
}
