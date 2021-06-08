%question 1 unit tests

function tests = Tests
    tests = functiontests(localfunctions);
end

%Tests for part 1

function test1(testCase)
n=10;
unitT1 = 0.1;
x= formula3(unitT1,2,n); 
g = zeros(length(unitT1),1);
for i = 1:length(unitT1)
    g(i) = R2toR1(x(i,:)); 
end
actSol = g';
expSol = 1.21;
verifyEqual(testCase,actSol,expSol, 'AbsTol', 0.001);

end

function test2(testCase)
n=20;
unitT2 = .431;
x= formula3(unitT2,2,n);
g = zeros(length(unitT2),1);
for i = 1:length(unitT2)
g(i) = R2toR1(x(i,:));
end
actSol = g';
expSol = 1.2434;
verifyEqual(testCase,actSol,expSol, 'AbsTol', 0.001);

end

function test3(testCase)
n=20;
unitT3 = 0.98765;
x= formula3(unitT3,2,n);
g = zeros(length(unitT3),1);
for i = 1:length(unitT3)
    g(i) = R2toR1(x(i,:));
end
actSol = g;
expSol = 1.2787;
verifyEqual(testCase,actSol,expSol, 'AbsTol', 0.001);

end

%Tests for part 2

%f(x) = 20x^4 - x^2
%double dip with global min at approx. x=+-0.1581 f(x)=-0.125
function test4(testCase)
f = @(x) (20.*x.^4 - x.^2);
c=-.2:.02:.2;
for i = 1:length(c)
    g(i) = f(c(i));
end

[bbx,bby] = bb(c,g);
actSol = [bbx,bby];
expSol = [-0.2,-0.008;-.18,-.0114;-.16,-.0125;0.16,-.0125;.18,-.0114;.2,-.008];

verifyEqual(testCase,actSol,expSol,'AbsTol', 0.001);
end


%f(x) = ||x|-2| global min at x=+-2 f(x)=0
function test5(testCase)
f = @(x) (abs(abs(x)-2));
c=-3:.25:3;
for i = 1:length(c)
g(i) = f(c(i));
end

[bbx,bby] = bb(c,g);
actSol = [bbx,bby];
expSol = [-3,1;-2,0;2,0;3,1];

verifyEqual(testCase,actSol,expSol);
end


%f(x) = 20(x-2)^8 - 12(x-2)^4 -10
% global min at appox x=1.26,2.74 f(x)= -11.8
function test6(testCase)
f = @(x) (20*(x-2)^8-12*(x-2)^4-10);
c=0.5:.25:3.5;
for i = 1:length(c)
g(i) = f(c(i));
end

[bbx,bby] = bb(c,g);
actSol = [bbx,bby];
expSol = [.5,441.828;.75,79.912;1,-2;1.25,-11.795;2.75,-11.795;3,-2;3.25,79.912;3.5,441.828];

verifyEqual(testCase,actSol,expSol,'AbsTol', 0.001);
end

%f(x) = -|x| from -3 to 3
% global min at edges x=-3,3 with f(x)=-3
function test7(testCase)
f = @(x) -abs(x);
c=-3:.05:3;
for i = 1:length(c)
g(i) = f(c(i));
end

[bbx,bby] = bb(c,g);
actSol = [bbx,bby];
expSol = [-3,-3;3,-3];

verifyEqual(testCase,actSol,expSol);
end

%Tests for part 3

function test8(testCase)

epsilon = 0.001;
f = @(x) sum((x-0.5).^2);
d = 3;
xbar = [0.5 0.5 0.5];
xStar = fullMethod(f,epsilon,d, 20);
assertTrue(testCase,norm(xStar-xbar) < epsilon);

end

function test9(testCase)

epsilon = 0.03;
f = @(x) sum((x-0.9).^4);
d = 2;

xStar = fullMethod(f,epsilon,d, 20);
xbar = [0.9 0.9];
assertTrue(testCase,norm(xStar-xbar) < epsilon);

end


function test10(testCase)

epsilon = 0.05;
f = @(x) sum((x-.1).^2);
d = 3;
xStar = fullMethod(f,epsilon,d, 20);
xbar = [0.1 0.1 0.1];
assertTrue(testCase,norm(xStar-xbar) < epsilon);

end


function test11(testCase)

epsilon = 0.001;
f = @(x) sum((x-0.5).^2);
d = 10;
xbar = [0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5];
xStar = fullMethod(f,epsilon,d, 20);
assertTrue(testCase,norm(xStar-xbar) < epsilon);

end





