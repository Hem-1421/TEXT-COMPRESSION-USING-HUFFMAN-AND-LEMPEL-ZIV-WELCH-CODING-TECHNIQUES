function huff = huffman( str)
alpha= unique(str, 'stable');
p=[];
count =0;

for b=1:length(alpha)
    count =0;
    for c=1:length(str)
        if strcmp(str(c),alpha(b)) == 1
            count = count +1;
        end
    end
    p(b)=count/length(str);
end

for index = 1:length(p)
    code{index} = [];
    symbol_index{index} = index;
    probabilities(index) = p(index);
end

while length(symbol_index) > 1
    [~, sort_elements_index] = sort(probabilities);
    one_set = symbol_index{sort_elements_index(1)};
    one_probability = probabilities(sort_elements_index(1));
    
    for codeword_index = 1:length(one_set)
        code{one_set(codeword_index)} = [code{one_set(codeword_index)}, 1];
    end
    zero_set = symbol_index{sort_elements_index(2)};
    zero_probability = probabilities(sort_elements_index(2));
    
    for codeword_index = 1:length(zero_set)
        code{zero_set(codeword_index)} = [code{zero_set(codeword_index)}, 0];
    end
    symbol_index(sort_elements_index(1:2)) = [];
    symbol_index{length(symbol_index)+1} = [one_set, zero_set];
    probabilities(sort_elements_index(1:2)) = [];
    probabilities(length(probabilities)+1) = one_probability + zero_probability;
end

disp('The symbols, their probabilities and the allocated Huffman codewords are:');

dummy={};

for index = 1:length(code)

    dummy{index}=code{index}(length(code{index}):-1:1);
    disp([alpha(index), ' ', num2str(p(index)),' ',num2str(code{index}(length(code{index}):-1:1))]);
end

% the symbol entropy
entropy = 0;
for i=1:length(p)
    info=(-1)*log2(p(i));
    pdt=p(i)*info;
    entropy=entropy+pdt;
end

% average Huffman codeword length
av_length = 0;
for index = 1:length(code)
    av_length = av_length + p(index)*length(code{index});
end
disp(['Symbol entropy is: ',num2str(entropy)]);
disp(['Average Huffman codeword length is: ',num2str(av_length)]);
disp(['Huffman efficiency is: ',num2str(entropy/av_length)]);

huff="";
for c=1:length(str)
    for b=1:length(alpha)
        if strcmp(str(c),alpha(b)) == 1
            for i=1:length(dummy{b})            
                huff=huff+string(dummy{b}(i));
            end
        end
    end
end
huff=char(huff);
disp('Huffman compressed data is');
disp(huff)