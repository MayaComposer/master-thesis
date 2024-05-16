#This file takes input using OSC, maps it to x amount of parameters using an MLP. and outputs back using OSC
from sklearn.neural_network import MLPClassifier
from sklearn.neural_network import MLPRegressor
import numpy as np

"""
OSC server and client, for communicating with Csound

@author: Øyvind Brandtsegg
@contact: obrandts@gmail.com
@license: GPL
"""

from pythonosc.udp_client import SimpleUDPClient
from pythonosc import dispatcher
from pythonosc.osc_server import AsyncIOOSCUDPServer
import signal
import asyncio

stop_event = asyncio.Event()

receive_address = '127.0.0.1', 9000
send_address = '127.0.0.1', 9001

def init_osc_client():
    '''Initialize the OSC client'''
    global client
    ip,port = send_address
    client = SimpleUDPClient(ip, port)
    print("running osc client at ", send_address)
    
def sendOSC(addr, value):
    '''Send an OSC message'''
    client.send_message(addr, value)    

def inner_ctrl_c_signal_handler(sig, frame):
    '''
    Function that gets called when the user issues a
    keyboard interrupt (ctrl+c) to stop the server
    '''
    print("Ctrl+C ...")
    stop_event.set()
    
async def run_osc_server():
    '''Start the OSC server'''
    ip,port = receive_address
    server = AsyncIOOSCUDPServer((ip,port), dispatcher, asyncio.get_event_loop())
    transport, protocol = await server.create_serve_endpoint()  # Create datagram endpoint and start serving
    print("running osc server at ", receive_address)
    await loop()  # Enter main loop of program
    transport.close()  # Clean up serve endpoint
    print("osc server closed")

signal.signal(signal.SIGINT, inner_ctrl_c_signal_handler)
init_osc_client()
dispatcher = dispatcher.Dispatcher()

mode = 0

#Handle OSC messages
def osc_handler(address, *data):
    #TO DO HERE
    #update the variables for the MLP received through OSC
    print(f"Received message from {address}: {data}")
    if data[0] == 1:
        mode = "Training"
        print(mode)
    elif data[0] == 0:
        mode = "Predicting"
        print(mode)


#Loop of the program
async def loop():
    while not stop_event.is_set():
        #TO DO HERE
        #train the network when in training mode
        #make predictions when in prediction mode
        if mode == "Training":
            print("Training")
        elif mode == "Predicting":
            print("Predicting")

        #what does this function do?
        await asyncio.sleep(0)

#_____________________________________

#MLP trains on two arrays: array X of size (n_samples, n_features), which holds the training samples represented as floating point feature vectors; and array y of size (n_samples,), which holds the target values (class labels) for the training samples:


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
#start the program
dispatcher.map("/in", osc_handler)
asyncio.run(run_osc_server())

#__________________________________________