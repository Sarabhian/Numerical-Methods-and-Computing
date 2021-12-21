% reading and writing spreadsheet
clear vars 
v={1 2 3; 4 5 'x' ;7 8 9};

h={ 'first','second', 'third'};

xlswrite('val.xlsx',[h; v]);

A=xlsread('val.xlsx')

columnB=xlsread('val','B:B')
xlRange='B2:C3';
sheet=1;
subsetA=xlsread('val.xlsx',sheet,xlRange)