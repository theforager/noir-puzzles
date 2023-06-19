// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../circuits/contract/plonk_vk.sol";
contract Noir is Test {
    UltraVerifier public ultraverifier;
    bytes32[] public correct_input = new bytes32[](16);
    bytes32[] public wrong_input = new bytes32[](16);
    function setUp() public {
        ultraverifier = new UltraVerifier();
        correct_input[0] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000001);
        correct_input[1] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        correct_input[2] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        correct_input[3] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        correct_input[4] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        correct_input[5] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000002);
        correct_input[6] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        correct_input[7] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        correct_input[8] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000004);
        correct_input[9] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        correct_input[10] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        correct_input[11] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        correct_input[12] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        correct_input[13] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        correct_input[14] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        correct_input[15] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000001);


        wrong_input[0] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000003);
        wrong_input[1] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        wrong_input[2] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        wrong_input[3] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        wrong_input[4] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        wrong_input[5] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000004);
        wrong_input[6] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        wrong_input[7] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        wrong_input[8] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000002);
        wrong_input[9] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        wrong_input[10] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        wrong_input[11] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        wrong_input[12] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        wrong_input[13] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        wrong_input[14] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000000);
        wrong_input[15] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000002);
    }

    function test_correct_solution() public {
        string memory proof = vm.readLine("./circuits/proofs/p.proof");
        bytes memory proof_in_bytes = vm.parseBytes(proof);
        ultraverifier.verify(proof_in_bytes,correct_input);
    }

    function test_wrong_solution() public {
        vm.expectRevert();
        string memory proof = vm.readLine("./circuits/proofs/p.proof");
        bytes memory proof_in_bytes = vm.parseBytes(proof);
        ultraverifier.verify(proof_in_bytes,wrong_input);
    }

}