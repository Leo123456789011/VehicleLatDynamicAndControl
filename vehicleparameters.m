
m_fl = 2250;
m_fr = 2250;
m_rl = 2250;
m_rr = 2250;
m_front = m_fl + m_fr;
m_rear = m_rl + m_rr;
m = m_front + m_rear;

steer_transmission_ratio = 25.13;
steer_single_direction_max_degree = 1055; %degree
lr = 2;
lf = 2;
L = lr + lf;
V_x = 3; %The speed is constant, here we assume it is 2m/s.
I_z = lf * lf * m_front + lr * lr * m_rear;


