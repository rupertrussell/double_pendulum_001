// Based on code by Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Double Pendulum
// https://youtu.be/uWzPe_S-RVE

// Fork by Rupert Russell
// 10 September 2018
// inspired by https://www.openprocessing.org/sketch/507468



int count = 0;

float r1 = 200;
float r2 = 200;
float m1 = 40;
float m2 = 40;

float Aa1 = PI/2;
float Aa2 = PI/2;
float Aa1_v = 0;
float Aa2_v = 0;

float Ba1 = PI/2;
float Ba2 = PI/2;
float Ba1_v = 0.001;
float Ba2_v = 0.001;

float Ca1 = PI/2;
float Ca2 = PI/2;
float Ca1_v = 0.00100001;
float Ca2_v = 0.00100001;

float g = 1;

float Apx2 = -1;
float Apy2 = -1;

float Bpx2 = -1;
float Bpy2 = -1;

float Cpx2 = -1;
float Cpy2 = -1;

float Acx, Acy;
float Bcx, Bcy;
float Ccx, Ccy;

PGraphics canvas;

void setup() {
  size(900, 900);
  strokeWeight(3);
  background(0);

  Acx = width/2;
  Acy = height/2;

  Bcx = width/2;
  Bcy = height/2;

  Ccx = width/2;
  Ccy = height/2;

  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
}

void draw() {

  imageMode(CORNER);
  image(canvas, 0, 0, width, height);

  float num1 = -g * (2 * m1 + m2) * sin(Aa1);
  float num2 = -m2 * g * sin(Aa1-2*Aa2);
  float num3 = -2*sin(Aa1-Aa2)*m2;
  float num4 = Aa2_v*Aa2_v*r2+Aa1_v*Aa1_v*r1*cos(Aa1-Aa2);
  float den = r1 * (2*m1+m2-m2*cos(2*Aa1-2*Aa2));
  float Aa1_a = (num1 + num2 + num3*num4) / den;


  num1 = -g * (2 * m1 + m2) * sin(Ba1);
  num2 = -m2 * g * sin(Ba1-2*Ba2);
  num3 = -2*sin(Ba1-Ba2)*m2;
  num4 = Ba2_v*Ba2_v*r2+Ba1_v*Ba1_v*r1*cos(Ba1-Ba2);
  den = r1 * (2*m1+m2-m2*cos(2*Ba1-2*Ba2));
  float Ba1_a = (num1 + num2 + num3*num4) / den;



  num1 = -g * (2 * m1 + m2) * sin(Ca1);
  num2 = -m2 * g * sin(Ca1-2*Ca2);
  num3 = -2*sin(Ca1-Ca2)*m2;
  num4 = Ca2_v*Ca2_v*r2+Ca1_v*Ca1_v*r1*cos(Ca1-Ca2);
  den = r1 * (2*m1+m2-m2*cos(2*Ca1-2*Ca2));
  float Ca1_a = (num1 + num2 + num3*num4) / den;

  num1 = 2 * sin(Aa1-Aa2);
  num2 = (Aa1_v*Aa1_v*r1*(m1+m2));
  num3 = g * (m1 + m2) * cos(Aa1);
  num4 = Aa2_v*Aa2_v*r2*m2*cos(Aa1-Aa2);
  den = r2 * (2*m1+m2-m2*cos(2*Aa1-2*Aa2));
  float Aa2_a = (num1*(num2+num3+num4)) / den;

  num1 = 2 * sin(Ba1-Ba2);
  num2 = (Ba1_v*Ba1_v*r1*(m1+m2));
  num3 = g * (m1 + m2) * cos(Ba1);
  num4 = Ba2_v*Ba2_v*r2*m2*cos(Ba1-Ba2);
  den = r2 * (2*m1+m2-m2*cos(2*Ba1-2*Ba2));
  float Ba2_a = (num1*(num2+num3+num4)) / den;


  num1 = 2 * sin(Aa1-Aa2);
  num2 = (Aa1_v*Aa1_v*r1*(m1+m2));
  num3 = g * (m1 + m2) * cos(Aa1);
  num4 = Aa2_v*Aa2_v*r2*m2*cos(Aa1-Aa2);
  den = r2 * (2*m1+m2-m2*cos(2*Aa1-2*Aa2));
  float Ca2_a = (num1*(num2+num3+num4)) / den;

  translate(Acx, Acy);


  float Ax1 = r1 * sin(Aa1);
  float Ay1 = r1 * cos(Aa1);

  float Ax2 = Ax1 + r2 * sin(Aa2);
  float Ay2 = Ay1 + r2 * cos(Aa2);


  float Bx1 = r1 * sin(Ba1);
  float By1 = r1 * cos(Ba1);

  float Bx2 = Bx1 + r2 * sin(Ba2);
  float By2 = By1 + r2 * cos(Ba2);


  float Cx1 = r1 * sin(Ca1);
  float Cy1 = r1 * cos(Ca1);

  float Cx2 = Cx1 + r2 * sin(Ca2);
  float Cy2 = Cy1 + r2 * cos(Ca2);

  stroke(255, 0, 0);
  fill(255, 0, 0);
  line(0, 0, Ax1, Ay1);
  ellipse(Ax1, Ay1, m1/5, m1/5);
  line(Ax1, Ay1, Ax2, Ay2);
  ellipse(Ax2, Ay2, m2/5, m2/5);

  stroke(0, 255, 0);
  fill(0, 255, 0);
  line(0, 0, Bx1, By1);
  fill(0);
  ellipse(Bx1, By1, m1/5, m1/5);
  line(Bx1, By1, Bx2, By2);
  fill(0);
  ellipse(Bx2, By2, m2/5, m2/5);

  stroke(0, 0, 255);
  fill(0, 0, 255);
  line(0, 0, Cx1, Cy1);
  fill(0);
  ellipse(Cx1, Cy1, m1/5, m1/5);
  line(Cx1, Cy1, Cx2, Cy2);
  fill(0);
  ellipse(Cx2, Cy2, m2/5, m2/5);

  Aa1_v += Aa1_a;
  Aa2_v += Aa2_a;
  Aa1 += Aa1_v;
  Aa2 += Aa2_v;

  Ba1_v += Ba1_a;
  Ba2_v += Ba2_a;
  Ba1 += Ba1_v;
  Ba2 += Ba2_v;

  Ca1_v += Ca1_a;
  Ca2_v += Ca2_a;
  Ca1 += Ca1_v;
  Ca2 += Ca2_v;

  // a1_v *= 0.99;
  // a2_v *= 0.99;

  canvas.beginDraw();
  // canvas.background(0, 1);

  canvas.translate(Acx, Acy);
  canvas.stroke(0);
  canvas.strokeWeight(1);
  if (frameCount > 1) {
    canvas.stroke(255, 0, 0);
    canvas.line(Apx2, Apy2, Ax2, Ay2);
    canvas.stroke(0, 255, 0);
    canvas.line(Bpx2, Bpy2, Bx2, By2);
    canvas.stroke(0, 0, 255);
    canvas.line(Cpx2, Cpy2, Cx2, Cy2);
  }
  canvas.endDraw();


  Apx2 = Ax2;
  Apy2 = Ay2;

  Bpx2 = Bx2;
  Bpy2 = By2;

  Cpx2 = Cx2;
  Cpy2 = Cy2;
}


void mouseClicked() {

  save("double " + count + ".png");
  count++;
}
