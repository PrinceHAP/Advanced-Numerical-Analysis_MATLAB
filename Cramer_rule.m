%% Solution of system of linear equations using Cramer's Method

clc
clear
%% Input Data
A = [9 4 1;
    1 -2 -6;
    1 6 0];             % Coefficient matrix
b = [-17; 14; 4];       % Known vector

%% Cramer's Rule
% det() function is used to determine the determinant of a square matrix
A1 = A;
A1(1:end,1) = b;        
x1 = det(A1)/det(A)     % First root

A2 = A;
A2(1:end,2) = b;
x2 = det(A2)/det(A)     % Second root

A3 = A;
A3(1:end,3) = b;
x3 = det(A3)/det(A)     % Third root
