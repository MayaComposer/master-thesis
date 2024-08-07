import numpy as np
from sklearn.neural_network import MLPRegressor
from sklearn.model_selection import train_test_split
import matplotlib.pyplot as plt

# Generate some synthetic data for demonstration
np.random.seed(42)
X = np.random.rand(100, 5)  # 100 samples, 5 features (input)
y = np.random.rand(100, 10)  # 100 samples, 10 targets (output)

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Create the MLPRegressor model
mlp = MLPRegressor(hidden_layer_sizes=(100, 50), max_iter=500, random_state=42)

# Train the model
mlp.fit(X_train, y_train)

# Evaluate the model
score = mlp.score(X_test, y_test)
print(f'Model R^2 score: {score:.2f}')

# Make predictions
y_pred = mlp.predict(X_test)

# Plot actual vs predicted values for the first output dimension
plt.scatter(y_test[:, 0], y_pred[:, 0], color='blue', label='Predicted vs Actual')
plt.xlabel('Actual values')
plt.ylabel('Predicted values')
plt.title('Actual vs Predicted values for first output dimension')
plt.legend()
plt.show()
