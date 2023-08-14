function TestSphereWorldNav(map, goal, k, lambda, points)
% TESTSPHEREWORLD
% Test function for MAE 4180/5180, CS 4758/5758, ECE 4180/5772 Homework 6. 
% Plots the navigation function.
%
%       INPUTS:
%           map         map of the environment defined by circles.
%                       k x 3 matrix [x_center y_center radius]
%           goal        goal point
%                       1 x 2 array [x_goal y_goal]
%           k           scaling factor for the attractive force.
%           lambda      scaling factor for the inverse repulsive force.
%           points      list of points to be evaluate
%                       n x 2 matrix [x, y]
%           
%                       
%       OUTPUTS:
%           none
%       Figures Created:
%           Figure 1    Navigation function 
%
% Autonomous Mobile Robots
% 

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%       NAVIGATION FUNCTION
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% STUDENTS: Call the function navigationPlot to generate the navigation
% function plot in the specified points

%END

navigationPlot(map, goal, k, lambda, points)
end
