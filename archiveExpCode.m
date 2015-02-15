%%
%   archiveExpCode(expNum)
%
%   Saves the calling script to the data directory. Filename is:
%
%   /dataDirectory/YYMMDD/Exp_expNum.m
%
%%
function archiveExpCode(exptInfo)
 
    % Make numbers strings
    eNum = num2str(exptInfo.expNum,'%03d');
    fNum = num2str(exptInfo.flyNum,'%03d');
    cNum = num2str(exptInfo.cellNum,'%03d');
    cENum = num2str(exptInfo.cellExpNum,'%03d');
    
    [~, path] = getDataFileName(exptInfo);
    scriptFileName = [path,exptInfo.prefixCode,'_expNum',eNum,...
        '_flyNum',fNum,'_cellNum',cNum,'_cellExpNum',cENum,'_stimSetCode.m'];

    % Make a copy of the the source m-file
    if ~isdir(path)
        mkdir(path);
    end

    [ST,I] = dbstack();
    copyfile(which(ST(2).name),scriptFileName);
    disp(['Archived ',ST(2).file,' to ',scriptFileName]);

end