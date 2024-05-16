#This file takes input using OSC, maps it to x amount of parameters using an MLP. and outputs back using OSC
import osc

from sklearn.neural_network import MLPClassifier
from sklearn.neural_network import MLPRegressor
import numpy as np


def osc_handler(address, *data):
    print(f"Received message from {address}: {data}")

#_____________________________________

#MLP trains on two arrays: array X of size (n_samples, n_features), which holds the training samples represented as floating point feature vectors; and array y of size (n_samples,), which holds the target values (class labels) for the training samples:

async def loop():
    while not stop_event.is_set():
        await asyncio.sleep(0)
    # Generate example dataset with 5 audio features and 5 target values
    X_train = np.random.rand(100, 3)  # 100 samples with 5 audio features each
    y_train = np.random.rand(100, 5)  # 100 samples with 5 target values between 0.0 and 1.0 each

    # Define and train the MLP regressor model
    mlp_regressor = MLPRegressor(hidden_layer_sizes=(100, 50), activation='relu', solver='adam', max_iter=500)
    mlp_regressor.fit(X_train, y_train)

    # Generate new set of 5 audio features for prediction
    X_test = np.array([[1, 1, 1]])  # Single sample with 5 audio features

    # Make predictions using the trained model
    predictions = mlp_regressor.predict(X_test)
    print("Predicted values:", predictions)

#__________________________________________

#__________________________________________
#OSC
osc.dispatcher.map("/in", osc_handler)
osc.asyncio.run(osc.run_osc_server())

#__________________________________________