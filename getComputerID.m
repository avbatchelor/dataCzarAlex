function computer = getComputerID

[~, out] = dos('vol');
sc = strsplit(out,'\n');
computerID = sc{2}(end-8:end);

if strcmp(computerID,'26C4-771F')
    computer = 'behavior';
elseif strcmp(computerID,'F83B-4090')
    computer = 'desktop';
elseif strcmp(computerID,'164E-5029')
    computer = 'laptop';
end