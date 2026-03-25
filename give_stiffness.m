clear all
close all
P = table2array(readtable('Untitled.txt'));
N = 10;
L = 180;
x = [0,20,40,60,80,100,120,140,160];

stiffness = zeros(2,2,N);

A_real = zeros(N-1,1);
B_real = zeros(N-1,1);
C_real = zeros(N-1,1);

for i = 1:N-1
    j = i+10;
    stiffness(:,:,i) = inv([P(i,3),P(i,4); P(j,3),P(j,4)]);
    A_real(i) = stiffness(1,1,i);
    B_real(i) = stiffness(2,2,i);
    C_real(i) = stiffness(1,2,i);
end
