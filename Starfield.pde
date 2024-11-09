Particle[] snow = new Particle[500];
PImage snowball;

void setup()
{
  size (800,800);
  for (int i =1;i <snow.length;i++) //sets everything in one array
  {
    snow[i]= new Particle();
    snow[0]= new OddballParticle();
  }
  snowball=loadImage("snowball.jpg");
}
void draw()
{
  background (3, 165, 252);
  snow[0].move();
  snow[0].show();

  fill(170, 222, 250);
  rect(0,680,800,800);
}

class Particle
{
  double myX,myY,mySpeed,myAngle;
  double yz;//temp
  int myColor;
  Particle ()
  {
    myX = 400;
    myY = 700;
    myAngle = ((Math.random()*Math.PI)+Math.PI);
    myColor = color((int)(Math.random()*20)+230, (int)(Math.random()*70)+140,(int)(Math.random()*100));
    mySpeed = (Math.random()*8)+2;
  }
  void show ()
  {
    fill(myColor);
    noStroke();
    rect((float)myX,(float)myY,5,5);
  }
  
  void move()
  {
    myX=myX+Math.cos(myAngle)*mySpeed;
    myY=myY+Math.sin(myAngle)*mySpeed;
  } 
}


class OddballParticle extends Particle
{
  OddballParticle(){
    myY=0;
    myX=360;
  }

  void move()
  {
    if (myY<=625)
    {
         myY=myY-Math.sin(myAngle)*mySpeed;
    }
  }
  void show()
  {
    image(snowball,(float)myX,(float)myY,80,80);
    if(myY >=620.0)
    {
       background (256,256,256);
     for (int i=1;i<snow.length;i++)
      {
        snow[i].move();
        snow[i].show();

      }
    }
  }

}
