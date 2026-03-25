clear all
close all

    A_a0 = 2.1714;
    A_a1 = 0.2550;
    A_a2 = 1.2618;
    A_a3 = 0.0909;
    A_b1 = -0.0005;
    A_b2 = 0.0003;
    A_b3 = -0.0011;
    B_a0 = 0.1941;
    B_a1 = 0.0049;
    B_a2 = -0.0637;
    B_a3 = -0.0092;
    B_b1 = -0.0002;
    B_b2 = 0.0001;
    B_b3 = 0.0001;
    C_a0 = -0.0001;
    C_a1 = 0.0001;
    C_a2 = 0.0001;
    C_a3 = -0.0004;
    C_b1 = 0.2201;
    C_b2 = 0.2011;
    C_b3 = -0.0063;

    A = @(t) A_a0 + A_a1*cos(t*pi/90) + A_a2*cos(2*t*pi/90) + A_a3*cos(3*t*pi/90)...
                  + A_b1*sin(t*pi/90) + A_b2*sin(2*t*pi/90) + A_b3*sin(3*t*pi/90);     %由comsol仿真结果拟合A,B,C值
    B = @(t) B_a0 + B_a1*cos(t*pi/90) + B_a2*cos(2*t*pi/90) + B_a3*cos(3*t*pi/90)...
                  + B_b1*sin(t*pi/90) + B_b2*sin(2*t*pi/90) + B_b3*sin(3*t*pi/90);
    C = @(t) C_a0 + C_a1*cos(t*pi/90) + C_a2*cos(2*t*pi/90) + C_a3*cos(3*t*pi/90)...
                  + C_b1*sin(t*pi/90) + C_b2*sin(2*t*pi/90) + C_b3*sin(3*t*pi/90);


M = 30;     read = table2array(readtable('random.csv'));
theta = read(1:M,1:4);
% 上、右箭头定义为1；上、左箭头定义为2；下、右箭头定义为3；下、左箭头定义为4

s = 0.2; 

[P,Q,R,W] = give_matrix_value(s,theta,M,A,B,C);

X = thomas(P,Q,R,W,M);

X_target = zeros(6,1,M);    alpha = 10;

index = 6;  %修改周期

for i=1:M
    % 原来的 X_target(:,:,i) = alpha*s*[sin(2*pi*i/M); -sin(2*pi*i/M); sin(2*pi*i/M); -sin(2*pi*i/M); sin(2*pi*i/M); -sin(2*pi*i/M)];
    X_target(:,:,i) = alpha*s*[sin(index*pi*i/M); -sin(index*pi*i/M); sin(index*pi*i/M); -sin(index*pi*i/M); sin(index*pi*i/M); -sin(index*pi*i/M)];
end

eta = 5;



file = fopen('loss.txt','w');

train = 200; draw = round(train/10) - 1; loss = zeros(train,1);

figure_index = 1;
checkpoint = draw;

for epoch = 1:train
    disp(epoch)
    [L,gradient] = matrix_gradient(s,X_target,X,theta,M,A,B,C);
    theta = mod(theta - eta*gradient, 180);
    [P,Q,R,W] = give_matrix_value(s,theta,M,A,B,C);
    X = thomas(P,Q,R,W,M);
    loss(epoch) = L;
    fprintf(file,'%4.5f\n',loss(epoch));
    if epoch > checkpoint
        subplot(5,2,figure_index)
        hold on
       % ylim([-2.5,2.5]);
        p1 = plot(squeeze(X(2,1,:)));
        p2 = plot(squeeze(X(6,1,:)));
        p3 = plot(squeeze(X_target(6,1,:)));
        legend('实际上端y位移','实际下端y位移','目标y位移');
        figure_index = figure_index+1;
        checkpoint = checkpoint + draw + 1;
        eta=eta*0.95;
    end
end
hold off

fclose(file);



write_theta = strings(M*4,2);

for i = 1:M
    for j = 1:4
        write_theta(4*(i-1)+j, 1) = ['theta_row',num2str(j),'_column',num2str(i)];
        write_theta(4*(i-1)+j, 2) = [num2str(theta(i,j))];
    end
end


file_0 = fopen('theta.xlsx','w');
writematrix(write_theta, file_0);
fclose(file_0);