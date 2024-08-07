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
    if message == 0:
        mode = 'Training'
        print('Training')
    elif message == 1:
        mode = 'Predicting'
        print("Predicting")

def audio_feature_to_table(address: str, *args: List[Any]) -> None:
    #filter osc messages and add them to a list
    i = int(address[-1:])
    audio_features[i-1] = args[0]

def synth_parameter_to_table(address: str, *args: List[Any]) -> None:
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
                y_pred = mlp.predict(np.array(audio_features).reshape(1, -1))

                out_list = y_pred[0]

                #unravel array so it can be sent as an osc message
                for index, feature_value in enumerate(out_list, start=1):
                    sendOSC('/feature' + f'/{index}', feature_value)
                    if index == 5:
                        break
                
        except Exception as e:
            raise ValueError("Unhandled exception in main loop: " + str(e)) from e

        #briefly pauses the function
        await asyncio.sleep(0)



#__________________________________________

# Generate some synthetic data for demonstration
np.random.seed(42)
X = np.random.rand(500, 5)  # 100 samples, 5 features (input)
y = np.random.rand(500, 10)  # 100 samples, 10 targets (output)

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Create the MLPRegressor model
mlp = MLPRegressor(hidden_layer_sizes=(100, 50), max_iter=500, random_state=42)

# Train the model
mlp.fit(X_train, y_train)

# Evaluate the model
score = mlp.score(X_test, y_test)

#__________________________________________

#map OSC functions
dispatcher.set_default_handler(unspecified_address)
dispatcher.map('/mode', set_training_mode)
dispatcher.map('/audiofeature*', audio_feature_to_table)
dispatcher.map('/synthparameter*', synth_parameter_to_table)

#start the program
asyncio.run(run_osc_server())

#__________________________________________