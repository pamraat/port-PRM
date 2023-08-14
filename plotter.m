clear

%% Build PRM function
% hw6b = readmatrix("hw6b.txt")';
% lim = [0 0 100 100];
% n = 10;
% robotRad = 0.2;
% % f = @(n, map) unifSample(n , map);
% % f = @(n, map) lowDispersion(n , map);
% f = @(n, map) lowDiscrepancy(n, map);
% [G, nodes] = buildPRM(hw6b, n, f, robotRad, lim);
% % [G, nodes] = visibilityPRM(hw6b, n, robotRad, lim);
% [~, map] = cellDecomposition(hw6b, lim);
% hold on
% for i = 1:size(map, 1)
%     plot([map(i, 1) map(i, 3)], [map(i, 2) map(i, 4)], LineWidth=1, Color='black');
% end
% p1 = plot(G, 'XData', nodes(:, 1), 'YData', nodes(:, 2), 'LineWidth', 1, 'EdgeColor','blue');
% legend(p1, 'Graph');
% hold off
% title("Low Discrepancy Sampling Probabilistic Roadmap", "Interpreter","tex");
% xlabel("X (m)");
% ylabel("Y (m)");
% fontsize(gca,14,"points");
% set(gcf, 'Position',  [400, 150, 600, 500]);

%% Init and Goal for Build PRM
% hw6b = readmatrix("hw6b.txt")';
% lim = [0 0 100 100];
% n = 100;
% robotRad = 0.2;
% init = [20, 65]; goal = [90, 10];
% % f = @(n, map) unifSample(n , map);
% % f = @(n, map) lowDispersion(n , map);
% f = @(n, map) lowDiscrepancy(n, map);
% [G, nodes] = buildPRM(hw6b, n, f, robotRad, lim, init, goal);
% % [G, nodes] = visibilityPRM(hw6b, n, robotRad, lim, init, goal);
% wayPoints = nodes(shortestpath(G, size(nodes, 1) - 1, size(nodes, 1)), :);
% [~, map] = cellDecomposition(hw6b, lim);
% hold on
% for i = 1:size(map, 1)
%     plot([map(i, 1) map(i, 3)], [map(i, 2) map(i, 4)], LineWidth=1, Color='black');
% end
% p1 = plot(G, 'XData', nodes(:, 1), 'YData', nodes(:, 2), 'LineWidth', 1, 'EdgeColor','blue');
% if ~isempty(wayPoints)
%     p2 = plot(wayPoints(:, 1), wayPoints(:, 2), LineWidth=1, Color='green');
%     p3 = scatter(wayPoints(1, 1), wayPoints(1, 2), 'Marker', 'square', 'MarkerFaceColor', [0.4940 0.1840 0.5560]);
%     p4 = scatter(wayPoints(2:end-1, 1), wayPoints(2:end-1, 2), 'filled', 'MarkerFaceColor','magenta');
%     p5 = scatter(wayPoints(end, 1), wayPoints(end, 2), 'Marker', 'diamond', 'MarkerFaceColor', 'cyan');
%     legend([p1 p2 p4 p3 p5], 'Graph', 'Path', 'Intermediate Nodes', 'Intial Point', 'Goal');
% else
%     p3 = scatter(nodes(end - 1, 1), nodes(end - 1, 2), 'Marker', 'square', 'MarkerFaceColor', [0.4940 0.1840 0.5560]);
%     p5 = scatter(nodes(end, 1), nodes(end, 2), 'Marker', 'diamond', 'MarkerFaceColor', 'cyan');
%     legend([p1 p3 p5], 'Graph', 'Intial Point', 'Goal');
% end
% hold off
% title("Probabilistic Roadmap", "Interpreter","tex");
% xlabel("X (m)");
% ylabel("Y (m)");
% fontsize(gca,14,"points");
% set(gcf, 'Position',  [400, 150, 600, 500]);

%% Test PRM
% hw6b = readmatrix("hw6b.txt")';
% lim = [0 0 100 100];
% n = 20;
% init = [20, 65]; goal = [90, 10];
% TestPRM(hw6b,lim,n,init,goal)

%% Navigation Plot
% hw6Sphere = readmatrix("hw6Sphere.txt");
% goal = [30 40];
% k = 2;
% lambda = 10;
% x = linspace(10, 90, 200)';
% y = linspace(10, 90, 200)';
% navigationPlot(hw6Sphere, goal, k, lambda, [x y]);

%% Navigation Trajectory
% hw6Sphere = readmatrix("hw6Sphere.txt");
% goal = [30 40];
% k = 2;
% lambda = 1e-10;
% pos(1, :) = [80 55];
% dt = 0.1;
% 
% x = linspace(10, 90, 200);
% y = linspace(10, 90, 200);
% X = repmat(x, 1, length(y))'; Y = repelem(y, 1, length(x))';
% for i = 1:length(X)
%     U(i, 1) = spherePoint(hw6Sphere, goal, [X(i) Y(i)], k, lambda);
% end
% XGrid = reshape(X, length(x), length(y))';
% YGrid = reshape(Y, length(x), length(y))';
% U = reshape(U, length(x), length(y))';
% [gradUX, gradUY] = gradient(U);
% 
% while norm(pos(end, :) - goal) > 1e-2
%     k = dsearchn([X Y], pos(end, :)); ind1 = find(XGrid == X(k), 1); ind2 = find(YGrid == Y(k), 1);
%     grad_U = [gradUX(ind1) gradUY(ind2)];
%     pos(end + 1, :) = pos(end, :) - grad_U*dt;
% end
% 
% hold on
% for i=1:size(hw6Sphere, 1)
%     circle([hw6Sphere(i, 1) hw6Sphere(i, 2)], hw6Sphere(i, 3), 1000, {'LineWidth', 1, 'LineStyle', '-', 'Color', 'black'});
% end
% plot(pos(:, 1), pos(:,2), 'LineWidth', 1, 'Color', 'red');
% legend('Trajectory using Potential')
% hold off
% title("Robot Trajectory in Sphere World", "Interpreter","tex");
% xlabel("X (m)");
% ylabel("Y (m)");
% xlim([0 100])
% ylim([0 100])
% fontsize(gca,14,"points");
% set(gcf, 'Position',  [400, 150, 600, 500]);