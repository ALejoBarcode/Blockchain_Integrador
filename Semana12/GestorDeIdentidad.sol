// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GestorIdentidad {
    struct Identidad {
        string nombre;
        uint edad;
        string ciudad;
        bool verificada;
    }

    mapping(address => Identidad) public identidades;
    address[] public listaIdentidadesVerificadas;

    event IdentidadRegistrada(address indexed cuenta, string nombre, uint edad, string ciudad);
    event IdentidadVerificada(address indexed cuenta);

    function registrarIdentidad(string memory _nombre, uint _edad, string memory _ciudad) public {
        require(bytes(_nombre).length > 0, "Nombre no puede estar vacio");
        require(_edad > 0, "Edad debe ser mayor que cero");
        require(bytes(_ciudad).length > 0, "Ciudad no puede estar vacia");

        identidades[msg.sender] = Identidad(_nombre, _edad, _ciudad, false);
        emit IdentidadRegistrada(msg.sender, _nombre, _edad, _ciudad);
    }

    function verificarIdentidad(address _cuenta) public {
        require(msg.sender == _cuenta, "Solo se puede verificar la propia identidad");

        identidades[_cuenta].verificada = true;
        listaIdentidadesVerificadas.push(_cuenta);
        emit IdentidadVerificada(_cuenta);
    }

    function obtenerListaIdentidadesVerificadas() public view returns (address[] memory) {
        return listaIdentidadesVerificadas;
    }
}
