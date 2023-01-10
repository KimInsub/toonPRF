 
% example script for runnign roiPrep
% KGS 2022

 baseDir ='/oak/stanford/groups/kalanit/biac2/kgs/projects/psych224/Toonotopy';
 expt    ='data/';
 sessions={'RJ09_190914_21289_time_04_1'};
 hems    =  {'rh'};
 ROIs    = {'V1', 'V2v', 'V2d', 'V3v', 'V3d'} % important - these should be in 'cleaning' order (e.g. voxels will be deleted in ROI #2 if the overlap with ROI #1, etc
 colors  =  {'k', 'b', 'b', 'g', 'g', 'y', 'm'} 
 combo   =  1 % toggle on/off - combining dorsal/ventral ROIs in retinotopy. will skip if irrelevant.
 currPre ='ToonRet_CSS_'; % prefix to use for loading ROIs (if you've already named them as 'toonRet_f_', etc); if they are just 'hem_ROI', leave this blank
 currPost ='_ad'; %leave blank if no suffix
% This will look for ROIs with this name structure:
% {currPre}{hemi}_{ROI}{currPost}; e.g., ToonRet_CSS_rh_V1_kgs.mat

 
% comment  struct for comment field information - session & anat will be auto-filled, can add comment.name and comment.expt (i.e. 
comment.name = 'ad';
comment.expt = 'toonotopy pRF mapping';
newPre='cleaned_ToonRet_CSS_';

% This will generate cleaned ROIs with this naming structure
% {newPre}{hemi}_{ROI}{currPost}, e.g., cleaned_ToonRet_CSS_rh_V1_kgs.mat

roiPrep(baseDir, expt, sessions, hems, ROIs, colors, combo, currPre, currPost,comment,newPre);