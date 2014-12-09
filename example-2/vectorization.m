% surrounding a block of code with tic and toc
% will time its execution and automatically output
% Elapsed time is 0.0004 seconds. (for example)


% non-vectorized code executes in ~4 ms
tic
i = 0;
for t = 0:.01:10
    i = i + 1;
    y(i) = sin(t);
end
toc

% vectorized code executes in ~0.1 ms
tic
t = 0:.01:10;
y = sin(t);
toc
