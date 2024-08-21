import numpy as np
from sklearn.neural_network import MLPRegressor
from pythonosc import dispatcher as osc_dispatcher, osc_server, udp_client

# Initialize the MLPRegressor
mlp = MLPRegressor(
    hidden_layer_sizes=(7,),
    activation='logistic',
    solver='adam',
    learning_rate_init=0.1,
    max_iter=1000,
    batch_size=1
)

# Data containers
xy_data = []
params_data = []

# OSC Client for sending messages
client = udp_client.SimpleUDPClient('localhost', 5006)  # Use a different port for sending

# OSC Handlers
def handle_point_add(*args):
    global xy_data, params_data
    xy = np.array(args[0])
    params = np.array(args[1])
    xy_data.append(xy)
    params_data.append(params)
    print(f"Added point: XY = {xy}, Params = {params}")

def handle_train(*args):
    global mlp, xy_data, params_data
    if xy_data and params_data:
        X = np.array(xy_data)
        y = np.array(params_data)
        mlp.fit(X, y)
        print("Model trained")

def handle_save_model(*args):
    import joblib
    joblib.dump(mlp, 'mlp_model.pkl')
    print("Model saved to mlp_model.pkl")

def handle_load_model(*args):
    global mlp
    import joblib
    mlp = joblib.load('mlp_model.pkl')
    print("Model loaded from mlp_model.pkl")

def handle_predict(*args):
    global mlp
    xy = np.array(args[0])
    prediction = mlp.predict([xy])[0]
    print(f"Prediction for {xy}: {prediction}")

    # Send the prediction result via OSC
    client.send_message('/predictionResult', prediction.tolist())

# Setup OSC server
def osc_server_function():
    osc_dispatcher = osc_dispatcher.Dispatcher()  # Ensure correct usage of the imported dispatcher
    osc_dispatcher.map("/addPoint", handle_point_add)
    osc_dispatcher.map("/train", handle_train)
    osc_dispatcher.map("/saveModel", handle_save_model)
    osc_dispatcher.map("/loadModel", handle_load_model)
    osc_dispatcher.map("/predict", handle_predict)

    server = osc_server.BlockingOSCUDPServer(('localhost', 8000), osc_dispatcher)
    print("Serving on port 8000")
    server.serve_forever()

if __name__ == "__main__":
    osc_server_function()
