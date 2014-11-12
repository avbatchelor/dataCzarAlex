% sampleUsage.m

experimentNumber = 7;
prefixCode = 'SampleExperiment';

archiveExpCode(experimentNumber);
fileName = getDataFileName(prefixCode, experimentNumber);
codeStampString = getCodeStamp();
makeBackup();


