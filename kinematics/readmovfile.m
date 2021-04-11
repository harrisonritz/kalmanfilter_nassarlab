function A=readmovfile(fid)
% LOADTRIAL: loads a new trial from mov-file
% Synopsis
%		A=readmovfile(fid)
A=[];
line=fgetl(fid);
while line(1)~='T' & line(1)~='t' & ~feof(fid)
    a=sscanf(line,'%f');
   A=[A;a'];
   line=fgetl(fid);
end;

if (feof(fid))
    fclose(fid);
end;