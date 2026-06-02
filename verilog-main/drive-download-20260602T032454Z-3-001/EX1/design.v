module IDK (
    input [0:3]A ,B ,C ,
    output [0:3]max ,min ,mid
);
    assign max = (A>=B)?((A>=C)?A:C):((B>=C)?B:C) ;
    assign min = (A<=B)?((A<=C)?A:C):((B<=C)?B:C) ;
    assign mid =  A + B + C - max - min ;
endmodule