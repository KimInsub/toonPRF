% pRF toonotopy workflow 
% Original code from Dawn
% Modified by Insub 

%% enviornment setting
% cd /oak/stanford/groups/kalanit/biac2/kgs/projects/insub/toonPRF

% initialize
baseDir = initPath();

% clone Vistasoft from github
if ~exist('./vistasoft', 'dir')
    system('git clone https://github.com/vistalab/vistasoft.git')
end

addpath(genpath('./vistasoft')); % add vistasoft
addpath(genpath('/Users/insubkim/spm12'));

%% set path for data
cd(baseDir)
% set session information  
% baseDir='/oak/stanford/groups/kalanit/biac2/kgs/projects/psych224/';
expt    = '/data/subj02/';

% paramPath =fullfile('Stimuli','8bars_params.mat');
% imgPath = fullfile('Stimuli','8bars_images.mat');

anatSubjPth = fullfile('./3DAnatomy','t1.nii.gz');
setVAnatomyPath(anatSubjPth);

%% initialize session
pRF_init(baseDir, expt);

%% View stimulus
subjectDir=fullfile(baseDir,expt);
cd(subjectDir)

% stim = load('./Stimuli/8bars_images.mat');
% implay(stim.images,4)

toon_showStim('./Stimuli/','8bars_images.mat')

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
imgPath= 'Stimuli/8bars_images.mat';
paramPath = 'Stimuli/8bars_params.mat';
toon_prfRun(baseDir, expt, [], paramPath, imgPath)
