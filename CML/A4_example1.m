% conversion of aCTUAl value(str) to data using file handling
str=' 18km  30km 40km 45km 10km ';
f=fopen('distance.dat','w');
fprintf(f,'%s',str);
fclose(f);

f=fopen('distance.dat','r');
[A,count]=fscanf(f,['%d' 'km']);
fclose(f);
