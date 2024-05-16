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

global mode 
mode = "Training" #Training or Predicting mode

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

#Handle OSC messages
def unspecified_address(address, *osc_arguments: list[any]):
    print("unspecified address", address, osc_arguments)

def set_training_mode(address, message):
    global mode
    # Update the MLP training mode based on the OSC message
    if message == 0:
        mode = "Training"
    elif message == 1:
        mode = "Predicting"



#Loop of the program
async def loop():
    while not stop_event.is_set():
        # Check for bugs such as null pointer references, unhandled exceptions, and more
        try:
            #TODO add training and prediction
            #train the network when in training mode
            #make predictions when in prediction mode
            if mode == "Training":
                pass
                #print("Traininggggg")

            elif mode == "Predicting":
                pass
                #print("Predictingggg")
        except Exception as e:
            raise ValueError("Unhandled exception in main loop: " + str(e)) from e

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

#map OSC functions
dispatcher.set_default_handler(unspecified_address)
dispatcher.map("/mode", set_training_mode)

#start the program
asyncio.run(run_osc_server())

#__________________________________________