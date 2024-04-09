// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Importar la biblioteca SafeMath para operaciones aritméticas seguras
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Staking {
    using SafeMath for uint256;

    // Estructura para almacenar la información de los stakers
    struct Staker {
        uint256 balance; // Saldo de staking del usuario
        uint256 timestamp; // Última vez que se actualizó el saldo
    }

    // Mapeo para asociar direcciones de usuarios con sus datos de staking
    mapping(address => Staker) public stakers;

    // Evento para registrar los eventos de staking y desestaking
    event Staked(address indexed staker, uint256 amount);
    event Unstaked(address indexed staker, uint256 amount);

    // Función para que un usuario realice un staking
    function stake(uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero");
        
        // Actualizar el saldo del staker
        Staker storage sender = stakers[msg.sender];
        sender.balance = sender.balance.add(amount);
        sender.timestamp = block.timestamp;

        // Emitir evento de staking
        emit Staked(msg.sender, amount);
    }

    // Función para que un usuario realice un desestaking
    function unstake(uint256 amount) external {
        require(amount > 0, "Amount must be greater than zero");

        // Verificar que el staker tenga suficientes fondos
        Staker storage sender = stakers[msg.sender];
        require(sender.balance >= amount, "Insufficient balance");

        // Calcular los fondos a desestakear
        sender.balance = sender.balance.sub(amount);

        // Emitir evento de desestaking
        emit Unstaked(msg.sender, amount);
    }

    // Función para consultar el saldo de staking de un usuario
    function getStakingBalance(address staker) external view returns (uint256) {
        return stakers[staker].balance;
    }
}
