// SPDX-License-Identifier: MIT

// Declaración del contrato inteligente
contract BasicContract {
    // Declaración de una variable de estado para almacenar un número entero
    uint256 public myNumber;

    // Constructor del contrato
    constructor() {
        // Inicialización de la variable de estado con un valor predeterminado
        myNumber = 0;
    }

    // Función para establecer el valor de la variable
    function setNumber(uint256 _newNumber) public {
        // Actualización de la variable de estado con el nuevo valor
        myNumber = _newNumber;
    }

    // Función para recuperar el valor actual de la variable
    function getNumber() public view returns (uint256) {
        // Retorno del valor actual de la variable de estado
        return myNumber;
    }
}
