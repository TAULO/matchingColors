public class Player {

    color greenColor = #0BFF14;
    color redColor = #FF0B0B;
    color blueColor = #003CFF;
    color pinkColor = #FF00EF;

    private int xSize;
    private int ySize;

    private color[] playerColors = {greenColor, redColor, blueColor, pinkColor}; 
    private int colorIndeks;

    private int playerPosX = width / 2;
    private int playerPosY = 1100;

    private color c; 

    // public PlayerBehaviour playerBehaviour;

    Player(int xSize, int ySize) {
       this.xSize = xSize;
       this.ySize = ySize;
       colorIndeks = 0;
       c = playerColors[colorIndeks];
    }

    // strategy pattern not working
    // public void setPlayerBehaviour(PlayerBehaviour playerBehaviour) {
    //    this.playerBehaviour = playerBehaviour;
    // }

    // public Player getPlayerBehaviour() {
    //     return playerBehaviour.setSize();
    // }

    public int getPlayerXPos() {
        return playerPosX;
    }

    public int getPlayerYPos() {
        return playerPosY;
    }

    public int getPlayerXSize() {
        return xSize;
    }

    public void setXSize(int xSize) {
        this.xSize = xSize;
    }
    
    public void setYSize(int ySize) {
        this.ySize = ySize;
    }

    public int getPlayerYSize() {
        return ySize;
    }

    public color getPlayerColor() {
        return c; 
    }

    public void show() {
        // guard for indeks out of bounds
        if (colorIndeks == -1) {
            colorIndeks = playerColors.length - 1;   
        } else if (colorIndeks > playerColors.length - 1) {
            colorIndeks = 0;
        } else {
            fill(playerColors[colorIndeks]); //draws the current color on player 
            c = playerColors[colorIndeks]; //stores the current color in variable c
        }
        //text("PlayerPosX: " + playerPosX, this.playerPosX, this.playerPosY);
        rect(playerPosX - xSize / 2, playerPosY, xSize, ySize);
    }

    public void move(int speed) {
        // player goes off border and becomes more than width 
        if (playerPosX >= width) {
          playerPosX = 0; 
        //  player goes off border and becomes less than width 
        } else if (playerPosX <= 0) {
            playerPosX = width;
        }
        playerPosX += speed;
    }

    // changes the color of the player.
    public void changeColor(int i) {
        colorIndeks += i;
    }
}