%%
%   archiveExpCode(expNum)
%
%   Saves the calling script to the data directory. Filename is:
%
%   /dataDirectory/YYMMDD/Exp_expNum.m
%
%%
function archiveExpCode(prefixCode,expNum,flyNum,flyExpNum)
 
    % Make numbers strings
    dNum = datestr(now,'YYmmDD');
    eNum = num2str(expNum,'%03d');
    fNum = num2str(flyNum,'%03d');
    fENum = num2str(flyExpNum,'%03d');
    
    [~, path] = getDataFileName(prefixCode, expNum, flyNum, flyExpNum);
    scriptFileName = [path,dNum,'_',prefixCode,'_expNum',eNum,...
        '_flyNum',fNum,'_flyExpNum',fENum,'_script.m'];

    % Make a copy of the the source m-file
    if ~isdir(path)
        mkdir(path);
    end

    [ST,I] = dbstack();
    copyfile(which(ST(2).name),scriptFileName);
    disp(['Archived ',ST(2).file,' to ',scriptFileName]);

end