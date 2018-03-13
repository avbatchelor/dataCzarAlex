% microCzarSettings.m

% backupLocation = 'orch:~/Data/';
% backupScript  = ['rsync -rite ssh ''/cygdrive/c/Users/Alex/My Documents/Data/'' ',backupLocation];

computer = getComputerID;

if strcmp(computer,'desktop')
%     % Backup raw data without removing deleted files from server
%     backupScript{1} = 'robocopy d:\otherData\DataD z:\DataD-copy /fft /e';
% 
%     % Backup processed data and remove deleted files from server - since
%     % processed files may be updated 
%     backupScript{2} = 'robocopy d:\otherData\ProcessedDataD z:\ProcessedDataD-copy /fft /mir';
    

    % /fft = Assume FAT File Times (2-second granularity).
    % /e Copy subdirectories, including Empty ones.
    % /NDL No Directory List - don't log directory names.
    % /nc No Class - don't log file classes.
    % /ns No Size - don't log file sizes.
    % /np No Progress - don't display percentage copied.
    % /mir MIRror a directory tree (equivalent to /E plus /PURGE).

    % Move behavior data on server to lab desktop
    backupScript{1} = 'robocopy z:\ManuscriptData\rawData d:\ManuscriptData\rawData /fft /e /NDL /nc /ns /np';
    
    % Backup processed behavior data on lab desktop to server
    backupScript{2} = 'robocopy d:\ManuscriptData\processedData z:\ManuscriptData\processedData /fft /e /NDL /nc /ns /np /xo';
    
     % Backup processed behavior data on server to lab desktop 
    backupScript{3} = 'robocopy z:\ManuscriptData\processedData d:\ManuscriptData\processedData /fft /e /NDL /nc /ns /np /xo';
elseif strcmp(computer,'behavior')
    % Backup raw data without removing deleted files from server
    backupScript{1} = 'robocopy C:\Users\Alex\Documents\Data\ballData z:\ManuscriptData\rawData /fft /e';

    % Backup processed data and remove deleted files from server - since
    % processed files may be updated 
    backupScript{2} = 'robocopy C:\Users\Alex\Documents\ProcessedData\ballData z:\ManuscriptData\processedData /fft';
elseif strcmp(computer,'laptop')
    backupScript{1} = 'robocopy z:\ManuscriptData\processedData C:\ManuscriptData\processedData /fft /e /NDL /nc /ns /np /xo';
end 

