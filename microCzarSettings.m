% microCzarSettings.m

dataDirectory = 'C:\Users\Alex\My Documents\Data\';
backupLocation = 'orch:~/Data/';
backupScript  = ['rsync -rite ssh ''/cygdrive/c/Users/Alex/My Documents/Data/'' ',backupLocation];