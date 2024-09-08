import matplotlib.pyplot as plt
from PIL import Image

# Open the image
image_path = '../assets/tic-tac-toe/board-indexed.png'
img = Image.open(image_path)

# Create a plot
fig, ax = plt.subplots()

# Display the image
ax.imshow(img)

# Coordinates for the lines
shift = 0.5
lines = [
    ([0 + shift, 0 + shift], [0 + shift, 2 + shift]),  # Vertical left
    ([2 + shift, 2 + shift], [0 + shift, 2 + shift]),  # Vertical right
    ([0 + shift, 2 + shift], [2 + shift, 2 + shift]),  # Horizontal top
    ([0 + shift, 2 + shift], [0 + shift, 0 + shift]),  # Horizontal bottom
    ([0 + shift, 2 + shift], [2 + shift, 0 + shift]),  # Diagonal \
    ([0 + shift, 2 + shift], [0 + shift, 2 + shift]),  # Diagonal /
    ([1 + shift, 1 + shift], [0 + shift, 2 + shift]),  # Vertical middle
    ([0 + shift, 2 + shift], [1 + shift, 1 + shift])   # Horizontal middle
]


# Scale factors to match the coordinates with the image
scale_x = img.size[0] / 3
scale_y = img.size[1] / 3

# Plot lines with specified colors
colors = ['red', 'red', 'blue', 'blue', 'green', 'green', 'red', 'blue']
for line, color in zip(lines, colors):
    ax.plot([x * scale_x for x in line[0]], [y * scale_y for y in line[1]], color=color, linewidth=2)

# Hide the axes
ax.axis('off')

# Show the plot
plt.show()