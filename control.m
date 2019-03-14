%feedback:
A = [0,1,0,0;
    0,-(2*C_f + 2*C_r)/(m*V_x),(2*C_f + 2*C_r)/m, -(2*C_f*lf + 2*C_r*lr)/(m*V_x);
    0, 0, 0, 1;
   0, -(2*C_f*lf - 2*C_r*lr)/(I_z*V_x), (2*C_f*lf - 2*C_r*lr)/(I_z), -(2*C_f*lf^2 + 2*C_r*lr^2)/(I_z*V_x)
];

B1 = [0; 2*C_f/m; 0; 2*C_f*lf/I_z];

B2 = [0; -(2*C_f*lf - 2*C_r*lr)/(m*V_x)-V_x; 0; -(2*C_f*lf^2 + 2*C_r*lr^2)/(I_z*V_x)];

Q = [0.1,0,0,0;
     0,0,0,0;
     0,0,0.1,0;
     0,0,0,0
];
R = 1;
K = lqr(A,B1,Q,R,0);
%feedforward:
delta_ff = (m * V_x^2)/(Radi*L)*( (lr)/(2*C_f) - (lf)/(2*C_r) + (lf)/(2*C_r)*K(3) ) + L/Radi - lr/Radi * K(3);