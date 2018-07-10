syms a2
syms d1 d4 d6
syms tetha1 tetha2 tetha3 tetha4 tetha5 tetha6
A=[0 a2 0 0 0 0]
ALPHA = [ pi/2 0 pi/2 -pi/2 pi/2 0]
D = [d1 0 0 d4 0 d6]
TETHA = [tetha1 tetha2 tetha3+pi/2 tetha4 tetha5 tetha6]

Talpha = @(fi)[1 0 0 0;
           0 eval(sprintf('%.4f',cos(fi))) eval(sprintf('%.4f',-sin(fi))) 0;
           0 eval(sprintf('%.4f',sin(fi))) eval(sprintf('%.4f',cos(fi))) 0;
           0 0 0 1]

Ttetha=@(fi)[cos(fi) -sin(fi) 0 0;
           sin(fi) cos(fi) 0 0;
           0 0 1 0;
           0 0 0 1]
Td=@(dis)[1 0 0 0;
          0 1 0 0;
          0 0 1 dis;
          0 0 0 1]
Ta=@(dis)[1 0 0 dis;
          0 1 0 0;
          0 0 1 0;
          0 0 0 1]
Ti=@(i)Ttetha(TETHA(i))*Td(D(i))*Ta(A(i))*Talpha(ALPHA(i))
T=Ti(1)*Ti(2)*Ti(3)*Ti(4)*Ti(5)*Ti(6)