clear all 
close all 
clc




%%
%Definition des variables et de signal 
te = 1e-4 ;
fe = 1/te ;
t = 0:te:5-te ;
x = sin(2*pi*500*t)+ sin(2*pi*400*t)+ sin(2*pi* 50*t) ;
N = length(x);
f = (0:N-1)*(fe/N);
fshift = (-N/2:(N/2)-1)*fe/N;

%%
%Definition de la fonction xt 
 y = fft(x);
 subplot(2,1,1)
 plot(t,x)
 title('le signal x(t):');
 subplot(2,1,2)
 plot(fshift, fftshift(abs(y)/N)*2);
 title('le spectre x(f):');

 %%
 te =5e-4 ;
 y = fft(x);
 subplot(2,1,1)
 plot(t,x)
 title('le signal x(t)pour te=0.0005 s:');
 subplot(2,1,2)
 plot(fshift, fftshift(abs(y)/N)*2);
 title('le spectre x(f) te=0.0005 s :');
 %%
 %Definition des variables et de signal 
te = 5e-4 ;
 y = fft(x);
 subplot(2,1,1)
 plot(t,x)
 title('le signal x(t):');
 subplot(2,1,2)
 plot(fshift, fftshift(abs(y)/N)*2);
 title('le spectre x(f):');

%%
%Definition de la fonction xt 
 y = fft(x);
 subplot(2,1,1)
 plot(t,x)
 title('le signal x(t):');
 subplot(2,1,2)
 plot(fshift, fftshift(abs(y)/N)*2);
 title('le spectre x(f):');

 
%%
% la fonction de transmittance 

K = 1 ;
f1=50;
f2=500;
f3=1000;

wc1=2*pi*f1;
wc2=2*pi*f2;
wc3=2*pi*f3;


w = 2*pi*f ; 

H1 = (K*1j*w/wc1)./(1+1j*w/wc1) ;
H2 = (K*1j*w/wc2)./(1+1j*w/wc2) ;
H3 = (K*1j*w/wc3)./(1+1j*w/wc3) ;
 
plot(f,abs(H1),'r')
xlabel('Fréquence (rad/s)');
ylabel('Module de H(f)');

%%
G1 = 20*log(abs(H1));
G2 = 20*log(abs(H2));
G3 = 20*log(abs(H3));

phi1 = angle(H1);
phi2 = angle(H2);
phi3 = angle(H3);



subplot(2,1,1) 
semilogx(f,G1,'g',f,G2,'r',f,G3,'b')
ylabel('Gain (dB)')
xlabel('Frequency (rad/s)')
title('Bode Diagram')
legend('fc = 200 rad/s', 'fc = 500 rad/s', 'fc = 1000 rad/s');
subplot(2,1,2) 
semilogx(f,phi1, 'g',f,phi2,'r',f,phi3,'b')
ylabel('Phase (deg)')
xlabel('Frequency (rad/s)')
grid on 

%%
yt1 = y.*H1 ;
yt2 = y.*H2 ;
yt3 = y.*H3 ;
YT1 = ifft(yt1,"symmetric");
YT2 = ifft(yt2,"symmetric");
YT3 = ifft(yt3,"symmetric");
YT1_temp = fft(YT1);
YT2_temp = fft(YT2);
YT3_temp = fft(YT3);
subplot(2,2,1) 
plot(fshift,2*fftshift(abs(y))/N);
xlabel('Fréquence (rad/s)');
title('spectre d amplitude');
subplot(2,2,2)
plot(fshift,2*fftshift(abs(YT1_temp))/N,'b');
xlabel('Fréquence (rad/s)');
title('spectre filtré pour fc=200rad/s');
subplot(2,2,3)
plot(fshift,2*fftshift(abs(YT2_temp))/N,'g');
xlabel('Fréquence (rad/s)');
title('spectre filtré pour fc=500rad/s');
subplot(2,2,4)
plot(fshift,2*fftshift(abs(YT3_temp))/N,'r');
xlabel('Fréquence (rad/s)');
title('spectre filtré pour fc=1000rad/s');

%%
K = 1 ;
f_choisie=1000;
wc_choisie=2*pi*f_choisie;
w = 2*pi*f ; 
H = (K*1j*w/wc_choisie)./(1+1j*w/wc_choisie) ;
subplot(2,1,1)
plot(f,abs(H),'r')
xlabel('Fréquence (rad/s)');
ylabel('Module de H(f)');
subplot(2,1,2)
yt = y.*H ;
YT = ifft(yt,"symmetric");
YT_temp = fft(YT);
plot(fshift,2*fftshift(abs(YT_temp))/N,'b');
xlabel('Fréquence (rad/s)');
title('spectre filtré pour fc=1000rad/s');

%%
 subplot(2,2,1)
 plot(t,x)
 title('le signal x(t):');
 subplot(2,2,2)
 plot(t,YT);
 title('le signal x(t) filtré:');
 subplot(2,2,3)
 plot(fshift, fftshift(abs(y)/N)*2);
 title('le spectre x(f):');
 subplot(2,2,4)
plot(fshift,2*fftshift(abs(YT_temp))/N,'b');
xlabel('Fréquence (rad/s)');
title('spectre filtré pour fc=1000rad/s');