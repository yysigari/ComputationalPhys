#Solve and Plot  a damping system 
import sympy as sym
import matplotlib.pyplot as plt
import numpy as np
x = sym.Symbol('x')
f, g = sym.symbols('f g', cls=sym.Function)
sym.dsolve(f(x).diff(x, x) + f(x).diff(x) +f(x), f(x))
#plot
x = np.linspace(-10,10,50)

fx= (np.cos(1.7*x/2) + np.sin(1.7*x/2))*np.exp(-x/2)
fx1= (np.cos(1.7*x/2) +0.5* np.sin(1.7*x/2))*np.exp(-x/2)
fx2= (np.cos(1.7*x/2) +2* np.sin(1.7*x/2))*np.exp(-x/2)
fx3= (np.cos(1.7*x/2) - np.sin(1.7*x/2))*np.exp(-x/2)

plt.plot(x,fx,label='1')
plt.plot(x,fx1,label='0.5')
plt.plot(x,fx2,label='2')
plt.plot(x,fx3,label='-1')
plt.xlim(-10,10)
plt.legend()
plt.xlabel('Time')
