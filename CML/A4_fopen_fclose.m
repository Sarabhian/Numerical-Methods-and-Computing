% reading writing creating files + open and close files 
x=[1 2 3 4 5 ];
fid=fopen('temperature.m','w');
fprintf(fid,'\n%f',x);
fclose(fid);

% temp conversion

y=randi(1000,100,1);
func=fopen('temp_conversion.m','w');
f=9/5*y+32;
fprintf(func,'\n%f',f);
fclose(func);

func=fopen('temp_conversion.m','r');
z=fscanf(func,'%f %f %f',5);   %just reading first 5 temp values
z(:,1)
fclose(func);
