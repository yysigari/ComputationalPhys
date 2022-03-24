% Classsical Scattering
%
%Program to explore classical scattering
%where in 3 cases the cross section is the same
%
clear all;
help classical_scattering
%clear memory and print header
%
fprintf('All three scattering have the total same cross section \n')
%
iloop=0;
%
b = linspace(0,1.0); %impact parameter
a = 1; %All results have sigma = pi*a^2
%
%hard sphere, radius a
% barrier V0 with E=2V0
% n = sqrt(1-V0./E), b0 = n/a
n = sqrt(1+0.5);
b0 = n .*a;
nw = sqrt(1+0.5);
%
for i = 1:length(b)
    th_hs(i) = 0;
    if b(i) < a
        th_hs(i) = pi - 2.0 .*asin(b(i) ./a);
    end
    %
    th_bar(i)=0;
    if b(i) <b0
        th_bar(i) = 2.0 .* (asin(b(i) ./(n.*a)) - asin(b(i) ./a));
    end
    %
    if b(i) > b0 && b(i) <a
        th_bar(i) = pi - 2.0 .* asin(b(i)./a);
    end
    %
    th_well(i) = 0;
    if b(i) < a
        th_well(i) = -2.0.*(asin(b(i)./(nw.*a)) -asin(b(i)./a));
    end
    %
end
%
iloop = iloop +1;
figure(iloop)
plot(b, th_hs,'-b',b,th_bar,':r',b,th_well,'-.g')
title('Scattering Angle for three Scattering centers')
xlabel('b/a')
ylabel('\theta')
legend('Hard Sphere', 'Barrier','Well')
%

