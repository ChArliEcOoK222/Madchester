(
SynthDef(\syncedLoop, {
    |buf, rate = 1, amp = 0.8|
    var sig = PlayBuf.ar(1, buf, BufRateScale.kr(buf) * rate, loop: 1);
    sig = sig * amp;
    Out.ar(0, sig.dup);
}).add;
)

(
s.waitForBoot {
	~bpm = 116;
    ~beats = 16;
    ~beatDur = 60 / ~bpm;
    ~targetDur = ~beats * ~beatDur;

	~drums = Buffer.read(s, "", action: {
		~rate = ~drums.duration / ~targetDur;
		Synth(\syncedLoop, [\buf, ~drums, \rate, 1, \amp, 0.7]);
	});

	~guitar = Buffer.read(s, "", action: {
		~rate = ~guitar.duration / ~targetDur;
		Synth(\syncedLoop, [\buf, ~guitar, \rate, 1, \amp, 0.7]);
	});

	~piano = Buffer.read(s, "", action: {
		~rate = ~piano.duration / ~targetDur;
		Synth(\syncedLoop, [\buf, ~piano, \rate, 1, \amp, 0.7]);
	});

	~vocals = Buffer.read(s, "", action: {
		~rate = ~vocals.duration / ~targetDur;
		Synth(\syncedLoop, [\buf, ~vocals, \rate, 1, \amp, 0.7]);
	});
};
)