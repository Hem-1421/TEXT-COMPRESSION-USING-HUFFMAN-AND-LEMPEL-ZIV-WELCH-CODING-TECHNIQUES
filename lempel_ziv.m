function [enco, enco_bin, enco_dict] = lempel_ziv(intial_dict, text)
dict=intial_dict;   
text1=text;    
enco_dict=cell(length(dict),1);      

for i=1:1:length(dict)              
    enco_dict{i}=dict(i);
end

str=text1(1);   
enco=[];  
i=1;
index=1;
z=0;

while i<=length(text1)   
    count=0;
    for i=1:length(enco_dict)
        if(length(str)==length(enco_dict{i})) 
            if(strcmp(str,enco_dict{i})==1)
                z=i;    
                count=1;
            end
        end
    end
    if count==0   
        enco_dict{length(enco_dict)+1}=str;
        enco(length(enco)+1)=z;     
        str=str(length(str));     
    end
    if count==1    
        index=index+1;
        if index>length(text1)   
            for i=1:length(enco_dict)
                if(length(str)==length(enco_dict{i}))
                    if(strcmp(str,enco_dict{i})==1)
                        z=i;
                    end
                end
            end
            enco(length(enco)+1)=z;
            break;
        end
        str=[str text1(index)];   
    end
end

enco_bin='';

for i=1:length(enco)
    enco_bin=enco_bin+string(dec2bin(enco(i)));   
end
enco_bin=char(enco_bin);
disp('LZW compressed data is')
disp(enco_bin)
