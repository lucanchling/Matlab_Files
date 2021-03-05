function x = LoiBernoulli(p)
a = rand(1);
if a <= p
    x = 1;
else
    x = 0;
end
end