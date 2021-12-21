% table arrangement 
fprintf('-------  -------\n');

fprintf('%6s |%8s\n','INDEX','VALUE');
fprintf('-------  -------\n');

for i=1:5
    a=2*i+1;
    fprintf('|%4.0f  |%8.1f|\n',i,a);
end
fprintf('-----------------\n')

% or
index=[1:5]';
value=(2*index+1);
t=table(index , value )