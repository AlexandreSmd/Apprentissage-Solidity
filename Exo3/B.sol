// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.7;

interface interfaceB {

    function getNombre() external view returns(uint);
    function setNombre(uint _nombre) external;

}

contract B {

    uint nombre;

    function getNombre() external view returns(uint) {
        return nombre;
    }

    function setNombre(uint _nombre) external {
        nombre = _nombre;
    } 
}