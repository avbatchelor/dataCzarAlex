%%
%   [fullFileName, path] =  getDataFileName(prefixCode, expNum)
%
%   Returns the path and the path\fileName in which to store data. Format is:
%
%   path: \dataDirectory\prefixCode\expNum\YYMMDD\flyNum\flyExpNum\
%   filename: prefixCode_expNum_YYMMDD_flyNum_flyExpNum_nextSequentialNumber.mat
%       
%
%   JSB 3\22\2013
%%
function [fullFileName, path] = getDataFileName(prefixCode, expNum, flyNum, flyExpNum)

    microCzarSettings;   % Loads settings
  
    % Make numbers strings
    dNum = datestr(now,'YYmmDD');
    eNum = num2str(expNum,'%03d');
    fNum = num2str(flyNum,'%03d');
    fENum = num2str(flyExpNum,'%03d');
    
    % Put together path name and fileNamePreamble  
    path = [dataDirectory,prefixCode,'\expNum',eNum,...
        '\flyNum',fNum,'\flyExpNum',fENum,'\'];
        
    fileNamePreamble = [dNum,'_',prefixCode,'_expNum',eNum,...
        '_flyNum',fNum,'_flyExpNum',fENum,'_trial'];
    
    % Determine trial number 
    trialN = 1;
    while( size(dir([path,fileNamePreamble,num2str(trialN,'%03d'),'.mat']),1) > 0)
        trialN = trialN + 1;
    end
    
    % Put together full file name 
    fullFileName = [path,fileNamePreamble,num2str(trialN,'%03d'),'.mat'];