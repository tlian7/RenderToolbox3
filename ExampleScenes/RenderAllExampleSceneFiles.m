%%% RenderToolbox3 Copyright (c) 2012 The RenderToolbox3 Team.
%%% About Us://github.com/DavidBrainard/RenderToolbox3/wiki/About-Us
%%% RenderToolbox3 is released under the MIT License.  See LICENSE.txt.
%
% Render example scene files that were generated previously.
%
% @details
% This script is useful for rendering lots and lots of scene files that
% were generated previouslt with  GenerateAllExampleSceneFiles().  In some
% production settings, like  computer clusters, it's useful to have a
% top-level script that takes no arguments, like this one.  You should edit
% parameter values in this script to agree with your system.
%
% @details
% It should be possible to run this script from any machine, including one
% that does not have OpenGL support, or one that delegates to worker nodes
% that don't have OpenGL support.
%

clear;
clc;

% choose global RenderToolbox3 behavior
setpref('RenderToolbox3', 'isParallel', true);
setpref('RenderToolbox3', 'isDryRun', false);
setpref('RenderToolbox3', 'isReuseSceneFiles', true);

% dry run on example scenes puts scene files in tempFolder
outputRoot = '/home2/brainard/test/epic-scene-test';
outputName = '';
exampleFolder = '';
results = TestAllExampleScenes(outputRoot, outputName, exampleFolder);

% make results available for later review
resultsFile = fullfile(outputRoot, 'RenderAllExampleSceneFiles.mat');
save(resultsFile);
