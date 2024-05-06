// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundFundMe is Script {
    uint256 SEND_VALUE = 0.01 ether;

    function fundFundMe(address mostRecentDeployment) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentDeployment)).fund{value: SEND_VALUE}();
        vm.stopBroadcast();
        console.log("Funded Fund me with %s", SEND_VALUE);
    }

    function run() external {
        address mostRecentDeployment = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        //vm.startBroadcast();
        fundFundMe(mostRecentDeployment);
        //vm.stopBroadcast();
    }
}

contract WithdrawFundMe is Script {
    uint256 SEND_VALUE = 0.01 ether;

    function withdrawFundMe(address mostRecentDeployment) public {
        vm.startBroadcast();
        FundMe(payable(mostRecentDeployment)).withdraw();
        vm.stopBroadcast();
        console.log("Funded Fund me with %s", SEND_VALUE);
    }

    function run() external {
        address mostRecentDeployment = DevOpsTools.get_most_recent_deployment(
            "FundMe",
            block.chainid
        );
        //vm.startBroadcast();
        withdrawFundMe(mostRecentDeployment);
        //vm.stopBroadcast();
    }
}
