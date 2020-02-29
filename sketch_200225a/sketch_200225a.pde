// Variables globales
Agent agente;
ArrayList<wall>walls=new ArrayList<wall>(); 
int[][] world = {    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
                     {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
                     {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0},
                     {1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0},
                     {1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0},
                     {1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1},
                     {1, 2, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1},
                     {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
                     {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
                     {1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1},
                     {1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1},
                     {1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0},
                     {1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0},
                     {1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0}};
                     
  int coordenadaJugadorY=1;
  int coordenadaJugadorX=1;
 
void setup() {
 frameRate(4);

  size(900, 750);
  
  int col=16;
  int row=14;
 
 
  agente= new Agent(coordenadaJugadorY*50,coordenadaJugadorX*50);
  
  int x=0;
  int y=0;
  for (int i = 0; i < row; i++){
    x=0;
    for (int j = 0; j < col; j++) {
      if(world[i][j]==1){
          walls.add( new wall(x,y,false));
      }else if(world[i][j]==2){
          walls.add( new wall(x,y,true));
      }
      x+=50;
    }
    y+=50;
  }
 
  
   
} 
void draw() {
 
  background(255, 255, 255); 
  noStroke(); 
 
  agente.draw();
  agente.move();
  
  for(int i = 0; i < walls.size(); i++){
    walls.get(i).draw();
  }
 
}
 
class Agent {
 
  //Propiedades del cuadrado
  float x;
  float y;
  
  //Propiedades del agente
  int numeroDeIteraciones;
  boolean objetivoAlcanzado=false;

  //Estados del agente
   int X0=0;
   int X1=0;
   int X2=0;
   int X3=0;
   int X4=0;
    
   int X5=0;
   int X6=0;
   int X7=0;
   int X8=0;
   
   
 
  Agent(float _x, float _y){
    numeroDeIteraciones=0;
    x = _x;
    y = _y;
  }
 
  void draw(){
    fill(0,100,0);
    rect(x,y,50,50);
  }
  
  void reinicioDeEstados(){
    X0=0;
    X1=0;
    X2=0;
    X3=0;
    X4=0;
    
    X5=0;
    X6=0;
    X7=0;
    X8=0;
  }
  
  
  void modificacionDeEstados(){
    if(world[coordenadaJugadorX-1][coordenadaJugadorY]==1 && world[coordenadaJugadorX-1][coordenadaJugadorY+1]==1){
      X1=1;
    }
    
    
    if(world[coordenadaJugadorX][coordenadaJugadorY+1]==1 && world[coordenadaJugadorX+1][coordenadaJugadorY+1]==1){
      X2=1;
    }


    if(world[coordenadaJugadorX+1][coordenadaJugadorY]==1 && world[coordenadaJugadorX+1][coordenadaJugadorY-1]==1){
      X3=1;
    }
    
    if(world[coordenadaJugadorX][coordenadaJugadorY-1]==1 && world[coordenadaJugadorX-1][coordenadaJugadorY-1]==1){
      X4=1;
    }
    
    if(world[coordenadaJugadorX-1][coordenadaJugadorY+1]==1 && world[coordenadaJugadorX][coordenadaJugadorY+1]==1 && world[coordenadaJugadorX+1][coordenadaJugadorY]==0 && world[coordenadaJugadorX+1][coordenadaJugadorY+1]==0){
      X5=1;
    }
    
    if(world[coordenadaJugadorX+1][coordenadaJugadorY]==1 && world[coordenadaJugadorX+1][coordenadaJugadorY+1]==1 && world[coordenadaJugadorX][coordenadaJugadorY-1]==0 && world[coordenadaJugadorX+1][coordenadaJugadorY-1]==0){
      X6=1;
    }
    
    if(world[coordenadaJugadorX+1][coordenadaJugadorY-1]==1 && world[coordenadaJugadorX][coordenadaJugadorY-1]==1 && world[coordenadaJugadorX-1][coordenadaJugadorY]==0 && world[coordenadaJugadorX-1][coordenadaJugadorY-1]==0){
      X7=1;
    }
    
    if(world[coordenadaJugadorX-1][coordenadaJugadorY]==1 && world[coordenadaJugadorX-1][coordenadaJugadorY-1]==1 && world[coordenadaJugadorX][coordenadaJugadorY+1]==0 && world[coordenadaJugadorX-1][coordenadaJugadorY+1]==0){
      X8=1;
    }

    if(world[coordenadaJugadorX][coordenadaJugadorY]==0 && world[coordenadaJugadorX+1][coordenadaJugadorY+1]==0 && world[coordenadaJugadorX+1][coordenadaJugadorY]==0 && world[coordenadaJugadorX+1][coordenadaJugadorY-1]==0
       && world[coordenadaJugadorX][coordenadaJugadorY-1]==0 && world[coordenadaJugadorX-1][coordenadaJugadorY-1]==0 && world[coordenadaJugadorX-1][coordenadaJugadorY]==0 && world[coordenadaJugadorX-1][coordenadaJugadorY+1]==0){
      X0=1;
    }
    
  }
  
  void tomaDecisionBasadoEnEstados(){
     // Este
    if(X1==1 && X2==0){
      x+=50;
      coordenadaJugadorY+=1;
    }
    // Sur
    else if(X2==1 && X3==0){
      y+=50;
      coordenadaJugadorX+=1;
    }
    //Oeste
    else if(X3==1 && X4==0){
      x-=50;
      coordenadaJugadorY-=1;
    }
    //Norte
    else if(X4==1 && X1==0){
      y-=50;
      coordenadaJugadorX-=1;
    }
    //Sur y Este
    else if(X5==1){
       y+=50;
      coordenadaJugadorX+=1;
       x+=50;
      coordenadaJugadorY+=1;
    }
     //Oeste y Sur
    else if(X6==1){
      x-=50;
      coordenadaJugadorY-=1;
      y+=50;
      coordenadaJugadorX+=1;
    }
    //Norte y Oeste
    else if(X7==1){
      y-=50;
      coordenadaJugadorX-=1;
       x-=50;
      coordenadaJugadorY-=1;
    }
    //Este y Norte
    else if(X8==1){
     x+=50;
     coordenadaJugadorY+=1;
      y-=50;
      coordenadaJugadorX-=1;
    }
    //Este 
    else if(X0==1){
     x+=50;
     coordenadaJugadorY+=1;
    }
  }
 
  void move(){
    if(objetivoAlcanzado==false){
      numeroDeIteraciones+=1;
      
      reinicioDeEstados();
      
      modificacionDeEstados();
      
      tomaDecisionBasadoEnEstados();
      
      print(numeroDeIteraciones+" \n");
      if(world[coordenadaJugadorX][coordenadaJugadorY]==2){
        objetivoAlcanzado=true;
      }
    }
  }
}
 
class wall {
  
  float x;
  float y;
  float w;
  float h;
  boolean objective;
 
  wall(float _x, float _y,boolean _objective){
    x = _x;
    y = _y;
    w = 50;
    h = 50;
    objective=_objective;
  }
 
  void draw(){
    if(objective){
      fill(255,255,153);
      rect(x,y,w,h);
    }else{
      fill(139,0,0);
      rect(x,y,w,h);
    }
  }
 
}
