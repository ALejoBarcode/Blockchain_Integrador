// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleToken {
    uint256 public balance;

    constructor() {
        balance = 1000; // Asignamos 1000 tokens al saldo inicial
    }

    function transfer(address to) external {
        require(to != address(0), "Dirección invalida");

        // Transferir todo el saldo a la dirección especificada
        uint256 value = balance;
        balance = 0;

        // Emitir evento de transferencia
        emit Transfer(msg.sender, to, value);
    }

    event Transfer(address indexed from, address indexed to, uint256 value);
}
