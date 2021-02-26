function nbSucces=LoiBinomiale(n,p)
nbSucces = 0;
for k=1:n
    if LoiBernoulli(p) == 1
        nbSucces = nbSucces + 1;
    end
end
end
