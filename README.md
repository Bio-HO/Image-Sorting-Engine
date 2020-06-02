# Image-Sorting-Engine
實用數位系統設計的期末專案

color_compare:(未合成，波型模擬正確)
最前端的比較器。讀入pixel_in，判斷哪個顏色比較多並使對應的pixel輸出1

input[23:0] pixel_in;

output R_pixel,G_pixel,B_pixel;


count_compare:(未合成，波型模擬正確)
中段的比較器。讀入各顏色總個數判斷哪個顏色最多並輸出對應顏色代碼

input[14:0] R_count,G_count,B_count;

output[1:0] color;
