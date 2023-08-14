function TestPRM(map,mapBoundary,n_PRM,q_start,q_goal)
% Test function for MAE 4180/5180, CS 4758/5758, ECE 4180/5772 HW 6 Extra Credit
%
%       INPUTS:
%           map         	  file name for text file representing the obstacles in the workspace
%                             for example workspace = 'hw6b.txt'. Each row in this file contains the vertices
%                             of one polygonal obstacle: v1x, v1y, v2x, v2y, etc. The vertices are given in
%                             counterclockwise order. If an obstacle has fewer vertices, unused entries 
%                             in the line will contain the value zero
%           mapBoundary       1 x 4 vector capturing the [x_bl y_bl x_tr y_tr] coordinates of the bottom left 
%                             and top right corner of the workspace respectively  
%           n_PRM             number of vertices in the PRM     
%           q_start 		  1x2 array [x y],vector of start point 
%           q_goal            1x2 array [x y],vector of goal point 
%       OUTPUTS:
%           plot of the PRM and path between start to goal
% BUILDPRM
% AMR Homework 6 
%
%       INPUTS:
%           workspace         file name for text file representing the obstacles in the workspace
%                             for example workspace = 'hw6b.txt'. Each row in this file contains the vertices
%                             of one polygonal obstacle: v1x, v1y, v2x, v2y, etc. The vertices are given in
%                             counterclockwise order. If an obstacle has fewer vertices, unused entries 
%                             in the line will contain the value zero
%           mapBoundary       1 x 4 vector capturing the [x_bl y_bl x_tr y_tr] coordinates of the bottom left 
%                             and top right corner of the workspace respectively  
%           n                 number of vertices in the roadmap     
%       OUTPUTS:
%           nodes           m x 2, nodes of the PRM
%           edges           n x 4 array, edges of the PRM 
%                           (each row contains the coordinates of the vertices forming the edge)
% Autonomous Mobile Robots
    robotRad = 0.2;
    f = @(n, map) lowDispersion(n , map);
    [G, nodes] = buildPRM(map, n_PRM, f, robotRad, mapBoundary, q_start, q_goal);
%     edges = [nodes(G.Edges.EndNodes(:, 1), :) nodes(G.Edges.EndNodes(:, 2), :)];
%     path = shortestpath(G, size(nodes, 1) - 1, size(nodes, 1));
%     if ~isempty(path)
%         nodes = nodes(path, :); path = repelem(path, 2); path(1) = []; path(end) = [];path = reshape(path', 2, length(path)/2)';
%         edges = [nodes(path(:, 1), :) nodes(path(:, 2), :)]; 
%     end
    wayPoints = nodes(shortestpath(G, size(nodes, 1) - 1, size(nodes, 1)), :);
    [~, map] = cellDecomposition(map, mapBoundary);
    hold on
    for i = 1:size(map, 1)
        plot([map(i, 1) map(i, 3)], [map(i, 2) map(i, 4)], LineWidth=1, Color='black');
    end
    p1 = plot(G, 'XData', nodes(:, 1), 'YData', nodes(:, 2), 'LineWidth', 1, 'EdgeColor','blue');
    if ~isempty(wayPoints)
        p2 = plot(wayPoints(:, 1), wayPoints(:, 2), LineWidth=1, Color='green');
        p3 = scatter(wayPoints(1, 1), wayPoints(1, 2), 'Marker', 'square', 'MarkerFaceColor', [0.4940 0.1840 0.5560]);
        p4 = scatter(wayPoints(2:end-1, 1), wayPoints(2:end-1, 2), 'filled', 'MarkerFaceColor','magenta');
        p5 = scatter(wayPoints(end, 1), wayPoints(end, 2), 'Marker', 'diamond', 'MarkerFaceColor', 'cyan');
        legend([p1 p2 p4 p3 p5], 'Graph', 'Path', 'Intermediate Nodes', 'Intial Point', 'Goal');
    else
        legend(p1, 'Graph');
    end
    hold off
    title("Probabilistic Roadmap", "Interpreter","tex");
    xlabel("X (m)");
    ylabel("Y (m)");
    fontsize(gca,14,"points");
    set(gcf, 'Position',  [400, 150, 600, 500]);
end