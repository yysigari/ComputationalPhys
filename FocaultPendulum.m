%FocaultPendulum
%
%program to compute prcession of a Focault pendulum
%
clear;
help Focault_exact;
%
% clear memory and print header
% 
syms X1 X2 x1 x2 k1 k2; %k1 is natural frequency = w^2,
%k2 is 2*omega8sin (phi)
%phi is latitude , omega is eaarth frequency
%pick time in days, omega = 2*pi
%pendulum precesses by 2*pi8sin(phi) per day
%x is east and y is north in earth system
fprintf('Focault pendulum , Gravity plus Coriolis Causes Precession \n')
fprintf('D2x = -w^2x + (28omega*sin(phi))*dydt \n')
fprintf('D2y = -w^2y -(28omega*sin(phi))*dxdt \n')
%
[X1,X2]=dsolve('D2x1 = -k1*x1 +k2*D1x2','D2x2=-k1*x2-k2*D1x1','x1(0)=0','x2(0)=1','Dx1(0)=0','Dx2(0)=0')
%
iloop=0;
irun = 1;
while irun>0
    %
    krun = menu('Another Set of parameters to solve?','Yes','No');
    if krun ==2
        irun = -1;
        break
    end
%
if krun == 1
    Tpen = input('Enter Pendulum period (days): ');
     w = (2.0 .*pi )./Tpen; %convert by frequency
     phi = input('Enter Latitude (degrees): ');
     phir = (2 .*pi .*phi)./360; %Radians
     omega = 2.0 .*pi ; %Earth rotation
     %
     k1 = w.^2;
     k2 = 2.0 .* omega .* sin(phir);
     %
     tt = linspace(0,2,200);
     ntt = length(tt);
     for i = 1:ntt
         t = tt(i);
         xxx1(i) = real (eval(X1));
         xxx2(i) = real(eval(X2));
     end
     %
     iloop = iloop +1;
     figure(iloop)
     %
     plot(tt, xxx1,'b-' , tt , xxx2, 'r-')
     title('Exact x(t) and y(t) of Focault pendulum -Earth Frame')

     xlabel('t')
     ylabel('x , y')
     %
     iloop = iloop +1;
     figure(iloop)
     plot(xxx1, xxx2,'-b')
     title('Exact x vs y of Focault pendulum -Earth Frame')
     axis([-1 1 -1 1])
     xlabel('x')
     ylabel('y')
     %
     %Approxiamte result
     %
     ta = linspace(0, tt(ntt), ntt);
     %
     % in absolute frame, oendulum has SHO
     %
     yaf = sin(w .*ta);
     %
     %rotating earth frame
     %
      wpre = omega.*sin(phir);
      cp = cos(wpre.*ta);
      sp = sin(wpre.*ta);
      xear = sp.*yaf;
      year = cp.*yaf;
      %
      iloop = iloop +1;
      figure(iloop)
      for i = 2:length(ta)
          %
          x1(1) = xear(i-1);
          y1(1) = year(i-1);
          x1(2) = xear(i);
          y1(2) = year(i);
          plot(x1, y1,'-');
          axis([-1 1 -1 1])
          title('Approximate Earth Frame - Precession , Movie')
          xlabel('x')
          ylabel('y')
          pause(0.2)
          hold on
      end
      hold off
      %
      iloop = iloop +1;
      figure(iloop)
      for i = 2:length(ta)
          %
          x1(1) = xxx1(i-1);
          y1(1) = xxx2(i-1);
          z1(1) = 0;
          x1(2) = xxx1(i);
          y1(2) = xxx2(i);
          z1(2) = 0;
          plot3(x1, y1,z1,'-')
          grid ON
          axis([-1 1 -1 1 -1 4])
          title('Exact Earth Frame - Precession and Absolute Frame , Movie')
          xlabel('x')
          ylabel('y')
          pause(0.2)
          hold on 
          plot3(0, yaf(i), 3,'r*')
      end
      hold off
end
end
