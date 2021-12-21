% table arrangement once again using file handling

x=0:.1:1;
A=[x; exp(x)];

f=fopen('exp.txt','w');
fprintf(f,'-------  -------\n');
fprintf(f,'%6s |%8s\n','X','exp(x)');
fprintf(f,'-------  -------\n');
fprintf(f, '%6.2f | %12.5f\n',A);
fprintf(f,'-------  -------\n');
fprintf('-----------------\n');
fclose(f);
type('exp.txt')