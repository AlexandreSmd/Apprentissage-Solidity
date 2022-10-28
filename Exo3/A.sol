// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import '/B.sol';

contract A {

    address addressB;

    function setAddressB(address _address) external {
        addressB = _address;
    }

    function appelGetNombre() external view returns(uint) {
        interfaceB b = interfaceB(addressB);
        return b.getNombre();
    }

    function appelSetNombre(uint _nombre) external {
        interfaceB b = interfaceB(addressB);
        b.setNombre(_nombre);
    }
}
