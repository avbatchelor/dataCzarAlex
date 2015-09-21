% microCzarSettings.m

dataDirectory = 'C:\Users\Alex\My Documents\Data\ephysData\';
backupLocation = 'orch:~/Data/';
backupScript  = ['rsync -rite ssh ''/cygdrive/c/Users/Alex/My Documents/Data/'' ',backupLocation];