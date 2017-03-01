function makeBackup()

    microCzarSettings;
    
    for i = 1:length(backupScript)
        disp(['Backuping up using: ',backupScript{i}]);
        system(backupScript{i},'-echo');
    end
    
end