%% Vector and Matrix Norm and Condition Number

clc
clear
%% Input Data
A = [1  2 -3;
    -4  5  6;
     7 -8  9];          % Input matrix for norm

 b = [-17; 14; 4];      % Input vector for norm

 X = [2  1;
      2  1.01];         % Input matrix for condition number

%% Norm of vector
n = norm(b)             %  Euclidean norm of vector b

n = norm(b,1)           %  1-norm of vector b

n = norm(b,2)           %  2-norm of vector b same as Euclidean norm of vector b

n = norm(b,Inf)         %  Maximum magnitude or uniform vector norm of vector b

%% Norm of Matrix
n = norm(A)             %  maximum singular value of matrix A

n = norm(A,1)           %  1-norm or Column-sum norm of matrix A

n = norm(A,2)           %  maximum singular value of matrix A different than 2-norm or Frobenius norm of matrix A

n = norm(A,'fro')       %  2-norm of matrix A same as Frobenius norm of matrix A

n = norm(A,Inf)         %  Uniform matrix norm or row-sum norm of matrix A

%% Condition Number

C = cond(X)             %   2-norm condition number of matrix X

C = cond(X,1)           %   1-norm condition number of matrix X

C = cond(X,2)           %   2-norm condition number of matrix X

C = cond(X,Inf)         %   Inf-norm condition number of matrix X
