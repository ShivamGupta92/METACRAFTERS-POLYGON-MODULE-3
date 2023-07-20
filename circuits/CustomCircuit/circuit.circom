pragma circom 2.0.0;

/*This circuit template checks that c is the multiplication of a and b.*/  

template CustomCircuit () {  
    // signal inputs

    signal input a;
    signal input b;


    // signals from gates
    signal x;
    signal y;

    // final signal output
    signal output q;

    // component gates used to crrate custom circuit 
    component andGate = AND();
    component notGate = NOT();
    component orGate = OR();

    // circuit logic

    // for and gate 
    andGate.a <== a;
    andGate.b <== b;

    x <== andGate.out;

    // for not gate
    notGate.in <==b;

    y <== notGate.out;

    // for or gate
    orGate.a <== x;
    orGate.b <== y;
    
    q <== orGate.out;
    
}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}
component main = CustomCircuit();