%           OUTPUT
%       	header: Structure comprising information stored by ScanImage into TIF header
%       	Aout: MxNxCxFxSxV array, with images of size MxN for C channels, F frames, S slices, and V volumes. Default type is uint16. 
%       	imgInfo: Structure comprising basic information about the structure of the output array Aout
[header,Aout,imgInfo] = scanimage.util.opentif('C:\Users\rohan\Downloads\Run1_RF_Large_00001.tif')