clc
clear all
close all
len=input('Enter length of input text: ');
text="";
for i=1:len
text=text+string(char(randi([97,122])));
end
text=char(text);
%text= input('Enter the text data : ','s');
disp("---------------");
intial_dict= unique(text);
[enco, enco_bin, code_book] = lempel_ziv(intial_dict, text);
disp("---------------");
huff = huffman(text);
disp("---------------");
huff_comp_percent= ((length(text)*7)./length(huff));
lzw_comp_percent= ((length(text)*7)./length(enco_bin));

sprintf('Compression ratio of Huffmann Compression is %.4f',huff_comp_percent)
sprintf('Compression ratio of LZW Compression is %.4f',lzw_comp_percent)
