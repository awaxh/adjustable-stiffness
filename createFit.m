function [fitresult, gof] = createFit(x, C_real)
%CREATEFIT(X,C_REAL)
%  创建一个拟合。
%
%  要进行 '无标题拟合 1' 拟合的数据:
%      X 输入: x
%      Y 输出: C_real
%  输出:
%      fitresult: 表示拟合的拟合对象。
%      gof: 带有拟合优度信息的结构体。
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 16-Mar-2026 14:15:07 自动生成


%% 拟合: '无标题拟合 1'。
[xData, yData] = prepareCurveData( x, C_real );

% 设置 fittype 和选项。
ft = fittype( 'a0+a1*cos(x*pi/90)+a2*cos(2*x*pi/90)+a3*cos(3*x*pi/90)+b1*sin(x*pi/90)+b2*sin(2*x*pi/90)+b3*sin(3*x*pi/90)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.196595250431208 0.251083857976031 0.616044676146639 0.473288848902729 0.351659507062997 0.830828627896291 0.585264091152724];

% 对数据进行模型拟合。
[fitresult, gof] = fit( xData, yData, ft, opts );

% 绘制数据拟合图。
figure( 'Name', '无标题拟合 1' );
h = plot( fitresult, xData, yData );
legend( h, 'C_real vs. x', '无标题拟合 1', 'Location', 'NorthEast', 'Interpreter', 'none' );
% 为坐标区加标签
xlabel( 'x', 'Interpreter', 'none' );
ylabel( 'C_real', 'Interpreter', 'none' );
grid on


