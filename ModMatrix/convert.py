# import pandas lib as pd
import pandas as pd
import numpy as np


# read by default 1st sheet of an excel file
dataframe1 = pd.read_excel('ModMatrix/ModMatrixTable.xlsx', index_col=0, header=0)

# Print the DataFrame to verify it's loaded correctly
print("DataFrame:\n", dataframe1)

counter = 0

parameters = []

coefficients = []

channels = []
modulators = []

for row_name in dataframe1.index:
    #print modulators
    #;tablew	kName, Index giModulators
    print('k' + str(row_name) + ' ' + 'chnget' + ' ' + '"' + str(row_name) + '"')
    print('tablew' + ' ' + 'k' + str(row_name) + ', ' + str(dataframe1.index.get_loc(row_name)))
    print('\n')
    
    for col_name in dataframe1.columns:
        

        #print tablewrite code for coefficients
        #print('tableiw' + ' ' + str(dataframe1.at[row_name, col_name]) + ', ' + str(counter) + ', ' + 'giModScale' + ' ; ' + str(row_name + ' to ' + col_name))

        counter += 1


