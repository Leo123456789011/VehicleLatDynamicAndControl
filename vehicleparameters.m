% Vehicle's real parameters.
m_fl_ = 2250;
m_fr_ = 2250;
m_rl_ = 2250;
m_rr_ = 2250;
m_front_ = m_fl_ + m_fr_;
m_rear_ = m_rl_ + m_rr_;
m_ = m_front_ + m_rear_;

%steer_transmission_ratio_ = 25.13;
%steer_single_direction_max_degree_ = 1055; %degree
lr_ = 2;
lf_ = 2;
L_ = lr_ + lf_;
V_x_ = 10; %The speed is constant, here we assume it is 3m/s.
I_z_ = lf_ * lf_ * m_front_ + lr_ * lr_ * m_rear_;

C_f_ = 25000;
C_r_ = 25000;

%Calculate vehicel's real linear lateral dynamic model:
A_ = [0,1,0,0;
    0,-(2*C_f_ + 2*C_r_)/(m_*V_x_),(2*C_f_ + 2*C_r_)/m_, -(2*C_f_*lf_ + 2*C_r_*lr_)/(m_*V_x_);
    0, 0, 0, 1;
   0, -(2*C_f_*lf_ - 2*C_r_*lr_)/(I_z_*V_x_), (2*C_f_*lf_ - 2*C_r_*lr_)/(I_z_), -(2*C_f_*lf_^2 + 2*C_r_*lr_^2)/(I_z_*V_x_)
];

B1_ = [0; 2*C_f_/m_; 0; 2*C_f_*lf_/I_z_];

B2_ = [0; -(2*C_f_*lf_ - 2*C_r_*lr_)/(m_*V_x_)-V_x_; 0; -(2*C_f_*lf_^2 + 2*C_r_*lr_^2)/(I_z_*V_x_)];
