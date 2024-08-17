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

mode = 'Predicting' #Training or Predicting mode

audio_features = [0, 0, 0, 0, 0]

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

def set_training_mode(address, message):
    global mode
    if message == 0:
        mode = 'Training'
        print('Training')
    elif message == 1:
        mode = 'Predicting'
        print("Predicting")

def audio_feature_to_table(address: str, *args: List[Any]) -> None:

    if mode == 'Training':
        print("audio feature", address, args)
        #filter osc messages and add them to a list
        i = int(address[-1:])
        audio_features[i-1] = args[0]
        
        # Save the audio feature data to a CSV file
        data = pd.DataFrame({'feature': [i], 'value': [args[0]]})
        data.to_csv('audio_features.csv', mode='a', header=False, index=False)
    elif mode == 'Predicting':
        pass

def synth_parameter_to_table(address: str, *args: List[Any]) -> None:
    if mode == 'Training':
        pass
    elif mode == 'Predicting':
        pass

#Loop of the program
async def loop():
    while not stop_event.is_set():
        try:
            #train the network when in training mode
            if mode == 'Training':
                
                #save the synth data and audiofeature data to cvs (?)

                pass

            elif mode == 'Predicting':
                # Make predictions
                y_pred = mlp_model.predict(np.array(audio_features).reshape(1, -1))

                out_list = y_pred[0]

                #unravel array so it can be sent as an osc message
                for index, feature_value in enumerate(out_list, start=1):
                    sendOSC('/feature' + f'/{index}', feature_value)
                    if index == 1:
                        print("feature " + str(index) + ": " + str(feature_value))
                    if index == 5:
                        break
                
        except Exception as e:
            raise ValueError("Unhandled exception in main loop: " + str(e)) from e

        #briefly pauses the function
        await asyncio.sleep(0)



#__________________________________________

# Define the input data (X)
np.random.seed()
input_data = np.random.rand(10000, 5)

# Define the target data (y)
target_data = np.random.rand(10000, 2)

# Create a MinMaxScaler object
scaler = MinMaxScaler()

# Scale the input data
scaled_input_data = scaler.fit_transform(input_data)

# Scale the target data
scaled_target_data = scaler.fit_transform(target_data)

# Create a KFold object with 5 folds
kfold = KFold(n_splits=5, shuffle=True, random_state=42)

# Create the MLP model with more hidden layers or neurons
mlp_model = MLPRegressor(
hidden_layer_sizes=(10, 5),  # Increase the number of neurons in each hidden layer
activation='relu',  # Use a different activation function
solver='adam',  # Use a different solver
learning_rate='adaptive',
learning_rate_init=1.0,  # Adjust the learning rate
max_iter=1000,  # Increase the number of iterations
alpha=0.0001,  # Adjust the regularization strength
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

# Initialize the scores list
scores = []

# Loop through the folds
for training_index, validation_index in kfold.split(scaled_input_data):
# Split the data into training and validation sets
    training_data, validation_data = (
        scaled_input_data[training_index],
        scaled_input_data[validation_index]
    )
    training_target, validation_target = (
        scaled_target_data[training_index],
        scaled_target_data[validation_index]
    )

    # Train the model
    mlp_model.fit(training_data, training_target)

    # Evaluate the model
    score = mlp_model.score(validation_data, validation_target)
    scores.append(score)

    # Check if the score is high enough
    if np.mean(scores) >= 0.9:
        break

# Print the average score
# print("Average R-squared score:", np.mean(scores))

#__________________________________________

#map OSC functions
dispatcher.set_default_handler(unspecified_address)
dispatcher.map('/mode', set_training_mode)
dispatcher.map('/audiofeature*', audio_feature_to_table)
dispatcher.map('/synthparameter*', synth_parameter_to_table)

#start the program
asyncio.run(run_osc_server())

#__________________________________________