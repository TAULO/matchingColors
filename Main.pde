private Player p;

private int sceneIndex;

private CatchTheColor ctc; 
private static ColorBounce cb; 

void setup() {
    size(1400, 1200);
    p = new Player(150, 50);
    ctc = new CatchTheColor();
    cb = new ColorBounce();
}

/*              ---Scene indeks---
    indeks: 0   - startScreen
    indeks: 1   - difficultyScreen for catch the color
    indeks: 2   - catch the color game mode
    indeks: 3   - color bounce game
*/
void draw() {
    switch (sceneIndex) {
        case 0:
            this.startScreen();
        break;
        case 1:
            ctc.difficultyScreen();
        break;
        case 2: // game: catch the color
            background(0, 0, 0);
            p.show();
            ctc.displayScore();
            ctc.spawnEnemies();
            cb.detectCollision();
        //  text("X: " + mouseX, mouseX + 15, mouseY - 5);
        //  text("Y: " + mouseY, mouseX + 15, mouseY + 15);
        break;
        case 3: // game: color bounce
            background(0,0,0);
            p.show();
            cb.spawnEnemies();
            cb.borderColl();
        break;
    }
}

public static ColorBounce getCb() {
    return cb;
}

private void movePlayer(int speed) {
    if (key == 'a') {
        p.move(-speed);
    } else if (key == 'd') {
        p.move(speed);
    }
}

private void changePlayerColor() {
    if (key == 'w') {
        p.changeColor(1);
    } else if (key == 's') {
        p.changeColor(-1);
    }
}

private void startScreen() {
    background(0, 0, 0);
    fill(255);
    rect(width / 2 - 232, 200, 465, 100);
    rect(width / 2 - 232, 350, 465, 100);
    textSize(20);
    text("X: " + mouseX, mouseX + 15, mouseY - 5);
    text("Y: " + mouseY, mouseX + 15, mouseY + 15);
    fill(0);
    textSize(50);
    text("Play catch the color!", 490, 265);
    text("Play color bounce!", 505, 420);
}

private void onClickSceneChanger() {
    // mouse pos is within the "Start game" button
    // play catch the color
    if (this.mouseX >= width / 2 - 232 && this.mouseX <= 932 && this.mouseY >= 200 && this.mouseY <= 300 && this.sceneIndex == 0) {
        this.sceneIndex = 1; // pick diff indeks
    } else if (this.mouseX >= width / 2 - 232 && this.mouseX <= 932 && this.mouseY >= 350 && this.mouseY <= 450 && this.sceneIndex == 0) {
        this.sceneIndex = 3; // play color bounce
    } else if (this.mouseX >= width / 2 - 125 && this.mouseX <= 825 && this.mouseY >= 200 && this.mouseY <= 300 && this.sceneIndex == 1) { // easy
        ctc.setDifficulty(1); // set diff to easy
        this.sceneIndex = 2;
    } else if (this.mouseX >= width / 2 - 125 && this.mouseX <= 825 && this.mouseY >= 350 && this.mouseY <= 450 && this.sceneIndex == 1) { // normal
        ctc.setDifficulty(2); // set diff to normal
        this.sceneIndex = 2;
    } else if (this.mouseX >= width / 2 - 125 && this.mouseX <= 825 && this.mouseY >= 500 && this.mouseY <= 600 && this.sceneIndex == 1) { // hard
        ctc.setDifficulty(3); // set diff to hard
        this.sceneIndex = 2;
    } else if (this.mouseX >= width / 2 - 125 && this.mouseX <= 825 && this.mouseY >= 650 && this.mouseY <= 750 && this.sceneIndex == 1) { // expert
        ctc.setDifficulty(4); // set diff to expert
        this.sceneIndex = 2;
    } 
}

void keyPressed() {
    this.movePlayer(20);
    this.changePlayerColor();
}

void keyReleased() {
    this.movePlayer(0);
}

void mousePressed() {
    this.onClickSceneChanger();
}


