// // SPDX-License-Identifier: MIT

// pragma solidity ^0.8.18;
// import {Script} from "forge-std/Script.sol";
// import {goDaddy} from "../src/goDaddy.sol";
// // import {HelperConfig} from "./HelperConfig.s.sol";


// contract DeploygoDaddy is Script {
//     function run() external returns (FundMe) {
//         HelperConfig helperConfig =  new HelperConfig();
//         address ethUsdPriceFeed  = helperConfig.activeNetworkConfig();
//         vm.startBroadcast();
//         FundMe fundMe = new FundMe(ethUsdPriceFeed);
//         vm.stopBroadcast();   
//         return (fundMe);
//     }
    
// }