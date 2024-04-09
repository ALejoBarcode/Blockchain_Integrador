// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FabricaChips {
    address public owner;
    mapping(address => uint) public balances;
    mapping(address => uint) public inventarioDispositivos;
    uint public precioDispositivo = 100; // Precio por dispositivo en wei

    event DispositivoComprado(address comprador, uint cantidad);

    constructor() {
        owner = msg.sender;
    }

    function comprarDispositivo(uint _cantidad) external payable {
        require(msg.value >= _cantidad * precioDispositivo, "Fondos insuficientes");

        // Vulnerabilidad: Desbordamiento de entero
        uint precioTotal = _cantidad * precioDispositivo; // Vulnerabilidad aquí
        require(precioTotal / _cantidad == precioDispositivo, "Desbordamiento de entero en calculo del precio total");

        inventarioDispositivos[msg.sender] += _cantidad;
        balances[owner] += msg.value;
        emit DispositivoComprado(msg.sender, _cantidad);
    }



    function retirarFondos() external {
        require(msg.sender == owner, "Solo el propietario puede retirar fondos");
        payable(owner).transfer(address(this).balance);
    }
}


/*
//Aqui esta la correcion de la vulnerabilidad
function comprarDispositivo(uint _cantidad) external payable {
    require(msg.value >= _cantidad * precioDispositivo, "Fondos insuficientes");

    // Corrección de la vulnerabilidad: Dividir primero y luego multiplicar
    require(msg.value / precioDispositivo >= _cantidad, "Cantidad inválida proporcionada");

    inventarioDispositivos[msg.sender] += _cantidad;
    balances[owner] += msg.value;
    emit DispositivoComprado(msg.sender, _cantidad);
}*/
