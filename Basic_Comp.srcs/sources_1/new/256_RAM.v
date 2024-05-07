
module RAM (CLK,read,AR,write,INDATA,OUTDATA );
    input CLK,read,write;
    input [15:0]INDATA;
    input [11:0] AR;
    output reg [15:0] OUTDATA;
    
    reg [15:0] RAM_4K [4096:0];
        
    initial begin
       RAM_4K[0] = 16'h0200; 
       RAM_4K[1] = 16'h1f00;
       RAM_4K[2] = 16'h243c;
       RAM_4K[3] = 16'h3011;
       RAM_4K[4] = 16'h4000;
       RAM_4K[5] = 16'h5600;
       RAM_4K[6] = 16'h6f01;
    end
    
    always@* begin
        if (write)
            RAM_4K[AR] <= INDATA;
        else if(read)
            OUTDATA = RAM_4K[AR];
        end

endmodule
