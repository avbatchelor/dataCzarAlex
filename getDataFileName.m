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
function [fullFileName, path, trialNum, idString] = getDataFileName(exptInfo)

    prefixCode  = exptInfo.prefixCode;
    expNum      = exptInfo.expNum; 
    flyNum      = exptInfo.flyNum;
    flyExpNum   = exptInfo.flyExpNum;
    
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
    
    idString = [dNum,'_',prefixCode,'_expNum',eNum,...
        '_flyNum',fNum,'_flyExpNum',fENum,'_'];
    
    % Determine trial number 
    trialNum = 1;
    while( size(dir([path,fileNamePreamble,num2str(trialNum,'%03d'),'.mat']),1) > 0)
        trialNum = trialNum + 1;
    end
    
    % Put together full file name 
    fullFileName = [path,fileNamePreamble,num2str(trialNum,'%03d'),'.mat'];