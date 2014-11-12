function makeBackup()

    microCzarSettings;
    
    disp(['Backuping up using: ',backupScript]);
    system(backupScript,'-echo');