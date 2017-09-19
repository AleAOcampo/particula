ArrayList <particula> particulas;

void setup()
{
  size(400,400);
  particulas = new ArrayList <particula>();
  
  for(int i = 0; i<100; i++)
  {
    particulas.add(new particula());
  }
}

void draw()
{
  background(255);
  
  for(particula p: particulas)
  {
    p.display();
    p.movimiento();
  }
  
}

void mousePressed()
{
  particula foo = new particula(mouseX, mouseY);
  particulas.add(foo);
}

class particula
{
  float x,y,v,a,t;
  color c;
  
  particula(float x_, float y_, float v_, float a_, float t_, color c_)
  {
    x = x_;
    y = y_;
    v = v_;
    a = a_;
    t = t_;
    c = c_;
  }
  
  particula()
  {
    x = random(400);
    y = random(400);
    v = random(10);
    a = random(TWO_PI);
    t = random(1,30);
    c = color(random(255), random(255), random(255));
  }
  
  particula(float x_, float y_)
  {
    x = x_;
    y = y_;
    v = random(10);
    a = random(TWO_PI);
    t = random(1,30);
    c = color(random(255), random(255), random(255));
  }
  
  void display()
  {
    pushMatrix();
    translate(x,y);
    fill(c);
    ellipse(0,0,t,t);
    popMatrix();
  }
  
  void movimiento()
  {
    x += random(-a,v);
    y += random(-a,v);
  }
}