jL = jitterLocal(:,2);

%Ovo je za zadatak 2 prvi graf
jL_b1 = jL(floor(100*(stimuli.start(1)-0.19)) : floor(100*(stimuli.stop(1)-0.19)));
jL_n1 = jL(floor(100*(stimuli.start(2)-0.19)) : floor(100*(stimuli.stop(2)-0.19)));
jL_s = jL(floor(100*(stimuli.start(3)-0.19)) : floor(100*(stimuli.stop(3)-0.19)));
jL_n2 = jL(floor(100*(stimuli.start(4)-0.19)) : floor(100*(stimuli.stop(4)-0.19)));
jL_b2 = jL(floor(100*(stimuli.start(5)-0.19)) : floor(100*(stimuli.stop(5)-0.19)));

%Ovo je za zadatak 2 drugi graf
