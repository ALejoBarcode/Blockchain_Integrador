// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Declaracion del contrato
contract MyContract {
    // Declaración de una variable de estado de tipo entero
    uint256 public myNumber;

    // Declaracion de un evento
    event NumberUpdated(uint256 newValue);

    // Modificador personalizado para verificar si el valor es mayor que 10
    modifier greaterThanTen(uint256 _value) {
        require(_value > 10, "Value must be greater than 10");
        _;
    }

    // Constructor del contrato
    constructor(uint256 _initialNumber) {
        // Inicialización de la variable de estado
        myNumber = _initialNumber;
    }

    // Funcion publica para actualizar el numero
    function setNumber(uint256 _newNumber) public greaterThanTen(_newNumber) {
        // Actualización de la variable de estado
        myNumber = _newNumber;
        
        // Emision del evento para notificar la actualizacion
        emit NumberUpdated(_newNumber);
    }

    // Funcion publica para obtener el numero actual
    function getNumber() public view returns (uint256) {
        // Retorno del valor de la variable de estado
        return myNumber;
    }

    // Funcion publica estatica para sumar dos numeros
    function addNumbers(uint256 _a, uint256 _b) public pure returns (uint256) {
        // Retorno de la suma de los dos numeros
        return _a + _b;
    }
}
