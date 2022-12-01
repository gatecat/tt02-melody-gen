import numpy as np
from scipy.io.wavfile import write

samples = []
with open("samples.txt", "r") as f:
	for line in f:
		if len(line.strip()) == 0:
			continue
		samples.append(-2000 + 4000 * int(line))

rate = 6250
write('test.wav', rate, np.int16(samples))
