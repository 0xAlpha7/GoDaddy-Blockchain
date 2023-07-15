// // SPDX-License-Identifier: MIT

// pragma solidity ^0.8.18;
// import {Script} from "forge-std/Script.sol";


// contract HelperConfig is Script{
   
//     NetworkConfig public activeNetworkConfig;

//     constructor() {
//         if(block.chainid == 11155111){
//             activeNetworkConfig = getSepoliaEthConfig();
//         }
//         else if(block.chainid == 1) {
//             activeNetworkConfig = getMainnetEthConfig();
           
//         }
//         else{
//             activeNetworkConfig = getOrCreateAnvilEthConfig();
//         }
//     }
//     struct NetworkConfig {
//         address goDaaddyAddress;
//     }

//     function getSepoliaEthConfig() public pure returns(NetworkConfig memory) {
//         NetworkConfig memory sepoliaConfig = NetworkConfig();
//         return sepoliaConfig; 
//     }

//     function getMainnetEthConfig() public pure returns(NetworkConfig memory) {
//         NetworkConfig memory ethConfig = NetworkConfig();
//         return ethConfig; 
//     }
//     function getOrCreateAnvilEthConfig() public  returns(NetworkConfig memory) {
//         if(activeNetworkConfig.priceFeed != address(0)){
//             return activeNetworkConfig;
//         }

//         //deploy the mock
//         //return the mock address

//         // vm.startBroadcast();
//         // // MockV3Aggregator mockPriceFeed = new MockV3Aggregator(DECIMALS, INITTIAL_PRICE );
//         // vm.stopBroadcast();
//         // // NetworkConfig memory anvilConfig = NetworkConfig({priceFeed: address(mockPriceFeed)});
//         // return anvilConfig;
//     }
// }