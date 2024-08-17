import numpy as np
import matplotlib.pyplot as plt

# Parameters for the Julia Set
width, height = 800, 800  # Image dimensions
x_min, x_max = -2, 2      # X-axis range
y_min, y_max = -2, 2      # Y-axis range
c = complex(-0.23432, -0.8765)  # Julia set constant
max_iter = 200             # Maximum number of iterations

# Generate the complex plane
x = np.linspace(x_min, x_max, width)
y = np.linspace(y_min, y_max, height)
X, Y = np.meshgrid(x, y)
Z = X + 1j * Y

# Preallocate the iteration count array
iteration = np.zeros(Z.shape, dtype=int)

# Julia set iteration using vectorized operations
def julia_set(Z, c, max_iter):
    for i in range(max_iter):
        mask = np.abs(Z) < 2
        Z[mask] = Z[mask]**2 + c
        iteration[mask] += 1
    return iteration

# Generate the Julia set and store iterations
iterations = julia_set(Z, c, max_iter)

# Downsample by selecting every nth pixel
downsample_factor = 10  # Change this to control the downsampling
sampled_real_part = np.real(Z)[::downsample_factor, ::downsample_factor]
sampled_imag_part = np.imag(Z)[::downsample_factor, ::downsample_factor]
print(sampled_imag_part)

scale = [60, 62, 63, 65, 66, 68, 69, 71]  # MIDI note numbers

# Vectorized mapping functions
def map_to_note(values, scale, min_val=-2, max_val=2):
    # Interpolate values to scale indices
    scale_indices = np.interp(values, [min_val, max_val], [0, len(scale) - 1])
    # Convert indices to integers
    scale_indices = np.round(scale_indices).astype(int)
    # Map each index to the corresponding note in the scale
    return np.array([scale[i] for i in scale_indices.flatten()]).reshape(values.shape)

def map_to_duration(values, min_val=-2, max_val=2, duration_min=0.125, duration_max=4.0):
    return np.interp(values, [min_val, max_val], [duration_min, duration_max])

# Map the downsampled data
midi_notes = map_to_note(sampled_real_part, scale)
durations = map_to_duration(sampled_imag_part)

# Convert to LilyPond format
note_names = ['c', 'd', 'ees', 'f', 'fis', 'gis', 'a', 'b']

def midi_to_lilypond(midi_note):
    note_names = ['c', 'cis', 'd', 'dis', 'e', 'f', 'fis', 'g', 'gis', 'a', 'ais', 'b']
    octave = (midi_note // 12) - 4  # Calculate the octave
    note_name = note_names[midi_note % 12]
    
    # Ensure that the number of apostrophes is correct
    if octave < 0:
        return note_name + ',' * abs(octave)  # Prepend commas for negative octaves
    elif octave > 0:
        return note_name + "'" * octave  # Append apostrophes for positive octaves
    else:
        return note_name  # No apostrophes or commas for octave 4 (middle octave)


def duration_to_lilypond(duration):
    if duration >= 4.0:
        return '1'
    if duration >= 3.0:
        return '2.'
    elif duration >= 2.0:
        return '2'
    elif duration >= 1.5:
        return '4.'
    elif duration >= 1.0:
        return '4'
    elif duration >= 0.75:
        return '8.'
    elif duration >= 0.5:
        return '8'
    elif duration >= 0.3 * 0.5:
        return '16.'
    else:
        return '16'
# Flatten the arrays and limit the number of notes
max_notes = 100  # Change this to control the maximum number of notes
flattened_notes = midi_notes.flatten()[:max_notes]
flattened_durations = durations.flatten()[:max_notes]

# Generate LilyPond output with vectorized operations
lilypond_output = " ".join([
    f"{midi_to_lilypond(note)}{duration_to_lilypond(duration)}"
    for note, duration in zip(flattened_notes, flattened_durations)
])

# Save the output to a LilyPond file
with open("julia_set_music.ly", "w") as f:
    f.write("\\version \"2.24.3\" \n music = \\absolute {\n")
    
    notes_per_line = 12
    notes = lilypond_output.split()
    output_lines = []
    
    for i in range(0, len(notes), notes_per_line):
        output_lines.append(' '.join(notes[i:i+notes_per_line]))
    
    # Join the lines with newline characters
    output_string = '\n'.join(output_lines)
    
    # Write the output string to the file
    f.write(output_string)
    
    f.write("\n}")
    f.write("\n")
    f.write("\\score { \\music \\layout {} \\midi {}}")

# Plot and save the image
plt.figure(figsize=(10, 10))
plt.imshow(iterations, extent=[x_min, x_max, y_min, y_max], cmap='inferno')
plt.colorbar()
plt.title(f"Julia Set for c = {c}")
plt.savefig("julia_set.png")
plt.show()
