// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import {Script} from "forge-std/Script.sol";
import {goDaddy} from "../src/goDaddy.sol";
import {HelperConfig} from "./HelperConfig.s.sol";


contract DeploygoDaddy is Script {
    function run() external returns (goDaddy) {
        // HelperConfig helperConfig =  new HelperConfig();
        // string memory ethUsdPriceFeed  = helperConfig.activeNetworkConfig();
        vm.startBroadcast();
        goDaddy godaddy = new goDaddy("goDaddy", "GG");
        vm.stopBroadcast();   
        return (godaddy);
    }
    
}