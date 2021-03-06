function [Lti,q] = upgrade801(sample,opts)
% UPGRADE801 Solve a low-rank affine upgrade problem
%   [Lti,q] = UPGRADE801(sample,opts) finds the affine upgrade L and q
%       given a minimal sample with id 801. Note that Lti = inv(L').
%
% See also upgradeGeneral, upgrade900, upgrade810.

    c = sample.c;

    [Hqp,Hqh] = findLinearConstraints(sample);
    
    cs = create_coeffs([Hqp; Hqh; c]);
    sols = roots(cs).';
    
    [Lti,q] = extractSolutions(sample,sols,Hqp,Hqh,opts);
end


function c = create_coeffs(data)
    c = zeros(1,5);
    c(1) = data(10)*data(11)*data(18)^2 + data(10)*data(12)*data(17)^2 - 2*data(10)*data(15)*data(17)*data(18) + data(11)*data(12)*data(16)^2 - 2*data(11)*data(14)*data(16)*data(18) - 2*data(12)*data(13)*data(16)*data(17) - data(13)^2*data(18)^2 + 2*data(13)*data(14)*data(17)*data(18) + 2*data(13)*data(15)*data(16)*data(18) - data(14)^2*data(17)^2 + 2*data(14)*data(15)*data(16)*data(17) - data(15)^2*data(16)^2;
    c(2) = data(1)*data(11)*data(18)^2 + data(1)*data(12)*data(17)^2 - 2*data(1)*data(15)*data(17)*data(18) + data(2)*data(10)*data(18)^2 + data(2)*data(12)*data(16)^2 - 2*data(2)*data(14)*data(16)*data(18) + data(3)*data(10)*data(17)^2 + data(3)*data(11)*data(16)^2 - 2*data(3)*data(13)*data(16)*data(17) - 2*data(4)*data(12)*data(16)*data(17) - 2*data(4)*data(13)*data(18)^2 + 2*data(4)*data(14)*data(17)*data(18) + 2*data(4)*data(15)*data(16)*data(18) - 2*data(5)*data(11)*data(16)*data(18) + 2*data(5)*data(13)*data(17)*data(18) - 2*data(5)*data(14)*data(17)^2 + 2*data(5)*data(15)*data(16)*data(17) - 2*data(6)*data(10)*data(17)*data(18) + 2*data(6)*data(13)*data(16)*data(18) + 2*data(6)*data(14)*data(16)*data(17) - 2*data(6)*data(15)*data(16)^2 + 2*data(7)*data(11)*data(12)*data(16) - 2*data(7)*data(11)*data(14)*data(18) - 2*data(7)*data(12)*data(13)*data(17) + 2*data(7)*data(13)*data(15)*data(18) + 2*data(7)*data(14)*data(15)*data(17) - 2*data(7)*data(15)^2*data(16) + 2*data(8)*data(10)*data(12)*data(17) - 2*data(8)*data(10)*data(15)*data(18) - 2*data(8)*data(12)*data(13)*data(16) + 2*data(8)*data(13)*data(14)*data(18) - 2*data(8)*data(14)^2*data(17) + 2*data(8)*data(14)*data(15)*data(16) + 2*data(9)*data(10)*data(11)*data(18) - 2*data(9)*data(10)*data(15)*data(17) - 2*data(9)*data(11)*data(14)*data(16) - 2*data(9)*data(13)^2*data(18) + 2*data(9)*data(13)*data(14)*data(17) + 2*data(9)*data(13)*data(15)*data(16) - data(10)*data(11)*data(12)*data(19) + data(10)*data(15)^2*data(19) + data(11)*data(14)^2*data(19) + data(12)*data(13)^2*data(19) - 2*data(13)*data(14)*data(15)*data(19);
    c(3) = data(1)*data(2)*data(18)^2 + data(1)*data(3)*data(17)^2 - 2*data(1)*data(6)*data(17)*data(18) + 2*data(1)*data(8)*data(12)*data(17) - 2*data(1)*data(8)*data(15)*data(18) + 2*data(1)*data(9)*data(11)*data(18) - 2*data(1)*data(9)*data(15)*data(17) - data(1)*data(11)*data(12)*data(19) + data(1)*data(15)^2*data(19) + data(2)*data(3)*data(16)^2 - 2*data(2)*data(5)*data(16)*data(18) + 2*data(2)*data(7)*data(12)*data(16) - 2*data(2)*data(7)*data(14)*data(18) + 2*data(2)*data(9)*data(10)*data(18) - 2*data(2)*data(9)*data(14)*data(16) - data(2)*data(10)*data(12)*data(19) + data(2)*data(14)^2*data(19) - 2*data(3)*data(4)*data(16)*data(17) + 2*data(3)*data(7)*data(11)*data(16) - 2*data(3)*data(7)*data(13)*data(17) + 2*data(3)*data(8)*data(10)*data(17) - 2*data(3)*data(8)*data(13)*data(16) - data(3)*data(10)*data(11)*data(19) + data(3)*data(13)^2*data(19) - data(4)^2*data(18)^2 + 2*data(4)*data(5)*data(17)*data(18) + 2*data(4)*data(6)*data(16)*data(18) - 2*data(4)*data(7)*data(12)*data(17) + 2*data(4)*data(7)*data(15)*data(18) - 2*data(4)*data(8)*data(12)*data(16) + 2*data(4)*data(8)*data(14)*data(18) - 4*data(4)*data(9)*data(13)*data(18) + 2*data(4)*data(9)*data(14)*data(17) + 2*data(4)*data(9)*data(15)*data(16) + 2*data(4)*data(12)*data(13)*data(19) - 2*data(4)*data(14)*data(15)*data(19) - data(5)^2*data(17)^2 + 2*data(5)*data(6)*data(16)*data(17) - 2*data(5)*data(7)*data(11)*data(18) + 2*data(5)*data(7)*data(15)*data(17) + 2*data(5)*data(8)*data(13)*data(18) - 4*data(5)*data(8)*data(14)*data(17) + 2*data(5)*data(8)*data(15)*data(16) - 2*data(5)*data(9)*data(11)*data(16) + 2*data(5)*data(9)*data(13)*data(17) + 2*data(5)*data(11)*data(14)*data(19) - 2*data(5)*data(13)*data(15)*data(19) - data(6)^2*data(16)^2 + 2*data(6)*data(7)*data(13)*data(18) + 2*data(6)*data(7)*data(14)*data(17) - 4*data(6)*data(7)*data(15)*data(16) - 2*data(6)*data(8)*data(10)*data(18) + 2*data(6)*data(8)*data(14)*data(16) - 2*data(6)*data(9)*data(10)*data(17) + 2*data(6)*data(9)*data(13)*data(16) + 2*data(6)*data(10)*data(15)*data(19) - 2*data(6)*data(13)*data(14)*data(19) + data(7)^2*data(11)*data(12) - data(7)^2*data(15)^2 - 2*data(7)*data(8)*data(12)*data(13) + 2*data(7)*data(8)*data(14)*data(15) - 2*data(7)*data(9)*data(11)*data(14) + 2*data(7)*data(9)*data(13)*data(15) + data(8)^2*data(10)*data(12) - data(8)^2*data(14)^2 - 2*data(8)*data(9)*data(10)*data(15) + 2*data(8)*data(9)*data(13)*data(14) + data(9)^2*data(10)*data(11) - data(9)^2*data(13)^2;
    c(4) = 2*data(1)*data(2)*data(9)*data(18) - data(1)*data(2)*data(12)*data(19) + 2*data(1)*data(3)*data(8)*data(17) - data(1)*data(3)*data(11)*data(19) - 2*data(1)*data(6)*data(8)*data(18) - 2*data(1)*data(6)*data(9)*data(17) + 2*data(1)*data(6)*data(15)*data(19) + data(1)*data(8)^2*data(12) - 2*data(1)*data(8)*data(9)*data(15) + data(1)*data(9)^2*data(11) + 2*data(2)*data(3)*data(7)*data(16) - data(2)*data(3)*data(10)*data(19) - 2*data(2)*data(5)*data(7)*data(18) - 2*data(2)*data(5)*data(9)*data(16) + 2*data(2)*data(5)*data(14)*data(19) + data(2)*data(7)^2*data(12) - 2*data(2)*data(7)*data(9)*data(14) + data(2)*data(9)^2*data(10) - 2*data(3)*data(4)*data(7)*data(17) - 2*data(3)*data(4)*data(8)*data(16) + 2*data(3)*data(4)*data(13)*data(19) + data(3)*data(7)^2*data(11) - 2*data(3)*data(7)*data(8)*data(13) + data(3)*data(8)^2*data(10) - 2*data(4)^2*data(9)*data(18) + data(4)^2*data(12)*data(19) + 2*data(4)*data(5)*data(8)*data(18) + 2*data(4)*data(5)*data(9)*data(17) - 2*data(4)*data(5)*data(15)*data(19) + 2*data(4)*data(6)*data(7)*data(18) + 2*data(4)*data(6)*data(9)*data(16) - 2*data(4)*data(6)*data(14)*data(19) - 2*data(4)*data(7)*data(8)*data(12) + 2*data(4)*data(7)*data(9)*data(15) + 2*data(4)*data(8)*data(9)*data(14) - 2*data(4)*data(9)^2*data(13) - 2*data(5)^2*data(8)*data(17) + data(5)^2*data(11)*data(19) + 2*data(5)*data(6)*data(7)*data(17) + 2*data(5)*data(6)*data(8)*data(16) - 2*data(5)*data(6)*data(13)*data(19) + 2*data(5)*data(7)*data(8)*data(15) - 2*data(5)*data(7)*data(9)*data(11) - 2*data(5)*data(8)^2*data(14) + 2*data(5)*data(8)*data(9)*data(13) - 2*data(6)^2*data(7)*data(16) + data(6)^2*data(10)*data(19) - 2*data(6)*data(7)^2*data(15) + 2*data(6)*data(7)*data(8)*data(14) + 2*data(6)*data(7)*data(9)*data(13) - 2*data(6)*data(8)*data(9)*data(10);
    c(5) = -data(1)*data(2)*data(3)*data(19) + data(1)*data(2)*data(9)^2 + data(1)*data(3)*data(8)^2 + data(1)*data(6)^2*data(19) - 2*data(1)*data(6)*data(8)*data(9) + data(2)*data(3)*data(7)^2 + data(2)*data(5)^2*data(19) - 2*data(2)*data(5)*data(7)*data(9) + data(3)*data(4)^2*data(19) - 2*data(3)*data(4)*data(7)*data(8) - data(4)^2*data(9)^2 - 2*data(4)*data(5)*data(6)*data(19) + 2*data(4)*data(5)*data(8)*data(9) + 2*data(4)*data(6)*data(7)*data(9) - data(5)^2*data(8)^2 + 2*data(5)*data(6)*data(7)*data(8) - data(6)^2*data(7)^2;
end

