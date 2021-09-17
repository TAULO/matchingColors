public class Enemy {

    color greenColor = #0BFF14;
    color redColor = #FF0B0B;
    color blueColor = #003CFF;
    color pinkColor = #FF00EF;

    private color[] playerColors = {
        greenColor,
        redColor,
        blueColor,
        pinkColor
    };

    private int xSize;
    private int ySize;
    private int xPos;
    private int yPos;
    private float speed;

    color c;

    Enemy(int xSize, int ySize, int xPos, int yPos, float speed) {
        this.xSize = xSize;
        this.ySize = ySize;
        this.xPos = xPos;
        this.yPos = yPos;
        this.speed = speed;
        c = this.getRandomColor();
    }

    public int getXPos() {
        return this.xPos;
    }

    public int getYPos() {
        return this.yPos;
    }

    public int getXSize() {
        return this.xSize;
    }

    public int getYSize() {
        return this.ySize;
    }

    public void setXPos(int xPos) {
        this.xPos = xPos;
    }

    public void setYPos(int yPos) {
        this.yPos = yPos;
    }

    public float getSpeed() {
        return speed;
    }

    public color getColor() {
        return this.c;
    }

    public void display() {
        rect(xPos, yPos, xSize, ySize);
    }

    public color getRandomColor() {
        float rand = random(playerColors.length - 1);
        return playerColors[(int) rand];
    }

    public void move() { 
        float rand = random(5,20);
        // println("X: " + this.xPos);
        // println("Y: " + this.yPos);
        println(Main.getCb().detectCollision());
        //yPos += speed;
        yPos += speed;
        if (Main.getCb().detectCollision()) {
            // speed = -speed;
            float angle = random(PI/4, PI/4);
            speed = 5 * sin(angle);
        }
        if (Main.getCb().borderColl()) {
            speed = speed*-1;
        }
    }
}