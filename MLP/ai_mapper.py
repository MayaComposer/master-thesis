#This file takes input using OSC, maps it to x amount of parameters using an MLP. and outputs back using OSC
import numpy as np
from sklearn.neural_network import MLPRegressor
from sklearn.model_selection import KFold
from sklearn.preprocessing import MinMaxScaler

import pandas as pd

import os


from pythonosc.udp_client import SimpleUDPClient
from pythonosc import dispatcher
from pythonosc.osc_server import AsyncIOOSCUDPServer
import signal
import asyncio
from typing import List, Any

from sklearn.neural_network import MLPRegressor
from sklearn.model_selection import train_test_split

stop_event = asyncio.Event()

receive_address = '127.0.0.1', 8000
send_address = '127.0.0.1', 8001

mode = 'Training' #Training or Predicting mode

audio_features = [0, 0, 0, 0, 0]

synth_params = [0, 0, 0]

training_data = np.array([]).reshape(0, 5)

target_data = np.array([]).reshape(0, 3)

audio_features_in = [0, 0, 0, 0, 0]

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

#other address
def unspecified_address(address, *osc_arguments: list[any]):
    pass
    #print("unspecified address", address, osc_arguments)

def set_mode(address, message):
    global mode
    if message == 0:
        mode = 'Training'
        print('Training')
    elif message == 1:
        mode = 'Predicting'
        print("Predicting")


#add here the ability to save the data to the arrays
def audio_feature_to_table(address: str, *args: List[Any]) -> None:
    global audio_features
    global training_data
    global target_data
    #filter osc messages and add them to a list
    if mode == 'Training':
       #filter feature index
       index = int(address[-1:])
       audio_features[index-1] = args[0]
       array = np.array(audio_features)
       
       training_data = np.concatenate((training_data, [array]), axis=0)
       print('\n', training_data, '\n')

    elif mode == 'Predicting':
        index = int(address[-1:])
        audio_features_in[index-1] = args[0]

def synth_parameter_to_table(address: str, *args: List[Any]) -> None:
    global synth_params
    global target_data
    #filter osc messages and add them to a list
    if mode == 'Training':
       #filter feature index
       index = int(address[-1:])
       synth_params[index-1] = args[0]
       array = np.array(synth_params)
       
       target_data = np.concatenate((target_data, [array]), axis=0)
       print('\n', target_data, '\n')


def fit_data(address: str, *args: List[Any]) -> None:
    global training_data
    global target_data
    print("fit data called")
    # Check the shape of X and y
    print(training_data.shape)  # Output: (801, ...)
    print(target_data.shape)  # Output: (9, ...)

    # Adjust the dataset to have a consistent number of samples
    if training_data.shape[0] != target_data.shape[0]:
        # Remove samples from X to match the number of samples in y
        training_data = training_data[:target_data.shape[0], :]
        print("Adjusted X shape:", training_data.shape)

    # Call the fit method with the adjusted dataset
    mlp_model.fit(training_data, target_data)

    # Evaluate the model
    score = mlp_model.score(training_data, target_data)
    print(score)



#Loop of the program
async def loop():
    while not stop_event.is_set():
        try:
            if mode == 'Predicting':
                # Make predictions
                y_predicted = mlp_model.predict(np.array(audio_features_in).reshape(1, -1))

                # Unravel array so it can be sent as an osc message
                for index, predicted_value in enumerate(y_predicted[0], start=1):
                    sendOSC('/synthparameter' + f'/{index}', predicted_value)
                    print(f'/synthparameter' + f'/{index}', predicted_value)
                
        except Exception as e:
            raise ValueError("Unhandled exception in main loop: " + str(e)) from e

        #briefly pauses the function
        await asyncio.sleep(0)



#__________________________________________

# Define the input data (X)
np.random.seed()


# Create the MLP model with more hidden layers or neurons
mlp_model = MLPRegressor(
hidden_layer_sizes=(2, 5),  # Increase the number of neurons in each hidden layer
activation='logistic',  # Use a different activation function
solver='adam',  # Use a different solver
learning_rate='adaptive',
learning_rate_init=0.1,  # Adjust the learning rate
max_iter=1000,  # Increase the number of iterations
alpha=0.0001,  # Adjust the regularization strength
batch_size=1
)

# var mlp = FluidMLPRegressor(s,
# 		[7],
# 		activation:FluidMLPRegressor.sigmoid,
# 		outputActivation:FluidMLPRegressor.sigmoid,
# 		maxIter: 1000,
# 		learnRate:0.1,
# 		batchSize:1,
# 		validation:0
# 	);

#__________________________________________

#map OSC functions
dispatcher.set_default_handler(unspecified_address)
dispatcher.map('/mode', set_mode)
dispatcher.map('/fit', fit_data)
dispatcher.map('/audiofeature*', audio_feature_to_table)
dispatcher.map('/synthparameter*', synth_parameter_to_table)

#start the program
asyncio.run(run_osc_server())

#__________________________________________