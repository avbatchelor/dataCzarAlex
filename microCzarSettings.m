% microCzarSettings.m

% backupLocation = 'orch:~/Data/';
% backupScript  = ['rsync -rite ssh ''/cygdrive/c/Users/Alex/My Documents/Data/'' ',backupLocation];

% Backup raw data without removing deleted files from server
backupScript{1} = 'robocopy d:\DataD z:\DataD-copy /fft /e';

% Backup processed data and remove deleted files from server - since
% processed files may be updated 
backupScript{2} = 'robocopy d:\ProcessedDataD z:\ProcessedDataD-copy /fft /mir';

