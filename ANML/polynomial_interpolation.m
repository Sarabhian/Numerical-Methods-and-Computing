Av = [2.36 2.4 2.45 2.5 2.55 2.6];
map = [81 91 99 93 101 114];

sum = 0;
a = 2.58;
for i = 1:length(Av)
    u = 1;
    L = 1;
    for j = 1:length(Av)
        if j ~= i
            u = u * (a - Av(j));
            L = L * (Av(i) - Av(j));
        end
    end
    sum= sum + u / L * map(i);
end
disp(sum);
disp(j);