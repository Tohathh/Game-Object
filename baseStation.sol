pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import "interfaceGameObject.sol";
import "gameObject.sol";

contract baseStation is gameObject {
    
    uint public strengthDefBase;
    address[] public units;

     // функция добавления юнита
    function creatUnit (uint unit) external { 
        tvm.accept();
        callerAddress = msg.sender;
        units.push(callerAddress);
    }
    // функция удаления первого элемента массива
    function deleteUnit (uint index) external { 
        tvm.accept();
        for(uint i = 0; i < units.length; i++){ // счетчик массива
            if (index == 1) { // если введенное число равно 1
                delete units[0]; // удаляем первый элемент массива
            }
        }
    }
    // метод уничтожения, требует проверки
    function killedBase(uint strengthDefMin, address dest, uint128 value, bool bounce) private {
        tvm.accept();
        if(strengthDefMin == 0){
            // метод transfer, позволяющий осуществлять передачу, некоторые параметры определены сразу
            callerAddress.transfer(value, bounce, 160);// флаг 128+31=160 - отправить все деньги и уничтожить адрес
        }
        
    }
}