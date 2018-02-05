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
    
    % Move behavior data on server to lab desktop
    backupScript{1} = 'robocopy z:\ManuscriptData\rawData d:\ManuscriptData\rawData /fft /e /NDL /nc /ns /np';

    % Backup processed behavior data on server to lab desktop 
    backupScript{2} = 'robocopy z:\ManuscriptData\processedData d:\ManuscriptData\processedData /fft /e /NDL /nc /ns /np';
elseif strcmp(computer,'behavior')
    % Backup raw data without removing deleted files from server
    backupScript{1} = 'robocopy C:\Users\Alex\Documents\Data z:\ManuscriptData\rawData /fft /e';

    % Backup processed data and remove deleted files from server - since
    % processed files may be updated 
    backupScript{2} = 'robocopy C:\Users\Alex\Documents\ProcessedData z:\ManuscriptData\processedData /fft /mir';
end 

