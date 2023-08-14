function navigationPlot(map, goal, k, lambda, points)
    x = points(:, 1)'; y = points(:, 2)';
    X = repmat(x, 1, length(y))'; Y = repelem(y, 1, length(x))';
    for i = 1:length(X)
        U(i, 1) = spherePoint(map, goal, [X(i) Y(i)], k, lambda);
    end
    XGrid = reshape(X, length(x), length(y))';
    YGrid = reshape(Y, length(x), length(y))';
    U = reshape(U, length(x), length(y))';
    [gradUX, gradUY] = gradient(U);

%% Plots
    figure(1)
    surface(XGrid, YGrid, U)
    title("Surface Plot of Navigation Function", "Interpreter","tex");
    xlabel("X (m)");
    ylabel("Y (m)");
    zlabel("U")
    fontsize(gca,14,"points");
    set(gcf, 'Position',  [400, 150, 600, 500]);

    figure(2)
    hold on
    contour(XGrid, YGrid, U, 50);
    quiver(XGrid, YGrid, gradUX, gradUY, 8);
    for i=1:size(map, 1)
        circle([map(i, 1) map(i, 2)], map(i, 3), 1000, {'LineWidth', 1, 'LineStyle', '-', 'Color', 'black'});
    end
    hold off
    title("Coutour Plot of Navigation Function", "Interpreter","tex");
    xlabel("X (m)");
    ylabel("Y (m)");
    legend('Isopotential Contours', 'Potential Gradients');
    fontsize(gca,14,"points");
    set(gcf, 'Position',  [400, 150, 600, 500]);
end