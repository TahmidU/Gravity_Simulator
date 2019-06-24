class Particle
{
  PVector location;//current position
  PVector direction; //direction at which the object is travelling
  PVector velocity; //constant velocity of the particle in a direction
  float acceleration; //acceleration of particle <-- this should be a vector
  float floatMass;
  float floatForce;
  float diameter = 6;//diameter of the shape
  float distance; //distance between the mouse and particle
  double doubleMass; //mass of the particle
  double doubleForce; //force experienced by the particle  
  double doubleMouseMass; //mass of the mouse
  float red;
  float green;
  
  Particle()
  {
    //default values
    location = new PVector(random(width), random(height));//Randomly positioned on the canvas
    direction = new PVector(0, 0); //direction of the particle
    velocity = new PVector(1,0);
    doubleMass = 5*Math.pow(10, 1);//Try not to have the powers too high
    floatMass = (float) doubleMass;
    distance = dist(location.x, location.y, mouseX, mouseY);
  }

  void display()
  {
    
    fill(red,green,0); //white ellipse shape
    ellipse(location.x, location.y, diameter, diameter);
    distance = dist(location.x, location.y, mouseX, mouseY);
    colourChange();
    particleVelocity();
    gravitate();
    
  }

  void gravitate()
  {

    doubleMouseMass = doubleMass = 5*Math.pow(10, 1);
    distance = constrain(distance,5,25);//force will be too weak or powerful unless constrained

    //F=(GMm)/r^2
    doubleForce = ((doubleMass)*(doubleMouseMass))/Math.pow(distance, 2);
    floatForce = (float) doubleForce;
    //println(doubleForce);


    //F=ma ---> f/m=a
    acceleration = (floatForce/floatMass);  
    //println(floatForce+"/"+floatMass +"="+acceleration);
    
    direction.x = (mouseX - location.x);
    direction.y = (mouseY - location.y);
    //println(mouseX+","+mouseY);
    //println(direction);
    
    direction.normalize();//same direction but magnitude reduced to 1.
    direction.x=direction.x*acceleration;
    direction.y=direction.y*acceleration;
    location.add(direction);
    //println(location);
  }
  
  void particleVelocity()
  { 
    
    velocity.add(direction);
    location.add(velocity);
  }
  
  void colourChange()
  {
    if(distance < 200)
    {
      red = red + 3;
      green = green - 3;
    }
    else
    {
      green = green + 1;
      red = red - 1;
    }
    if(green >= 255)
    {
      green = 255;
    }
    else if(green <= 0)
    {
      green = 0;
    }
    if(red >= 255)
    {
      red = 255;
    }
    else if(red <= 0)
    {
      red = 0;
    }
  }
  
  /*
  void collision()
  {
    if(location.x>width || location.x<0)
    {
      direction.x = -direction.x;
    }

    if(location.y>height || location.y<0)
    {
      direction.x = -direction.x;
    }
  }
  */
}