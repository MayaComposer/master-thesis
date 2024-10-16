# import pandas lib as pd
import pandas as pd
import numpy as np


# read by default 1st sheet of an excel file
dataframe = pd.read_excel('ModMatrixTable.xlsx', index_col=0, header=1)

# Print the DataFrame to verify it's loaded correctly
print("DataFrame:\n", dataframe)

counter = 0

parameter_definitions = []

input_parameters = []

coefficients = []

input_channels = []

input_channels_set = []

init_osc_param = []

osc_input = []

modulators = []

output_parameters = []

output_channels = []

number_of_modulators = len(dataframe)

number_of_parameters = len(dataframe.columns)

for row_name in dataframe.index:

    #write code to lists

    #receive channels for modulators
    input_channels.append('k' + str(row_name) + ' ' + 'chnget' + ' ' + '"' + str(row_name) + '"')

    #kValue OSClisten giOscHandler, "/value", "f", kData
    #osc defs
    #kValueTrue0 OSCListen  giOscHandler, "/Anxiety"f"kAnxiety

    #kMorphX init 0

    init_osc_param.append('k' + str(row_name) + ' init 0')
    
    osc_input.append('k' + 'InputCheck' + str(dataframe.index.get_loc(row_name)+1) + ' OSClisten ' + ' giOscHandler, ' + '"/' + str(row_name) + '", ' + '"' + 'f' + '", ' + 'k' + str(row_name))


    #chnset kExpression, "Expression"
    input_channels_set.append('chnset ' 'k' + str(row_name) + ', ' + '"' + str(row_name) + '"')
   
    #modulator tablew statements
    modulators.append('tablew' + ' ' + 'k' + str(row_name) + ', ' + str(dataframe.index.get_loc(row_name)) + ', giModulators')

    
    
    for col_name in dataframe.columns:
        
        #tablewrite code for coefficients
        coefficients.append('tableiw' + ' ' + str(dataframe.at[row_name, col_name]) + ', ' + str(counter) + ', giModScale' + ' ; ' + str(row_name + ' to ' + col_name))
        counter += 1

#input parameters looped seperately here. 
for col_name in dataframe.columns:

    parameter_definitions.append('i' + col_name + ' = 0') #add starting values of parameters here somehow. 

    input_parameters.append('tableiw' + ' ' + 'i' + col_name + ', ' + str(dataframe.columns.get_loc(col_name)) + ', giParam_In')
    
    #parameters getting read from out table
    #kFreq table	0, giParam_Out
    output_parameters.append('k' + col_name + ' table ' + str(dataframe.columns.get_loc(col_name)) + ', giParam_Out')

    #chnset parameter, "channel"
    output_channels.append('chnset ' + 'k' + col_name + ', ' + str('"' + col_name + '"'))
    

##include 'input.inc'
##include 'output.inc'

output = open('output.inc', 'w')

print(';____________________________________ \n', file=output)


print(';parameter definitions \n', file=output)

for i in range(len(parameter_definitions)):
    print(parameter_definitions[i], file=output)

print('\n', file=output)

print(';input parameters \n', file=output)

for i in range(len(input_parameters)):
    print(input_parameters[i], file=output)

print('\n', file=output)

print(';coefficients:___________________________________________ \n', file=output)
for i in range(len(coefficients)):
    print(coefficients[i], file=output)

print('\n', file=output)

print(';input_channels to be read for input___________________________ \n', file=output)

for i in range(len(input_channels)):
    print(input_channels[i], file=output)

print('\n', file=output)

print(';modulators___________________________ \n', file=output)

for i in range(len(modulators)):
    print(modulators[i], file=output)

print('\n', file=output)

print('; get the update flag', file=output)
print('kupdate	init 1 ;chnget	"modulatorUpdateFlag"', file=output)
print('inum_mod = ' + str(number_of_modulators), file=output)
print('inum_param = ' + str(number_of_parameters), file=output)
print('modmatrix giParam_Out, giModulators, giParam_In, giModScale, inum_mod, inum_param, kupdate', file=output)

print(';output parameters___________________________ \n', file=output)

for i in range(len(output_parameters)):
    print(output_parameters[i], file=output)

print('\n', file=output)


print(';channels to read parameters from___________________________ \n', file=output)
for i in range(len(output_channels)):
    print(output_channels[i], file=output)

print('\n', file=output)

output.close()

output = open('receiver.inc', 'w')

print(';____________________________________ \n', file=output)

for i in range(len(init_osc_param)):
    print(init_osc_param[i], file=output)

print('\n', file=output)


for i in range(len(osc_input)):
    print(osc_input[i], file=output)


print(';put this into the receiver instrument', file=output)
for i in range(len(input_channels_set)):
    print(input_channels_set[i], file=output)



output.close()

output = open('cabbage_user_interface.inc', 'w')
index_list = list(dataframe.index)
column_list = list(dataframe.columns)

print(column_list)
print(index_list)
print(len(column_list))
print(len(index_list))

def create_label(x_padding, y_padding, grid_width, grid_height, widget_count, x, y, label):
    bounds_x = x_padding + x * grid_width
    bounds_y = y_padding + y * grid_height
    line = f'bounds({bounds_x}, {bounds_y}, {grid_width}, {grid_height}), channel(\\"1 {widget_count}\\"), text(\\"{label}\\"), fontSize(10), outlineColour(255, 255, 255, 255) colour(249, 179, 255, 255) fontColour(\\"black\\") align(\\"centre\\") fontSize(10)' 
    
    return line

# Generate cabbage UI
def generate_csound_ui(screen_width, screen_height, table_x=8, table_y=8):
    grid_width = 0.8 * screen_width / table_x
    grid_height = 0.8 * screen_height / table_y
    x_padding = (screen_width - table_x * grid_width) / 2
    y_padding = (screen_height - table_y * grid_height) / 2
    

    widget_count = 0
    code_lines = []

    for y in range(table_y):
        for x in range(table_x):
            if y == 0:
                #output parameters
                if x > 0:
                    label = column_list[x - 1]
                    # line = create_label(x_padding, y_padding, grid_width, grid_height, widget_count, x, y, label)
                    # code_lines.append(f'cabbageCreate "label", "{line}"')

                    bounds_x = x_padding + x * grid_width
                    bounds_y = y_padding + y * grid_height
                    line = f'bounds({bounds_x}, {bounds_y}, {grid_width}, {grid_height}), channel(\\"rslider{widget_count}\\"), range(0, 1, 0, 1, 0.001), text(\\"{label}\\"), markerColour(23, 54, 23, 255) outlineColour(234, 200, 12, 255) trackerColour(120, 0, 255, 255) colour(60, 50, 30, 255) textColour(0, 0, 0, 255) trackerThickness(1)'
                    code_lines.append(f'cabbageCreate "rslider", "{line}"')
                
            elif x == 0:
                label = index_list[y-1]
                line = create_label(x_padding, y_padding, grid_width, grid_height, widget_count, x, y, label)
                code_lines.append(f'cabbageCreate "label", "{line}"')
            else:
                bounds_x = x_padding + x * grid_width
                bounds_y = y_padding + y * grid_height
                line = f'bounds({bounds_x}, {bounds_y}, {grid_width}, {grid_height}), channel(\\"rslider{widget_count}\\"), range(0, 1, 0, 1, 0.001), text(\\"slider {widget_count}\\"), markerColour(0, 0, 0, 255) outlineColour(255, 255, 255, 255) trackerColour(120, 0, 255, 255) colour(249, 179, 255, 255) textColour(0, 0, 0, 255) trackerThickness(1)'
                code_lines.append(f'cabbageCreate "rslider", "{line}"')
            

            widget_count += 1

    return "\n".join(code_lines)

# Example usage
screen_width = 1200  # Replace with actual screen width
screen_height = 900  # Replace with actual screen height
csound_code = generate_csound_ui(screen_width, screen_height, len(column_list) + 1, len(index_list) + 1)



# Write to cabbage_user_interface.inc file
with open("cabbage_ui.inc", "w") as file:
    file.write(csound_code)

output.close()