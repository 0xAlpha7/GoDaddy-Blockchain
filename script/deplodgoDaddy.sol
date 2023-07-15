// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import {Script} from "forge-std/Script.sol";
import {goDaddy} from "../src/goDaddy.sol";
import {HelperConfig} from "./HelperConfig.s.sol";


contract DeploygoDaddy is Script {
    string constant NAME = "goDaddy";
    string constant SYMBOL = "GG";
    function run() external returns (goDaddy) {
        // HelperConfig helperConfig =  new HelperConfig();
        // string memory ethUsdPriceFeed  = helperConfig.activeNetworkConfig();
        vm.startBroadcast();
        goDaddy godaddy = new goDaddy(NAME, SYMBOL);
        vm.stopBroadcast();   
        return (godaddy);
    }
    
}