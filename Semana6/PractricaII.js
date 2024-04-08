// Importamos las bibliotecas necesarias
const Web3 = require('web3');
const { ethers } = require('ethers');

// Configuramos la conexión a la red Ethereum con Web3.js
const web3 = new Web3('https://mainnet.infura.io/v3/your-infura-project-id');

// Configuramos la conexión a la red Ethereum con ethers.js
const provider = new ethers.providers.JsonRpcProvider('https://mainnet.infura.io/v3/your-infura-project-id');

// Dirección y ABI del contrato inteligente
const contractAddress = '0x1234567890123456789012345678901234567890';
const abi = [
    {
        "constant": true,
        "inputs": [],
        "name": "getValue",
        "outputs": [
            {
                "name": "",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    }
];

// Creamos una instancia del contrato inteligente con Web3.js
const contractWeb3 = new web3.eth.Contract(abi, contractAddress);

// Creamos una instancia del contrato inteligente con ethers.js
const contractEthers = new ethers.Contract(contractAddress, abi, provider);

// Interactuamos con el contrato utilizando Web3.js
contractWeb3.methods.getValue().call((error, result) => {
    if (error) {
        console.error('Error al obtener el valor del contrato con Web3.js:', error);
    } else {
        console.log('Valor devuelto por el contrato con Web3.js:', result);
    }
});

// Interactuamos con el contrato utilizando ethers.js
async function getValue() {
    try {
        const result = await contractEthers.getValue();
        console.log('Valor devuelto por el contrato con ethers.js:', result.toString());
    } catch (error) {
        console.error('Error al obtener el valor del contrato con ethers.js:', error);
    }
}

getValue();
