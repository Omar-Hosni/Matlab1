clear

px = [1,6]; py = [1,3];
vx = [1,3]; vy = [3,-1];
plot(px,py,'b*');
axis equal; hold on;
quiver(px(1), py(1), vx(1), vy(1));
quiver(px(2), py(2), vx(2), vy(2));

syms a3 a2 a1 a0 t
x(t) = a3*t^3 + a2*t^2 + a1*t + a0;
xd(t) = diff(x,t);
t1 = 0; t2 =  2;
ex = [x(t1) == px(1), x(t2) == px(2), xd(t1) == vx(1), xd(t2) == vx(2)];

sx = solve(ex, [a3 a2 a1 a0]);
cx(t) = subs(x, [a3 a2 a1 a0] , [sx.a3, sx.a2, sx.a1, sx.a0] );


syms b3 b2 b1 b0
y(t) = b3*t^3 + b2*t^2 + b1*t + b0;
yd(t) = diff(y,t);
ey = [y(t1) == py(1), y(t2) == py(2), yd(t1) == vy(1), yd(t2) == vy(t2)];
sy = solve(ey, [b3 b2 b1 b0]);
cy(t) = subs(y, [b3 b2 b1 b0], [sy.b3 sy.b2 sy.b1 sy.b0]);
fplot(cx, cy, [t1 t2])

% connect Hermite
rx = [px(2), 10];
ry = [py(2), 5];
ux = [vx(2), 0];
uy = [vy(2), 5];

plot(rx, ry, '*');
quiver(rx(2), ry(2), ux(2), uy(2));

    




