function g = g_sigma(t,sigma)
g = 1/(sigma*sqrt(2))*exp(-t.^2/(2*sigma^2));