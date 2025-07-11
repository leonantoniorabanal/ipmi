//https://www.youtube.com/watch?v=hsHvNWkuKjM
//Leon Antonio Rabanal comision 3
int cant = 10;
PImage cuadrados;
boolean mouseEstaDentro = true;
boolean mostrarCirculos = false;

float x, y, radio;

void setup() {
  size(800, 400);
  cuadrados = loadImage("cuadrados.jpeg");
  reiniciar();
}

void draw() {
  background(255);
  image(cuadrados, 0, 0, 400, 400);
  dibujarCuadricula(6, 6);

  if (mostrarCirculos) {
    for (int i = 0; i < cant; i++) {
      float r = random(30, 60);
      float mitad = r / 2;
      float xCirculo = random(400 + mitad, 800 - mitad);
      float yCirculo = random(mitad, 400 - mitad);

      // función propia que calcula la distancia al centro
      float d = distanciaCentroDerecha(xCirculo, yCirculo);

      // saturación varía con la distancia 
      float saturacion = map(d, 0, 300, 255, 0); 
      float brillo = 255;
      float tono = i * 255.0 / cant;

      colorMode(HSB);
      fill(tono, saturacion, brillo);
      ellipse(xCirculo, yCirculo, r, r);
    }
    mostrarCirculos = false; 
    colorMode(RGB);
  }
}

void dibujarCuadricula(int filas, int columnas) {
  stroke(0);
  strokeWeight(3);
  float bloque = 65;
  float pasoX = bloque + 2;
  float pasoY = bloque + 2;

  for (int j = 0; j < filas; j++) {
    for (int i = 0; i < columnas; i++) {
      float x0 = 400 + i * pasoX;
      float y0 = j * pasoY;

      if (mouseEstaDentro && mouseX > x0 && mouseX < x0 + bloque &&
          mouseY > y0 && mouseY < y0 + bloque) {
        float r = random(0, 255);
        fill(r, 200, 255);
        colorMode(HSB);
      } else {
        fill(255);
        colorMode(RGB);
      }

      for (int k = 0; k < 5; k++) {
        float tamaño = bloque - k * 8;
        rect(x0, y0, tamaño, tamaño);
      }
    }
  }
}

void mouseEntered() {
  mouseEstaDentro = true;
}

void mouseExited() {
  mouseEstaDentro = false;
}

void mousePressed() {
  mostrarCirculos = true;
}

// función propia que retorna un valor
float distanciaCentroDerecha(float x, float y) {
  float centroX = 600;
  float centroY = 200;
  return dist(x, y, centroX, centroY);
}

void reiniciar() {
  background(255);
}
