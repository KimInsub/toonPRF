% pRF toonotopy workflow 
% Original code from Dawn
% Modified by Insub 

%% enviornment setting

% initialize the path to the experiment data
baseDir = initPath();

% Vistasoft is the set of tools provided by Vistalab for analyzing MR images
% clone from github _if_ it isn't already in our path
if isempty(which('vistaRootPath')) && ~exist(fullfile('.','vistasoft'), 'dir')
    system('git clone https://github.com/vistalab/vistasoft.git')
    addpath(genpath(fullpath('.','vistasoft'))); % add vistasoft to our path
end

%% set path for data
cd(baseDir)
% set session information  
experimentData = fullfile('data','subj02');
mainDataFile = '8bars_images.mat';

% Set the location of the 3D Anatomy file
anatSubjPth = fullfile('.','3DAnatomy','t1.nii.gz');
setVAnatomyPath(anatSubjPth);

%% initialize session
pRF_init(baseDir, experimentData);

%% View stimulus
subjectDir=fullfile(baseDir,experimentData);
cd(subjectDir)

% Show a frame-by-frame of the results of the experiment
toon_showStim(fullfile('.','Stimuli'), mainDataFile)

%% Quality check
cd(subjectDir)
mrVista
% Using GUI: click View -> mean map 
% check that functionals match Inplane anatomicals
% Best visualization: 
% threshold mean map by changing mapWinMin to be around (500 -1000)
% After checking close the GUI window


%% Align inplane anatomy to volume anatomy
rxAlign;

%% motion correction
toon_motionCorrect(baseDir, expt);

%% install segmentation, transform tSeries to Gray, and average time series
toon_2gray(baseDir, expt)

%% run CSS pRF model
imgPath= fullfile('Stimuli',mainDataFile);
paramPath = fullfile('Stimuli',mainDataFile);

toon_prfRun(baseDir, experimentData, [], paramPath, imgPath)
