function rootDir= initPath(rootDir)
% Initialize the directory path for the MR Tutorial files

if ~exist('rootDir','var') || isempty(rootDir)
    rootDir = mrTeachRootPath;
end
addpath(genpath(rootDir));

cd(rootDir);

return
