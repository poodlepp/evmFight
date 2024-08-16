//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

error insu();
error insu2(string ss);

contract Demo09 {
    string tmp = "23232323233";
    // function test01() external pure returns (uint256) {
    //     // revert();  //107gas
    //     // revert("eight");  //230 gas

    //     // revert insu(); //167
    //     // revert insu2("eight"); //230gas
    // }
    function test01() external returns (uint256) {
        revert();
    }

    function test02() external returns (uint256) {
        revert(tmp);
    }

    function test03() external returns (uint256) {
        revert insu();
    }

    function test04() external returns (uint256) {
        revert insu2(tmp);
    }
}
