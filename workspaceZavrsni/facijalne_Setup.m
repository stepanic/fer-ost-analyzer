i1 = find(facialTime>stimuli.start(1),1)
i2 = find(facialTime>stimuli.start(2),1)
i3 = find(facialTime>stimuli.start(3),1)
i4 = find(facialTime>stimuli.start(4),1)
i4e = find(facialTime>stimuli.stop(4),1) - 1
i5 = find(facialTime>stimuli.start(5),1)
i5e = find(facialTime>stimuli.stop(5), 1) - 1

t1 = facialTime(i1:i2-1)
t2 = facialTime(i2:i3-1)
t3 = facialTime(i3:i4-1)
t4 = facialTime(i4:i4e)
t5 = facialTime(i5:i5e)

t1 = t1-t1(1)
t2 = t2-t1(1)
t3 = t3-t1(1)
t4 = t4-t1(1)
t5 = t5-t1(1)
c = length(t1) + length(t2) + length(t3) + length(t4) + length(t5)