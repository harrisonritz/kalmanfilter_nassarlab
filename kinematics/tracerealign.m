function S=tracerealign(T,align,at);
% function S=tracerealign(T,align,at);
% returns a realigned version of the timeseries in T
% the point align(i) is shifted to at
% T: NxT matrix of N timeseries
% align: N*1 vector of align times
% at: scalar

S=T.*NaN;
len=size(T,2);
for i=1:size(T,1)
    if (~isnan(align(i)))
        shift=at-align(i);
        if (shift<0)
            S(i,1:len+shift)=T(i,1-shift:end);
        elseif (shift>0)
            S(i,shift+1:end)=T(i,1:len-shift);
        else
            S(i,:)=T(i,:);
        end;
    end;
end;
