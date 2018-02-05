% microCzarSettings.m

% backupLocation = 'orch:~/Data/';
% backupScript  = ['rsync -rite ssh ''/cygdrive/c/Users/Alex/My Documents/Data/'' ',backupLocation];

computer = getComputerID;

if strcmp(computer,'desktop')
    % Backup raw data without removing deleted files from server
    backupScript{1} = 'robocopy d:\otherData\DataD z:\DataD-copy /fft /e';

    % Backup processed data and remove deleted files from server - since
    % processed files may be updated 
    backupScript{2} = 'robocopy d:\otherData\ProcessedDataD z:\ProcessedDataD-copy /fft /mir';
    
    % 
elseif strcmp(computer,'behavior')
    % Backup raw data without removing deleted files from server
    backupScript{1} = 'robocopy C:\Users\Alex\Documents\Data z:\BehaviorData /fft /e';

    % Backup processed data and remove deleted files from server - since
    % processed files may be updated 
    backupScript{2} = 'robocopy C:\Users\Alex\Documents\ProcessedData z:\ProcessedBehaviorData /fft /mir';
end 

