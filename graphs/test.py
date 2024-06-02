import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import beta
from IPython.display import Image


# Parameters
krange = 10
samples = 100000

# Function to generate random numbers based on alpha and beta
def generate_random_numbers(kalpha, kbeta, krange, samples):
    return krange * np.random.beta(kalpha, kbeta, samples)

# Plotting
fig, axs = plt.subplots(2, 3, figsize=(15, 10))
distributions = [
    (1, 1, 'Uniform Distribution (kalpha=1, kbeta=1)'),
    (0.5, 1, 'Skewed Towards 0 (kalpha=0.5, kbeta=1)'),
    (1, 0.5, 'Skewed Towards krange (kalpha=1, kbeta=0.5)'),
    (0.5, 0.5, 'Double Peak (kalpha=0.5, kbeta=0.5)'),
    (2, 2, 'Gaussian-like Distribution (kalpha=2, kbeta=2)')
]
for i, (kalpha, kbeta, title) in enumerate(distributions):
    ax = axs[i // 3, i % 3]
    data = generate_random_numbers(kalpha, kbeta, krange, samples)
    ax.hist(data, bins=100, density=True)
    ax.set_title(title)
    ax.set_xlim(0, krange)

# Hide empty subplot
axs[1, 2].axis('off')

# Save the plot to an image file
fig.savefig('plot.png')

# Display the image
from IPython.display import Image
Image('plot.png')
