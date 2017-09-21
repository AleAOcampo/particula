ArrayList <particula> particulas;
particula k;
particula a;

void setup()
{
  size(400,400);
  k = new particula(100,100,2,0,10,color(255,0,0));
  a = new particula(200,200,2,0,10,color(255,0,0));
  
  particulas = new ArrayList <particula>();
  
  for(int i = 0; i<100; i++)
  {
    particulas.add(new particula());
  }
}

void draw()
{
  background(255);
  k.display();
  k.movimiento();
  a.display();
  a.movimiento();
  
  for(particula p: particulas)
  {
    p.display();
    p.movimiento();
  }
  
}

void mousePressed()
{
  particula k = new particula(mouseX, mouseY);
  particulas.add(k);
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
    v = random(5);
    a = random(TWO_PI);
    t = random(1,30);
    c = color(random(255), random(255), random(255));
  }
  
  void display()
  {
    pushMatrix();
    translate(x,y);
    fill(c);
    ellipse(x,y,t,t);
    popMatrix();
  }
  
  void movimiento()
  {
    x+= cos(a)*v;
    y+= sin(a)*v;
    
    if(x>=370)
    a= random(PI/2, HALF_PI+PI/2);
    
    if(x<=0)
    a= random(-PI/2, PI/2);
    
    if(y>=370)
    a= random(PI, TWO_PI);
    
    if(y<=0)
    a= random(PI);
  }
}
