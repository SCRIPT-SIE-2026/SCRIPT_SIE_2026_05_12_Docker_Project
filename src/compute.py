import numpy as np
import matplotlib.pyplot as plt

print("Running computation...")

figure_path = "results/figure.png"
x = np.linspace(0, 10, 100)
y = np.sin(x)

plt.plot(x, y)
plt.savefig(f"{figure_path}")
print(f"Figure saved at: {figure_path}")