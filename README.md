Morph Effect

Morph Effect is a creative Processing program that demonstrates smooth transitions between multiple geometric shapes. The program allows users to toggle between different shapes and record the morphing animation as a GIF.

Features

Shape Morphing: Smooth transitions between a circle, star, triangle, and square.
Interactive Controls:
Click the canvas to toggle between shapes.
Press SPACEBAR to save a screenshot of the canvas.
Press R to record a 10-second GIF of the morphing animation.
Dynamic Visualization: A visually captivating morphing effect with customizable shapes.
How to Use

Install Processing:
Download and install the Processing IDE from processing.org.
Install the GifAnimation Library:
Open Processing and navigate to Sketch → Import Library → Add Library.
Search for GifAnimation and install it.
Run the Program:
Open the MorphEffect.pde file in Processing.
Run the sketch by pressing the play button.
Controls:
Click anywhere on the canvas to toggle between shapes (circle, star, triangle, square).
Press SPACEBAR to save a screenshot of the current canvas.
Press R to start recording a 10-second GIF. The GIF will be saved in the sketch folder.
File Structure

MorphEffect/
├── MorphEffect.pde      # Main source code
├── README.md            # Project documentation
└── morph-animation.gif  # Recorded GIF output (optional)
Customization

Shape Details: Modify the totalPoints or radius variables in the code to adjust the number of vertices or size of the shapes.
Recording Duration: Change the recordFrames limit (currently 300 frames for 10 seconds) to extend or shorten the recording.
Color Scheme: Adjust the fill() and background() settings in the draw() method for a different visual aesthetic.
Author

This project was created by Jawad F. Naik as part of the course Elements of Media, taught by Professor Fred Wolflink at the Massachusetts College of Art and Design in Boston, Massachusetts, USA.

License

This project is licensed under the MIT License. See the LICENSE file for details.

Acknowledgments

Special thanks to the Processing Foundation for providing the Processing IDE and to the creators of the GifAnimation library for enabling easy GIF recording.
