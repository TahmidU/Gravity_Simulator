import java.lang.Math; // for Math.pow()

Particle[] particles;

void setup()
{
  size(1020, 720);
  //fullScreen();
  background(0);  //black background

  particles = new Particle[100]; //approx 3000-4000 is the performance threshold

  for (int i = 0; i< particles.length; i++)
  {
    particles[i] = new Particle();  //creates new particles
  }
}

void draw()
{
  background(0);
  for (int i = 0; i< particles.length; i++)
  {
    particles[i].display(); //updates the screen
    
  }
  
}

void mousePressed()
{
  
  
}