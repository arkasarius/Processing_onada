import toxi.audio.*;
import toxi.color.*;
import toxi.color.theory.*;
import toxi.data.csv.*;
import toxi.data.feeds.*;
import toxi.data.feeds.util.*;
import toxi.doap.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh2d.*;
import toxi.geom.nurbs.*;
import toxi.image.util.*;
import toxi.math.*;
import toxi.math.conversion.*;
import toxi.math.noise.*;
import toxi.math.waves.*;
import toxi.music.*;
import toxi.music.scale.*;
import toxi.net.*;
import toxi.newmesh.*;
import toxi.nio.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;
import toxi.physics3d.*;
import toxi.physics3d.behaviors.*;
import toxi.physics3d.constraints.*;
import toxi.processing.*;
import toxi.sim.automata.*;
import toxi.sim.dla.*;
import toxi.sim.erosion.*;
import toxi.sim.fluids.*;
import toxi.sim.grayscott.*;
import toxi.util.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;
import toxi.volume.*;

import controlP5.*;
PImage img, img2;
ControlP5 cp5;
particle[] p;
ArrayList<particle> par=  new ArrayList();
ArrayList<PVector> points=  new ArrayList();
int number=1;
int limit=15;
ToxiclibsSupport gfx;
Voronoi voronoi;

void setup() {
  size(540, 540);
  cp5= new ControlP5(this);
  cp5.addButton("generar").setValue(0).setPosition(0, 540-80).setSize(200, 80);

  String[] lines = loadStrings("1.txt");
  for (int i = 0; i < lines.length; i=i+11) {
    String[] parts = lines[i].split(":");
    int x= Integer.parseInt(parts[0]);
    int y= Integer.parseInt(parts[1]);
    points.add(new PVector(x, y));
  }
  background(#E7D8B9);
}

void draw() {
}

//el boton se llama al principio por lo que se tiene que programar una llamda falsa al principio
int generar =-1;
void generar() {
  generar++;
  if (generar>0) {
    generar=0;
    points();
  }
}


void points() {
  background(#E7D8B9);
  points.clear();
  number++;
  if (number>15) {
    number=0;
  } 
  String[] lines = loadStrings(Integer.toString(number)+".txt");
  //println("there are " + lines.length + " lines");
  for (int i = 0; i < lines.length; i=i+23) {// 11 es estable
    String[] parts = lines[i].split(":");
    int x= Integer.parseInt(parts[0]);
    int y= Integer.parseInt(parts[1]);
    points.add(new PVector(x, y));
  }
  fill(#0A5A6F);
  //noFill();
  gfx = new ToxiclibsSupport( this );
  voronoi = new Voronoi();  
  for (PVector a : points) {
    ellipse(a.x, a.y, 2, 2);
    //voronoi.addPoint( new Vec2D( a.x, a.y ));
  }
  //for ( Polygon2D polygon : voronoi.getRegions() ) {
  //gfx.polygon2D( polygon );
  //}
}
