//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Demo17 {
    function test01() external pure returns (uint256) {
        revert("eight");
    }
}
