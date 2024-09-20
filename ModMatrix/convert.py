# import pandas lib as pd
import pandas as pd
import numpy as np


# read by default 1st sheet of an excel file
dataframe1 = pd.read_excel('ModMatrixTable.xlsx', index_col=0, header=0)

# Print the DataFrame to verify it's loaded correctly
print("DataFrame:\n", dataframe1)

counter = 0

parameter_definitions = []

input_parameters = []

coefficients = []

channels = []

modulators = []

output_parameters = []

for row_name in dataframe1.index:

    #write code to lists

    #receive channels for modulators
    channels.append('k' + str(row_name) + ' ' + 'chnget' + ' ' + '"' + str(row_name) + '"')

    #modulator tablew statements
    modulators.append('tablew' + ' ' + 'k' + str(row_name) + ', ' + str(dataframe1.index.get_loc(row_name)) + ', .giModulators')
    
    for col_name in dataframe1.columns:
        
        #tablewrite code for coefficients
        coefficients.append('tableiw' + ' ' + str(dataframe1.at[row_name, col_name]) + ', ' + str(counter) + ', giModScale' + ' ; ' + str(row_name + ' to ' + col_name))

        counter += 1

#input parameters looped seperately here. 
for col_name in dataframe1.columns:
    #tableiw	icps1, 0, giParam_In
    parameter_definitions.append('i' + col_name + ' = 0')
    input_parameters.append('tableiw' + ' ' + 'i' + col_name + ', ' + str(dataframe1.columns.get_loc(col_name)) + ', giParam_In')
    
    #parameters getting read from out table
    #kFreq table	0, giParam_Out
    output_parameters.append('k' + col_name + ' table ' + str(dataframe1.columns.get_loc(col_name)) + ', giParam_Out')
    print('\n')
    
output = open('code.inc', 'w')

print(';____________________________________ \n', file=output)


print(';parameter definitions \n', file=output)

for i in range(len(parameter_definitions)):
    print(parameter_definitions[i], file=output)

print('\n', file=output)

print(';input parameters \n', file=output)

for i in range(len(input_parameters)):
    print(input_parameters[i], file=output)

print('\n', file=output)

for i in range(len(coefficients)):
    print(coefficients[i], file=output)

print('\n', file=output)

for i in range(len(channels)):
    print(channels[i], file=output)

print('\n', file=output)

for i in range(len(modulators)):
    print(modulators[i], file=output)

print('\n', file=output)

for i in range(len(output_parameters)):
    print(output_parameters[i], file=output)

print('\n', file=output)

print(';____________________________________ \n', file=output)

output.close()