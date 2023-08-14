function U = spherePoint(map, goal, point, k, lambda)
    a = ([map(:, 1) map(:, 2)] - point);
    beta = sum(a.^2, 2) - map(:, 3).^2; beta(1) = -beta(1); beta = prod(beta);
    if(beta < 0), U = 0; return; end
    gamma = sum((point - goal).^2, 2)^k;
    U = (gamma/(gamma + lambda*beta))^(1/k);
end