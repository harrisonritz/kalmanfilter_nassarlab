function fid=openmvf(filename)
% OPENMVF: opens a movement-file and reads the first line("trial")
% Synopsis
%		fid=openmvf(filename)
% Description
%		filename: a string signifying the filename to be loaded
% 		fid: File-ID of the open file. Use loadtrial to get 
%		trial by trial into memory
fid=fopen(filename);
if (fid==-1)
    error(sprintf('could not find movement file: %s',filename));
end;
dummy=fgetl(fid);
