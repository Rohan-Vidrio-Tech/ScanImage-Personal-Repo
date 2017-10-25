sampleRate = 1000000;                  % sample Rate in Hz
N = 5;
rise_slope_duration = 0.001;
fall_slope_duration = 0.001;
voltage_high_duration = 0.001;
voltage_low_duration = 0.001;
amplitude = 5;
waveform = [];

t_p1 = linspace(0,amplitude,rise_slope_duration*sampleRate);

t_p2 = linspace(amplitude,amplitude,voltage_high_duration*sampleRate);

t_p3 = linspace(amplitude,0,fall_slope_duration*sampleRate);

t_p4 = linspace(0.0,0.0,voltage_low_duration*sampleRate);

waveform = repmat([t_p1 t_p2 t_p3 t_p4 ],periods);

numberOfSamplesToWrite = length(waveform);    
plot(waveform);

hTask = dabs.ni.daqmx.Task('create analog output');
hTask.createAOVoltageChan('Dev1',1);
hTask.cfgSampClkTiming(sampleRate,'DAQmx_Val_FiniteSamps',numberOfSamplesToWrite);
hTask.cfgDigEdgeStartTrig('PFI1', 'DAQmx_Val_Rising');
hTask.cfgOutputBuffer(numberOfSamplesToWrite);
hTask.writeAnalogData(waveform');
hTask.start();
while ~hTask.isTaskDone()
pause(0.01);
end
delete(hTask);