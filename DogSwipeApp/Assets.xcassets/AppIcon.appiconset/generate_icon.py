#!/usr/bin/env python3
from PIL import Image, ImageDraw, ImageFont
import os

# Create a 1024x1024 icon
size = 1024
img = Image.new('RGB', (size, size), color='#4A90E2')

draw = ImageDraw.Draw(img)

# Draw a paw print design
def draw_paw(draw, center_x, center_y, scale=1):
    # Main pad (center)
    pad_size = int(180 * scale)
    draw.ellipse([center_x - pad_size//2, center_y - pad_size//2, 
                  center_x + pad_size//2, center_y + pad_size//2], 
                 fill='white')
    
    # Toes (4 smaller circles)
    toe_size = int(80 * scale)
    toe_positions = [
        (center_x - 120*scale, center_y - 150*scale),  # Top left
        (center_x, center_y - 180*scale),               # Top center
        (center_x + 120*scale, center_y - 150*scale),  # Top right
        (center_x - 60*scale, center_y - 120*scale),   # Middle left
    ]
    
    for tx, ty in toe_positions:
        draw.ellipse([tx - toe_size//2, ty - toe_size//2,
                     tx + toe_size//2, ty + toe_size//2],
                    fill='white')

# Draw the paw in the center
draw_paw(draw, size//2, size//2 + 50, 1.0)

# Add a heart shape above the paw
heart_y = 250
heart_size = 60
# Left circle of heart
draw.ellipse([size//2 - heart_size - 20, heart_y, 
              size//2 - 20, heart_y + heart_size], fill='#FF6B6B')
# Right circle of heart
draw.ellipse([size//2 + 20, heart_y, 
              size//2 + heart_size + 20, heart_y + heart_size], fill='#FF6B6B')
# Bottom triangle of heart
draw.polygon([
    (size//2 - heart_size - 20, heart_y + heart_size//2),
    (size//2 + heart_size + 20, heart_y + heart_size//2),
    (size//2, heart_y + heart_size + 40)
], fill='#FF6B6B')

# Save the icon
img.save('AppIcon-1024.png')
print("App icon created successfully!")
