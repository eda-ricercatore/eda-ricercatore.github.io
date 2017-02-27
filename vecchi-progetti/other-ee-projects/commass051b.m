function communications = commass051b% (sig, pr)
%COMMASS051 Determine the signal to noise ratio (SNR) of a frequency modulated (FM) signal
% sig: sig = 0 for a sinewave, and sig = 1 for a random signal
% pr: pr = 0 to plot and display graphs, and pr = 1 for modeling
% Base units are: MHz for frequency, krad for angular frequencies, dB for power,
% microseconds for sampling intervals, and V for voltage
%
% This is written by Zhiyang Ong, 1085011, for the MATLAB Assignment
% of Communications IV (2005), Adelaide University

% Increase the number of decimal places that are used in numerical calculations to avoid
% numerical ill-conditioning
format('long')

%%%%%%%%%%%%%%
% Specified parameters %%
%%%%%%%%%%%%%%
% Baseband bandwidth=15kHz
W=0.015;
% RF carrier amplitude = 1 V (peak)
A=1;
% Frequency deviation = 75 kHz
fd=0.075;
% Angular frequency deviation: \omega_d = 2*pi*fd
wd=2 * pi *fd;
% Noise spectral density, varied in steps of 1dB so that
% 10dB <= Pr/(No*W) = A^2/(2*No*W) <= 30 dB
No=0;
% Sampling frequency=360kHz
fs=0.36;
% Period between samples of the FM signal; sample interval
Ts=1/fs;
% Number of samples
N=100000;

%%%%%%%%%%%%%%%%%%
% Determined variables
% Time variable
t=(0:N-1)*Ts;
% Range of SNR_{db} values with increments of 1dB
snrdb = (10:30);
% Convert SNR in dB to ratio
snr = 10.^(0.1 * snrdb);
% Number of values in the range of SNR
snrlen=length(snr);
% Number of samples for the frequency response
numsample = 512;

%%%%%%%%%%%%%
% Process user input
pr=0;
sig=0;
%warning('off','last')
dispGraph=logical(pr);
signal=logical(sig);
%warning('on','last')

%%%%%%%%%%%%%%%%
% Digital filter design
%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Design of the digital filter H1 with a 3 dB bandwidth of 2kHz,
% which is based on the single pole analog filter
% 3 dB bandwidth of H1 = 2kHz
fd1=0.002;
% Angular 3 dB bandwidth of H1
wd1=2*pi*fd1;
% Determination of the 3 dB bandwidth for the single pole analog filter,
% which takes into account the effects of frequency warping [Ambardar 1999]
wa1=2*fs*tan(wd1*Ts/2);
% Get the non-angular 3 dB bandwidth for H1
fa1=wa1/(2*pi);
% Coefficients in the numerator of H1's transfer function
num1=wa1;
% Coefficients in the denominator of H1's transfer function
den1=[1 wa1];
% Convert the s-domain transfer function of the single-pole analog filter
% to its discrete equivalents using bilinear transformation
[num1d,den1d]=bilinear(num1,den1,fs);
% Determine the frequency response vector and its corresponding
% frequency vector for the digital filter
[h1,f] = freqz(num1d,den1d,numsample,fs);
% Determine the magnitude response of the filter H1
h1mag=20*log10(abs(h1));
% Bring this figure (to be created soon) to the foreground
figure(1);
% Plot magnitude response of the digital filter H1
% Display the response from -30 dB to 5 dB and its 3 dB bandwidth,
% which is on a frequency scale from 0 to180 kHz
plot(f*1000,h1mag,2,-3,'*r')
% Get the current limits of the axes
curlimits=axis;
% Set the limits for the x- and y-axis for the current axes
axis([curlimits(1) curlimits(2) -30 5])
title('Plot of the magnitude response of the digital filter H_1')
xlabel('Frequency (kHz)')
ylabel('10 \cdot log_{10} |H_1| (dB)')
grid on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Design of the digital filter H2 with a 3 dB bandwidth of 15kHz,
% which is based on the 5th order analog Butterworth filter
% The post-detection filter H4 is the same as H2
% 3 dB bandwidth of H2 = 15kHz
fd2=0.015;
% Angular 3 dB bandwidth of H2
wd2=2*pi*fd2;
% Determination of the 3 dB bandwidth for the 5th order analog Butterworth filter,
% which takes into account the effects of frequency warping [Ambardar 1999]
wa2=2*fs*tan(wd2*Ts/2);
% Get the non-angular 3 dB bandwidth for H2
fa2=wa2/(2*pi);
% Coefficients in the numerator of H2's transfer function
num2=wa2^5;
% Constants of the coefficient of the 1st and 4th order terms
% in the denominator of H2's transfer function
c14=1+sqrt(5);
% Constants of the coefficient of the 2nd and 3rd order terms
% in the denominator of H2's transfer function
c23=3+sqrt(5);
% Coefficients in the denominator of H2's transfer function
den2=[1 c14*wa2 c23*wa2^2 c23*wa2^3 c14*wa2^4 wa2^5];
% Convert the s-domain transfer function of the 5th order analog Butterworth filter
% to its discrete equivalents using bilinear transformation
[num2d,den2d]=bilinear(num2,den2,fs);
% Determine the frequency response vector and its corresponding
% frequency vector for the digital filter
[h2,f] = freqz(num2d,den2d,numsample,fs);
% Determine the magnitude response of the filter H2
h2mag=20*log10(abs(h2));
% Bring this figure (to be created soon) to the foreground
figure(2);
% Plot magnitude response of the digital filter H2,
% which is based on a 5th order analog Butterworth filter
% Display the response from -30 dB to 5 dB and its 3 dB bandwidth,
% which is on a frequency scale from 0 to180 kHz
plot(f*1000,h2mag,15,-3,'*r')
% Get the current limits of the axes
curlimits=axis;
% Set the limits for the x- and y-axis for the current axes
axis([curlimits(1) curlimits(2) -30 5])
title('Plot of the magnitude response of the digital filter H_2')
xlabel('Frequency (kHz)')
ylabel('10 \cdot log_{10} |H_2| (dB)')
grid on


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Design of the low pass digital filter H3 with a 3 dB bandwidth of 90kHz,
% which is based on the 5th order analog Butterworth filter
% The required RF bandwidth B is given by Carson's Rule
% B = 2(fd + W) = 2(75 kHz + 15 kHz) = 180 kHz
% [Proakis 2002, Carlson 2002, Stremler 1990, & Couch 1997]
% Since phasor representation of RF signals is used, the bandwidth is halved
% Hence, B = 90 kHz and fs = 4*B
% Phasors are used to simulate RF signals since simulating FM modulation
% with modulation onto an RF carrier frequency would be slow.
% This is due to the requirement of having a sampling frequency that is
% twice the carrier frequency so that sampling occurs at a frequency
% greater than the Nyquist sampling rate.
% [Proakis 2002, Carlson 2002, Stremler 1990, & Couch 1997]
% 3 dB bandwidth of H3 = B = 90kHz
fd3=0.090;
% Angular 3 dB bandwidth of H3
wd3=2*pi*fd3;
% Determination of the 3 dB bandwidth for the 5th order analog Butterworth filter,
% which takes into account the effects of frequency warping [Ambardar 1999]
wa3=2*fs*tan(wd3*Ts/2);
% Get the non-angular 3 dB bandwidth for H3
fa3=wa3/(2*pi);
% Coefficients in the numerator of H3's transfer function
num3=wa3^5;
% Constants of the coefficient of the 1st and 4th order terms
% in the denominator of H3's transfer function
c14=1+sqrt(5);
% Constants of the coefficient of the 2nd and 3rd order terms
% in the denominator of H3's transfer function
c23=3+sqrt(5);
% Coefficients in the denominator of H3's transfer function
den3=[1 c14*wa3 c23*wa3^2 c23*wa3^3 c14*wa3^4 wa3^5];
% Convert the s-domain transfer function of the 5th order analog Butterworth filter
% to its discrete equivalents using bilinear transformation
[num3d,den3d]=bilinear(num3,den3,fs);
% Determine the frequency response vector and its corresponding
% frequency vector for the digital filter
[h3,f] = freqz(num3d,den3d,numsample,fs);
% Determine the magnitude response of the filter H3
h3mag=20*log10(abs(h3));
% Bring this figure (to be created soon) to the foreground
figure(3);
% Plot magnitude response of the low pass digital filter H3,
% which is based on a 5th order analog Butterworth filter
% Display the response from -30 dB to 5 dB and its 3 dB bandwidth,
% which is on a frequency scale from 0 to180 kHz
plot(f*1000,h3mag,90,-3,'*r')
% Get the current limits of the axes
curlimits=axis;
% Set the limits for the x- and y-axis for the current axes
axis([curlimits(1) curlimits(2) -30 5])
title('Plot of the magnitude response of the low pass digital filter H_3')
xlabel('Frequency (kHz)')
ylabel('10 \cdot log_{10} |H_3| (dB)')
grid on

% Generate a frequency modulated (FM) signal for transmission
% in phasor form (without the carrier modulation operation)
% That is, the message signal m(t) is modfm
if signal == 0
    % Generating frequency modulated sinusoidal signal, mt_sin,
    % with a frequency of 0.002 MHz
    % This FM sinusoidal signal is normalized to |m(t)| < 1
    mt_sin = sin(2*pi*0.002*t);
    % Assign the sinusoid to the FM signal
    modfm = mt_sin;
else
    % Generating frequency modulated random signal, mt_rand, which is Gaussian white noise
    % Reset the normally distributed pseudo-random number generator to its initial state
    randn('state',0);
    % Generate independent Gaussian samples with unity variance and zero mean
    % to model Gaussian noise samples.
    mt_rand = randn(1,N);
    % Filter the random FM signal with the digital filter H1,
    % which has a 2 kHz 3 dB-bandwidth
    y1=filter(num1d,den1d,mt_rand);
    % Filter the random FM signal with the digital filter H2,
    % which has a 15 kHz 3 dB-bandwidth
    y2=filter(num2d,den2d,y1);
    % Normalize this FM sinusoidal signal to |m(t)| < 1 by scaling the filter ouput
    % Get the maximum sample value of y2
    y2max=max(y2);
    % Get the minimum sample value of y2
    y2min=-min(y2);
    % If the middle value of the minimum and maximum sample values is >=0
    if y2max >= y2min
        % Assign the noise samples to the FM signal and normalize the amplitude
        modfm = mt_rand/y2max;
    else
        % Assign the noise samples to the inverted FM signal and normalize the amplitude
        modfm = mt_rand/y2min;
    end
end

% Generate the reference FM signal, vref, coming out of the transmitter and channel
% in the absence of noise
% That is, the FM signal received in the absence of noise
% Duration of sample intervals of FM signal
klimit=N-1;
% Cumulative summation of message signal over time
summ(1)=0;
%modfm(5000)
for k=1:klimit
    summ(k+1)=summ(k) + modfm(k)*Ts;
    echo off;
end
echo on;
% Sample FM modulation signal as a zero-mean stationary,
% Gaussian process [Proakis 2002]
phi=2*pi*fd*Ts*summ;
%%%%%%%%%%%%%%%%%%%
% Reference signal, vref
vref=A*exp(phi*j);


%%%%%%%%%%%%%%%%%%%%
% Generate white noise that are added to the signal during modulation and transmission
% Generate random numbers with unit variance for n_c(t) and n_s(t)
% In-phase noise, n_c(t)
nc=randn(1,N);
% Quadrature noise, n_s(t)
ns=randn(1,N);
% Noise phasor
nt=nc+j*ns;

% Add noise to the FM signal (model additive noise in the transmission of the FM signal)
vo=vref+nt;

% Filter the received FM signal to obtain the pre-detection signal
ypre=filter(num3d,den3d,vo);
% Get its phase response
[ypremod,freqresp]=freqz(ypre,1,numsample);
% Phase of ypremod
phaseypre=angle(ypremod)*180/pi;
% Make the phase continuous
phaseypremod=unwrap(phaseypre);
% Determine the phase differences to approximate the instantaneous frequency
phasediff(1)=phaseypremod(1);
klimit=512-1;
for k=2:klimit
    phasediff(k)=phaseypremod(k) - phaseypremod(k-1);
end
% Demodulate the received FM signal in phasor form
% (without the carrier modulation operation)
vd=(1/(2*pi*fd*Ts))*phasediff;

% Post-detection filtering with the digital filter H4, which is equal to H2
ypost=filter(num2d,den2d,vd);
% Determine the power of the received post-detection output FM signal
Pr=20*log10(abs(ypost));
% Determine the signal to noise ratios (SNR) of the received FM signal
% For each SNR value,
for k=1:snrlen
    % Noise spectral density
    No=(1/(snr(k)*W))*Pr;
    
    % Determine the correlation of the received FM signal with the output signal
    % under noise free conditions    
    % Correlate ypost with vref
    for index=1:klimit
        corrvovref(index)=ypost(k)*vref(k);
    end
    % Correlate vref with itself
    for index=1:klimit
        corrvref(index)=vref(k)*vref(k);
    end
    % Estimate lambda to determine the signal and noise components at the output
    lambda=corrvovref./corrvref;
    % Determine the signal component at the output
    s0=lambda.*vref;
    % Determine the noise component at the output
    n0=ypost-s0;
    
    % Determine the SNR at the output
    s0n0=s0./n0;
    % Determine the SNR at the output in dB
    cursnrdB(k)=20*log10(abs(s0n0));
    
    % For SNR = 17dB
    if k == 8
        % Plot s_0(t) and n_0(t) for 0<=t<=10 ms
        % Determine the range of values for time
        time=(0:N-1)/10000;
        
        % Plot s0 and n0 against time for 0<=time<=10ms
        figure(4);
        subplot(2,1,1); plot(time,s0)
        title('Plot of the signal component at the output s_o(t) against time t')
        xlabel('time t (ms)')
        ylabel('s_o(t)')
        subplot(2,1,2); plot(time,n0)
        title('Plot of the noise component at the output n_o(t) against time t')
        xlabel('time t (ms)')
        ylabel('n_o(t)')
    end
end
    
% Plot SNR of the output in dB against Pr/NoW in dB
figure(5);
plot(snrdb,cursnrdB)
hold on
coeff=1/1.1530;
plot(snrdb,coeff*cursnrdB)
title('Plot of the output SNR_{dB} against \frac{P_r}{N_oW} in dB')
ylabel('output SNR_{dB}')
xlabel('\frac{P_r}{N_oW} in dB')
legend('output SNR','theoretical SNR')

disp('End of simulation')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Reference list:
% Ambardar, Ashok 1999, Analog and Digital Signal Processing, 2nd Edition,
% Brooks/Cole, Pacific Groove, CA, page 691
% Proakis, John G. & Salehi, Masoud 2002, Communication Systems Engineering,
% 2nd Edition, Prentice-Hall, Upper Saddle River, NJ, pages 10, 48, 107, 238, 494
% Carlson, A. Bruce, Crilly, Paul B., & Rutledge, Janet C. 2002, Communication
% Systems: An Introduction to Signals and Noise in Electrical Communication,
% 4th Edition, McGraw-Hill, Singapore, pages 201, 235-236
% Stremler, Ferrel G. 1990, Introduction to Communication Systems, 3rd Edition,
% Addison-Wesley, Reading, MA, pages 129, 313
% Couch (II), Leon W. 1997, Digital and Analog Communication Systems, 5th Edition,
% Prentice-Hall, NJ, pages 88, 317, 342
% Proakis, John G, Salehi, Masoud, & Bauch, Gerhard 2004, Contemporary
% Communication Systems Using MATLAB and Simulink, 2nd Edition,
% Thomson-Brooks/Cole, Toronto, Ontario, page 124-125, 127-128