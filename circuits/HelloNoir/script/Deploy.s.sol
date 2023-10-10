// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../circuits/contract/plonk_vk.sol";

contract DeployScript is Script {
    function run() public {
        vm.broadcast();
        UltraVerifier v = new UltraVerifier();
    }
}
