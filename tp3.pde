// leon antonio rabanal
//https://youtu.be/MbZS5u0ySiM?si=jbCkFZF-Vd7bpUqF

int cant = 10;
PImage cuadrados;
boolean mouseEstaDentro = true;  // si el mouse está en la ventana o no

void setup() {
  size(800, 400);
  cuadrados = loadImage("cuadrados.jpeg");
  reiniciar();
}

void draw() {
  background(255);
  image(cuadrados, 0, 0, 400, 400);
  dibujarCuadricula(6, 6);
}

// Dibujar grilla / colorear al pasar el mouse
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

      // Solo si el mouse está dentro de la ventana
      if (mouseEstaDentro && mouseX > x0 && mouseX < x0 + bloque &&
          mouseY > y0 && mouseY < y0 + bloque) {
        float r = random(0, 255);  // color aleatorio
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

// cuando el mouse entra a la pantalla
void mouseEntered() {
  mouseEstaDentro = true;
}

// cuando el mouse sale de la pantalla
void mouseExited() {
  mouseEstaDentro = false;
}

// Círculos dentro del área derecha al cliclear
void mousePressed() {
  for (int i = 0; i < cant; i++) {
    colorMode(HSB);
    fill(i * 255 / cant, 255, 255);

    float radio = random(30, 60);
    float mitad = radio / 2;

    float x = random(400 + mitad, 800 - mitad);
    float y = random(mitad, 400 - mitad);

    ellipse(x, y, radio, radio);
  }
}


// Reiniciar
void reiniciar() {
  background(255);
}
