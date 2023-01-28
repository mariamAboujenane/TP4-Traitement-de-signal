clear all
close all
clc

%qst 1
[music, fs] = audioread('test.wav');
%sound(music,fs);
music = music';
N=length(music);
te = 1/fs;
t = (0:N-1)*te;
N = length(music);

f = (0:N-1)*(fs/N);
fshift = (-N/2:N/2-1)*(fs/N);

spectre_music = fft(music);
subplot(2,1,1)
plot(t, music)
 title('le signal de musique :');
subplot(2,1,2)
plot(fshift,fftshift(abs(spectre_music)));
title('le spectre de musique:');


%%

k = 1;
fc = 4500;
%la transmitance complexe 
h = k./(1+1j*(f/fc));

h_filter = [h(1:floor(N/2)), flip(h(1:floor(N/2)))];
y_filtr = spectre_music(1:end-1).*h_filter;
sig_filtred= ifft(y_filtr,"symmetric");
semilogx(f(1:floor(N/2)),abs( h(1:floor(N/2))),'linewidth',1.5)
title('le gain =10 :');
%%
plot(fshift(1:end-1),fftshift(abs(fft(sig_filtred))));
%sound(sig_filtred,fs);
title('le spectre du signal filtré:');


%%
%qst2
k = 10;
fc = 4500;
%la transmitance complexe 
h = k./(1+1j*(f/fc));

h_filter = [h(1:floor(N/2)), flip(h(1:floor(N/2)))];
y_filtr = spectre_music(1:end-1).*h_filter;
sig_filtred= ifft(y_filtr,"symmetric");
semilogx(f(1:floor(N/2)),abs( h(1:floor(N/2))),'linewidth',1.5)
title('le gain =10 :');
%%

plot(fshift(1:end-1),fftshift(abs(fft(sig_filtred))));
%sound(sig_filtred,fs);
title('le spectre du signal filtré:');


%%
%   qst 4
k = 10;
fc = 4500;
%la transmitance complexe 
h = k./(1+1j*(f/fc).^100);

h_filter = [h(1:floor(N/2)), flip(h(1:floor(N/2)))];
y_filtr = spectre_music(1:end-1).*h_filter;
sig_filtred= ifft(y_filtr,"symmetric");
semilogx(f(1:floor(N/2)),abs( h(1:floor(N/2))),'linewidth',1.5)
title('le gain =10  et ordre=100 :');
%%
plot(fshift(1:end-1),fftshift(abs(fft(sig_filtred))));
%sound(sig_filtred,fs);
title('le spectre du signal filtré pour ordre=100:');