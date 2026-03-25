function [L,gradient] = matrix_gradient(s,X_target,X,theta,M,A,B,C)
    gradient = zeros(M,4);
    h=1e-8;
    for i=1:M
        for j=1:4
            L = norm(X - X_target, 'fro')/sqrt(M);
            theta(i,j) = theta(i,j) + h;
            [P,Q,R,W] = give_matrix_value(s,theta,M,A,B,C);
            X_delta = thomas(P,Q,R,W,M);
            theta(i,j) = theta(i,j) - h;
            gradient(i,j) = (norm(X_delta - X_target, 'fro') - norm(X - X_target, 'fro'))/h;
        end
    end
    gradient = 2*pi*gradient/(norm(gradient', 1));
end