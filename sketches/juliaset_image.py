import numpy as np
import matplotlib.pyplot as plt

# Parameters for the Julia Set
width, height = 800, 800  # Image dimensions
x_min, x_max = -2, 2      # X-axis range
y_min, y_max = -2, 2      # Y-axis range
c = complex(-0.7, 0.27015)  # Julia set constant
max_iter = 256             # Maximum number of iterations

# Generate the complex plane
x = np.linspace(x_min, x_max, width)
y = np.linspace(y_min, y_max, height)
X, Y = np.meshgrid(x, y)
Z = X + 1j * Y

# Julia set iteration
def julia_set(Z, c, max_iter):
    iteration = np.zeros(Z.shape, dtype=int)
    mask = np.full(Z.shape, True, dtype=bool)
    
    for i in range(max_iter):
        Z[mask] = Z[mask]**2 + c
        mask, old_mask = np.abs(Z) < 2, mask
        iteration += old_mask & ~mask
        print(Z)
    
    return iteration

# Generate the Julia set image
iterations = julia_set(Z, c, max_iter)

# Plot and save the image
plt.figure(figsize=(10, 10))
plt.imshow(iterations, extent=[x_min, x_max, y_min, y_max], cmap='inferno')
plt.colorbar()
plt.title(f"Julia Set for c = {c}")
plt.savefig("julia_set.png")
plt.show()
