; opcodes for cellular automata
; Oeyvind Brandtsegg 2017, 2023

opcode ca_update2D, i[][], i[][]
    ; Process one generation of the Cellular Automaton in a 2D grid
    iCells[][] xin
    iRows init 0
    iCols init 0

    ; Get the number of rows
    icount1 = 0
    while icount1 < lenarray(iCells) do
        iRows += 1
        icount1 += 1
    od

    ; Get the number of columns (assuming all rows have the same number of elements)
    if iRows > 0 then
        iCols = lenarray(iCells)
    endif
    
    iOutput[][] init iRows, iCols ; initialize iOutput array with zeros
    
    icount1 = 0
    while icount1 < iRows do
        icount2 = 0
        while icount2 < iCols do
            icell = iCells[icount1][icount2]
            
            ; Calculate the number of alive neighbors (Moore neighborhood)
            ilive_neighbors = iCells[wrap((icount1-1), 0, iRows)][wrap((icount2-1), 0, iCols)] + \
                              iCells[wrap((icount1-1), 0, iRows)][icount2] + \
                              iCells[wrap((icount1-1), 0, iRows)][wrap((icount2+1), 0, iCols)] + \
                              iCells[icount1][wrap((icount2-1), 0, iCols)] + \
                              iCells[icount1][wrap((icount2+1), 0, iCols)] + \
                              iCells[wrap((icount1+1), 0, iRows)][wrap((icount2-1), 0, iCols)] + \
                              iCells[wrap((icount1+1), 0, iRows)][icount2] + \
                              iCells[wrap((icount1+1), 0, iRows)][wrap((icount2+1), 0, iCols)]
                              
            ; Apply the Life-like cellular automaton rules
            if (icell == 1) then
                ; Any live cell with fewer than two or more than three live neighbours dies
                if (ilive_neighbors < 2) || (ilive_neighbors > 3) then
                    iOutput[icount1][icount2] = 0
                ; Any live cell with two or three live neighbours lives
                else
                    iOutput[icount1][icount2] = 1
                endif
            else
                ; Any dead cell with exactly three live neighbours becomes alive
                if (ilive_neighbors == 3) then
                    iOutput[icount1][icount2] = 1
                else
                    iOutput[icount1][icount2] = 0
                endif
            endif
            
            icount2 += 1
        od
        icount1 += 1
    od
    
    xout iOutput
endop




opcode ca_print_cells2D, 0, i[][]
    ; print one generation of the Cellular Automaton in a 2D grid
    iCells[][] xin
    iRows init 0
    iCols init 0

    ; Get the number of rows
    icount1 = 0
    while icount1 < lenarray(iCells) do
        iRows += 1
        icount1 += 1
    od

    ; Get the number of columns (assuming all rows have the same number of elements)
    if iRows > 0 then
        iCols = lenarray(iCells)
    endif

    icount1 = 0
    while icount1 < iRows do
        icount2 = 0
        while icount2 < iCols do
            icell = iCells[icount1][icount2]
            if icell == 1 then
                Scell = "# "
            else
                Scell = ". "
            endif
            prints(Scell)
            icount2 += 1
        od
        prints("\n")
        icount1 += 1
    od
    prints("\n")
endop