v=30:-1:1;

for i=1:length(v)

    if(mod(i,2)==1)
       v(i)=sin(v(i));
    end

    
w=1:30;

for i=1:length(v)
       if(mod(i,2)==0)
          w(i)=v(i-1); 
      
       end
end
      
end

w