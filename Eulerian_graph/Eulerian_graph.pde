/*
The MIT License (MIT)

Copyright (c) 2012 Domenico Bruno "Lobkowitz"

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

// The font to mark each vertex
PFont f;

// n, number of vertices
int n = generate_vertices();

// xx and yy to store the coordinates of the vertices
float[] xx = new float[n];
float[] yy = new float[n];

void setup() {
  size(1000, 1000);
  smooth();
  f = createFont("Lucida Console", 20);
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(.5);
  set_vertices();
  set_edges();
  set_circles();
  print_letters();
  noLoop();
}

// Generates, prints and stores vertices
void set_vertices() {
  for (int i = 0; i < n; i++) {
    float xpos = random(20, width - 25);
    float ypos = random(20, height - 25);
    point(xpos, ypos);
    xx[i] = xpos;
    yy[i] = ypos;    
  }
}

// Connects every vertex with the other n - 1 ones
// Since the graph must be complete
void set_edges() {
  for (int i = n - 1; i > 0; i--) {
    for (int j = 0; j < i; j++) {
      line(xx[i], yy[i], xx[j], yy[j]);
    }
  }
}

// Generates a 2k + 1 pseudo integer
int generate_vertices() {
  float vertices = (int) random(3, 21);
  if (vertices % 2 == 0) {
    vertices += 1;
  }
  // println(vertices);
  return (int) vertices;
}

// Prints a letter close to every vertex
void print_letters() {
  textFont(f, 20);
  fill(255, 0, 0);
  char c; c = 'A';
  for (int i = 0; i < n; i++) {
    // println((char) c);
    String s = Character.toString(c);
    text(c, xx[i] + 5, yy[i] + 20); // 5, 20 offset
    c++;
  }
}

// Mere decoration
void set_circles() {
  noStroke();
  for (int i = 0; i < n; i++) {
    fill(random(255), random(255), random(255), 155);
    float r = random(50, 180);
    ellipse(xx[i], yy[i], r, r);
  }
}
