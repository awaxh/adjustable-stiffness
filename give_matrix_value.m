function [P,Q,R,W] = give_matrix_value(s,theta,M,A,B,C)
    A1 = zeros(2,2,M); B1 = A1; C1 = A1; A2 = A1; B2 = A1; C2 = A1;
    A3 = A1; B3 = A1; C3 = A1; D3 = A1; E3 = A1; A4 = A1; B4 = A1;
    C4 = A1; D4 = A1; E4 = A1; A5 = A1; B5 = A1; C5 = A1; D5 = A1; E5 = A1;
    % 给A1-A5,B1-B5,C1-C5,D3-D5,E3-E5赋予矩阵值

    P = zeros(6,6,M);   Q = P; R = P;
    W = zeros(6,1,M);

    V1 = zeros(2,1,M); V2 = V1; V3 = V1; V4 = V1; V5 = V1;
    

    for i = 1:M-1
        A1(:,:,i) = [-A(theta(i,1)) + C(theta(i,1)) - B(theta(i+1,2)) - C(theta(i+1,2)), -A(theta(i,1)) - C(theta(i,1)) - B(theta(i+1,2)) + C(theta(i+1,2));
                        B(theta(i,1)) - C(theta(i,1)) + A(theta(i+1,2)) + C(theta(i+1,2)), -B(theta(i,1)) - C(theta(i,1)) - A(theta(i+1,2)) + C(theta(i+1,2))];
        
        B1(:,:,i) = [A(theta(i,1)) - C(theta(i,1)), A(theta(i,1)) + C(theta(i,1));
                        -B(theta(i,1)) + C(theta(i,1)), B(theta(i,1)) + C(theta(i,1))];
        
        C1(:,:,i) = [B(theta(i+1,2)) + C(theta(i+1,2)), B(theta(i+1,2)) - C(theta(i+1,2));
                        -A(theta(i+1,2)) - C(theta(i+1,2)), A(theta(i+1,2)) - C(theta(i+1,2))];
        
        A2(:,:,i) = [-A(theta(i,3)) + C(theta(i,3)) - B(theta(i+1,4)) - C(theta(i+1,4)), -A(theta(i,3)) - C(theta(i,3)) - B(theta(i+1,4)) + C(theta(i+1,4));
                        B(theta(i,3)) - C(theta(i,3)) + A(theta(i+1,4)) + C(theta(i+1,4)), -B(theta(i,3)) - C(theta(i,3)) - A(theta(i+1,4)) + C(theta(i+1,4))];
        
        B2(:,:,i) = [-A(theta(i,3)) - C(theta(i,3)), A(theta(i,3)) - C(theta(i,3)); 
			B(theta(i,3)) + C(theta(i,3)), B(theta(i,3)) - C(theta(i,3))];
        
        C2(:,:,i) = [-B(theta(i+1,4)) + C(theta(i+1,4)), B(theta(i+1,4)) + C(theta(i+1,4)); 
			A(theta(i+1,4)) - C(theta(i+1,4)), A(theta(i+1,4)) + C(theta(i+1,4))];
        
        A3(:,:,i) = [-B(theta(i,1)) - C(theta(i,1)) - A(theta(i+1,2)) + C(theta(i+1,2)) - A(theta(i,3)) + C(theta(i,3)) - B(theta(i+1,4)) - C(theta(i+1,4)), ...
			-B(theta(i,1)) + C(theta(i,1)) - A(theta(i+1,2)) - C(theta(i+1,2)) - A(theta(i,3)) - C(theta(i,3)) - B(theta(i+1,4)) + C(theta(i+1,4)); ...
			A(theta(i,1)) + C(theta(i,1)) + B(theta(i+1,2)) - C(theta(i+1,2)) + B(theta(i,3)) - C(theta(i,3)) + A(theta(i+1,4)) + C(theta(i+1,4)), ...
			-A(theta(i,1)) + C(theta(i,1)) - B(theta(i+1,2)) - C(theta(i+1,2)) - B(theta(i,3)) - C(theta(i,3)) - A(theta(i+1,4)) + C(theta(i+1,4))];
        
        B3(:,:,i) = [B(theta(i,1)) + C(theta(i,1)), B(theta(i,1)) - C(theta(i,1)); 
			-A(theta(i,1)) - C(theta(i,1)), A(theta(i,1)) - C(theta(i,1))];
        
        C3(:,:,i) = [A(theta(i+1,2)) - C(theta(i+1,2)), A(theta(i+1,2)) + C(theta(i+1,2)); 
			-B(theta(i+1,2)) + C(theta(i+1,2)), B(theta(i+1,2)) + C(theta(i+1,2))];
        
        D3(:,:,i) = [A(theta(i,3)) - C(theta(i,3)), A(theta(i,3)) + C(theta(i,3)); 
			-B(theta(i,3)) + C(theta(i,3)), B(theta(i,3)) + C(theta(i,3))];
        
        E3(:,:,i) = [B(theta(i+1,4)) + C(theta(i+1,4)), B(theta(i+1,4)) - C(theta(i+1,4)); 
			-A(theta(i+1,4)) - C(theta(i+1,4)), A(theta(i+1,4)) - C(theta(i+1,4))];

        A4(:,:,i) = [B(theta(i,2)) + C(theta(i,2)), B(theta(i,2)) - C(theta(i,2)); 
			-A(theta(i,2)) - C(theta(i,2)), A(theta(i,2)) - C(theta(i,2))];

        B4(:,:,i) = [A(theta(i,1)) - C(theta(i,1)), A(theta(i,1)) + C(theta(i,1)); 
			-B(theta(i,1)) + C(theta(i,1)), B(theta(i,1)) + C(theta(i,1))];

        C4(:,:,i) = [A(theta(i,2)) - C(theta(i,2)), A(theta(i,2)) + C(theta(i,2)); 
			-B(theta(i,2)) + C(theta(i,2)), B(theta(i,2)) + C(theta(i,2))];

        D4(:,:,i) = [B(theta(i,1)) + C(theta(i,1)), B(theta(i,1)) - C(theta(i,1)); 
			-A(theta(i,1)) - C(theta(i,1)), A(theta(i,1)) - C(theta(i,1))];

        E4(:,:,i) = (A(theta(i,1)) + A(theta(i,2)) + B(theta(i,1)) + B(theta(i,2))) * [-1, -1; 1, -1];

        A5(:,:,i) = [B(theta(i,4)) + C(theta(i,4)), B(theta(i,4)) - C(theta(i,4)); 
			-A(theta(i,4)) - C(theta(i,4)), A(theta(i,4)) - C(theta(i,4))];

        B5(:,:,i) = [A(theta(i,3)) - C(theta(i,3)), A(theta(i,3)) + C(theta(i,3)); 
			-B(theta(i,3)) + C(theta(i,3)), B(theta(i,3)) + C(theta(i,3))];

        C5(:,:,i) = [A(theta(i,4)) - C(theta(i,4)), A(theta(i,4)) + C(theta(i,4)); 
			-B(theta(i,4)) + C(theta(i,4)), B(theta(i,4)) + C(theta(i,4))];

        D5(:,:,i) = [B(theta(i,3)) + C(theta(i,3)), B(theta(i,3)) - C(theta(i,3)); 
			-A(theta(i,3)) - C(theta(i,3)), A(theta(i,3)) - C(theta(i,3))];

        E5(:,:,i) = (A(theta(i,3)) + A(theta(i,4)) + B(theta(i,3)) + B(theta(i,4))) * [-1, -1; 1, -1];

        P(:,:,i) = [-B1(:,:,i)*inv(E4(:,:,i))*A4(:,:,i), -B1(:,:,i)*inv(E4(:,:,i))*C4(:,:,i), zeros(2,2); ...
            zeros(2,2), -B2(:,:,i)*inv(E5(:,:,i))*A5(:,:,i), -B2(:,:,i)*inv(E5(:,:,i))*C5(:,:,i); ...
            -B3(:,:,i)*inv(E4(:,:,i))*A4(:,:,i), -B3(:,:,i)*inv(E4(:,:,i))*C4(:,:,i) - D3(:,:,i)*inv(E5(:,:,i))*B5(:,:,i), -D3(:,:,i)*inv(E5(:,:,i))*C5(:,:,i)];

        Q(:,:,i) = [A1(:,:,i) - B1(:,:,i)*inv(E4(:,:,i))*B4(:,:,i) - C1(:,:,i)*inv(E4(:,:,i))*A4(:,:,i), -B1(:,:,i)*inv(E4(:,:,i))*D4(:,:,i) - C1(:,:,i)*inv(E4(:,:,i))*C4(:,:,i), zeros(2,2); ...
            zeros(2,2), -B2(:,:,i)*inv(E5(:,:,i))*B5(:,:,i) - C2(:,:,i)*inv(E5(:,:,i))*A5(:,:,i), A2(:,:,i) - B2(:,:,i)*inv(E5(:,:,i))*D5(:,:,i) - C2(:,:,i)*inv(E5(:,:,i))*C5(:,:,i); ...
            -B3(:,:,i)*inv(E4(:,:,i))*B4(:,:,i) - C3(:,:,i)*inv(E4(:,:,i))*A4(:,:,i), A3(:,:,i) - B3(:,:,i)*inv(E4(:,:,i))*D4(:,:,i) - C3(:,:,i)*inv(E4(:,:,i))*C4(:,:,i) - D3(:,:,i)*inv(E5(:,:,i))*B5(:,:,i) - E3(:,:,i)*inv(E5(:,:,i))*A5(:,:,i), -D3(:,:,i)*inv(E5(:,:,i))*D5(:,:,i) - E3(:,:,i)*inv(E5(:,:,i))*C5(:,:,i)];

        R(:,:,i) = [-C1(:,:,i)*inv(E4(:,:,i))*B4(:,:,i), -C1(:,:,i)*inv(E4(:,:,i))*D4(:,:,i), zeros(2,2); ...
            zeros(2,2), -C2(:,:,i)*inv(E5(:,:,i))*B5(:,:,i), -C2(:,:,i)*inv(E5(:,:,i))*D5(:,:,i);
            -C3(:,:,i)*inv(E4(:,:,i))*B4(:,:,i), -C3(:,:,i)*inv(E4(:,:,i))*D4(:,:,i) - E3(:,:,i)*inv(E5(:,:,i))*B5(:,:,i), -E3(:,:,i)*inv(E5(:,:,i))*D5(:,:,i)];

        V1(:,:,i) = 2*s*[A(theta(i,1)) - C(theta(i+1,2)); C(theta(i,1)) + A(theta(i+1,2))];

        V2(:,:,i) = 2*s*[-A(theta(i,3)) + C(theta(i+1,4)); C(theta(i,3)) - A(theta(i+1,4))];

        V3(:,:,i) = 2*s*[A(theta(i,3)) - C(theta(i+1,4)) - C(theta(i,1)) + A(theta(i+1,2)); C(theta(i,3)) + A(theta(i+1,4)) - A(theta(i,1)) + C(theta(i+1,2))];

        V4(:,:,i) = [0;0];

        V5(:,:,i) = [0;0];

        W(:,:,i) = [V1(:,:,i) - B1(:,:,i)*inv(E4(:,:,i))*V4(:,:,i) - C1(:,:,i)*inv(E4(:,:,i))*V4(:,:,i); ...
            V2(:,:,i) - B2(:,:,i)*inv(E5(:,:,i))*V5(:,:,i) - C2(:,:,i)*inv(E5(:,:,i))*V5(:,:,i); ...
            V3(:,:,i) - B3(:,:,i)*inv(E4(:,:,i))*V4(:,:,i) - C3(:,:,i)*inv(E4(:,:,i))*V4(:,:,i) - D3(:,:,i)*inv(E5(:,:,i))*V5(:,:,i) - E3(:,:,i)*inv(E5(:,:,i))*V5(:,:,i)];
    end
end

