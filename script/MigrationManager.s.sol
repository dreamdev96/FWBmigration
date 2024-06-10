    // SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Script.sol";

import { MigrationManager } from "../src/MigrationManager.sol";

contract Deploy is Script {
    function setUp() public {}

    function run() public returns (address migration_manager) {
        uint256 deployerPrivateKey = vm.envUint("DEV_PRIVATE_KEY");
        address _fwbToken = vm.envAddress("FWB_TOKEN");
        vm.startBroadcast(deployerPrivateKey); 
        migration_manager = deploy(_fwbToken);
        vm.stopBroadcast();
        return (migration_manager);
    }

    function deploy(address token) private returns (address) {
        /// Deploy MarketPlace
        return address(new MigrationManager(token));
    }
}
