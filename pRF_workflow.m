% pRF toonotopy workflow 
% Original code from Dawn
% Modified by Insub 

%% enviornment setting
% Insub: This should either be explained or deleted: DJC
% cd /oak/stanford/groups/kalanit/biac2/kgs/projects/insub/toonPRF
% addpath(genpath('/Users/insubkim/spm12'));


% initialize
baseDir = initPath();

% Vistasoft is the set of tools provided by Vistalab for analyzing MR images

% clone Vistasoft from github _if_ it isn't already in our path
if isempty(which('vistaRootPath')) && ~exist(fullfile('.','vistasoft'), 'dir')
    system('git clone https://github.com/vistalab/vistasoft.git')
    addpath(genpath(fullpath('.','vistasoft'))); % add vistasoft
end


%% set path for data
cd(baseDir)
% set session information  
% baseDir='/oak/stanford/groups/kalanit/biac2/kgs/projects/psych224/';
experimentData = fullfile('data','subj02');

% paramPath =fullfile('Stimuli','8bars_params.mat');
% imgPath = fullfile('Stimuli','8bars_images.mat');

anatSubjPth = fullfile('.','3DAnatomy','t1.nii.gz');
setVAnatomyPath(anatSubjPth);

%% initialize session
pRF_init(baseDir, experimentData);

%% View stimulus
subjectDir=fullfile(baseDir,experimentData);
cd(subjectDir)

% stim = load('./Stimuli/8bars_images.mat');
% implay(stim.images,4)

toon_showStim(fullfile('.','Stimuli','8bars_images.mat'))

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
imgPath= fullfile('Stimuli','8bars_images.mat');
paramPath = fullfile('Stimuli','8bars_params.mat');
toon_prfRun(baseDir, experimentData, [], paramPath, imgPath)
