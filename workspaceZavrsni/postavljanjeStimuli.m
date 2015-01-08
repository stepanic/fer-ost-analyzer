stimuli.class(1) = 1;
stimuli.class(2) = 2;
stimuli.class(3) = 3;
stimuli.class(4) = 4;
stimuli.class(5) = 5;


stimuli.start(1) = indexParser(1,ts);
stimuli.stop(1) = indexParser(3,ts);
stimuli.start(2) = indexParser(2,ts);
stimuli.stop(2) = indexParser(32,ts);
stimuli.start(3) = indexParser(33,ts);
stimuli.stop(3) = indexParser(50,ts);
stimuli.start(4) = indexParser(51,ts);
stimuli.stop(4) = indexParser(80,ts);
stimuli.start(5) = indexParser(83,ts);
stimuli.stop(5) = indexParser(84,ts);

stimuli.number = 5;

stimuli.duration(1) = stimuli.stop(1) - stimuli.start(1);
stimuli.duration(2) = stimuli.stop(2) - stimuli.start(2);
stimuli.duration(3) = stimuli.stop(3) - stimuli.start(3);
stimuli.duration(4) = stimuli.stop(4) - stimuli.start(4);
stimuli.duration(5) = stimuli.stop(5) - stimuli.start(5);