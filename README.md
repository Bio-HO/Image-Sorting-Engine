# Image-Sorting-Engine
實用數位系統設計的期末專案

color_compare:(未合成，波型模擬正確)
最前端的比較器。讀入pixel_in，判斷哪個顏色比較多並使對應的pixel輸出1

input[23:0] pixel_in;

output R_pixel,G_pixel,B_pixel;

================================================================================
count_compare:(未合成，波型模擬正確)
中段的比較器。讀入各顏色總個數判斷哪個顏色最多並輸出對應顏色代碼

input[14:0] R_count,G_count,B_count;

output[1:0] color;

================================================================================
count_adder:(未合成，波型模擬正確)
顏色個數的累加器

input in,rst,clk;

output[14:0] count;

================================================================================
count16384:(未合成，波型模擬正確)
數16384次即發出busy訊號直到收到busy_rst為止

input clk, busy_rst;

output busy;

注:busy_rst由儲存排序器於處理完畢後送出至計數器

================================================================================
color_adder:(未合成，波型模擬正確)

像素色彩加總器，以sel訊號決定是否去加總輸入的色彩強度值，在clk正緣進行加總運算。

input sel;

input [7:0] pixel_in;

output [22:0] value_out;

================================================================================
"已廢棄"rst_counter:(未合成，波型模擬正確)
負責顏色個數與強度六個累加器的rst，在每張圖的第一個pixel輸入進來時同時將adder輸出歸零(因此是clk上升觸發)並於clk下降緣時拉高回復，這樣clk下降緣adder便能正常做累加
一樣能被本來輸入的rst觸發

#問題:這可能造成adder在第一次資料加進來後(clk負緣)又觸發一次rst，需要再修

input rst,clk;

output adder_rst;

================================================================================
color_mux:(未合成，波型模擬正確)
將顏色強度依照count_compare輸出的顏色代碼輸出對應的顏色強度

input[1:0] color;
input[22:0] R,G,B;

output[22:0] total;

================================================================================
count_mux:(未合成，波型模擬正確)
將顏色個數依照count_compare輸出的顏色代碼輸出對應的顏色個數

input[1:0] color;
input[14:0] R_count,G_count,B_count;

output[14:0] count;

================================================================================
divider:(未合成，波型模擬正確)
除法器，為了能讓商的小數部分出現，故對被除數(顏色強度)左移了10位(精度約到點後三位)
quartus顯示的邏輯閘數目非常精彩，需要再思考如何簡化

input[14:0] count;

input[22:0] total;

output[22:0] AVG;

================================================================================
insert_sort:(波型模擬正確)
當clk正緣in_valid高時就讀color、total跟index進來排序
排完一張就busy_rst拉低一clk
排完32張就輸出並拉高out_valid

input[1:0] color;

input[22:0] total;  //from divider

input[4:0] index;

input in_valid,rst,clk;  //from??

output[1:0] color_index;

output[4:0] image_out_index;

output out_valid,busy_rst;
