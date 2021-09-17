public class CatchTheColor {
    
    private ArrayList<Enemy> highScore;
    ArrayList<Enemy> enemies = new ArrayList<>();

    CatchTheColor() {
        highScore = new ArrayList<>();
    }
    
    public void difficultyScreen() {
        background(0, 0, 0);
        fill(255);
        rect(width / 2 - 125, 200, 250, 100); 
        rect(width / 2 - 125, 350, 250, 100); 
        rect(width / 2 - 125, 500, 250, 100); 
        rect(width / 2 - 125, 650, 250, 100);
        text("X: " + mouseX, mouseX + 15, mouseY - 5); 
        text("Y: " + mouseY, mouseX + 15, mouseY + 15);  
        fill(0);
        textSize(50);
        text("EASY", 650, 265);
        text("NORMAL", 615, 415);
        text("HARD", 645, 565);
        text("EXPERT", 620, 715);
    }
    
    public void displayScore() {
        text(this.getScore(), 100, 100);
    }
    
    public int getScore() {
        return this.highScore.size();
    }

    public void removeScore(Enemy e) {
        this.highScore.remove(e);
    }

    public void addScore(Enemy e) {
        this.highScore.add(e);
    }

     public ArrayList<Enemy> getEnemies() {
        return new ArrayList<Enemy>(enemies);
    }

    public void addEnemey(Enemy e) {
        this.enemies.add(e);
    }

    public void spawnEnemies() {
        for (Enemy enemy : enemies) {
            fill(enemy.getColor());
            enemy.display();
            enemy.move();
        }
    }

    //method is private because other games will create their own enemies
    private void createEnemies(int enemiesCount) {
        for (int i = 0; i < enemiesCount; i++) {
            float randXPos = random(0, width);
            float randYPos = random( -10000, -2000);
            // float randXSize = random(10, 30);
            // float randYSize = random(10, 30);
            float randSpeed = random(3, 6);
            Enemy e = new Enemy(20, 20,(int) randXPos,(int) randYPos, randSpeed);
            this.addEnemey(e);
        }
    }

    public void detectCollision() {
        float randYPos = random(-10000, -2000);
        for (Enemy e : this.getEnemies()) {
            if (p.getPlayerYPos() <= e.getYPos() && p.getPlayerXPos() - p.getPlayerXSize() / 2 <= e.getXPos()
            && p.getPlayerXPos() + p.getPlayerXSize() / 2 >= e.getXPos() && p.getPlayerColor() == e.getColor()) {
                e.setYPos((int) randYPos);
                ctc.addScore(e);
            } else if (p.getPlayerColor() != e.getColor() && p.getPlayerYPos() <= e.getYPos() && p.getPlayerXPos() - p.getPlayerXSize() / 2 <= e.getXPos()
            && p.getPlayerXPos() + p.getPlayerXSize() / 2 >= e.getXPos()) {
                ctc.removeScore(e);
            } else if (height <= e.getYPos()) {
                e.setYPos((int) randYPos);
            }
        }
    }
    
    public void setDifficulty(int diff) {
        switch(diff) {
            case 1 : 
                this.createEnemies(10);
                break;
            case 2 : 
                this.createEnemies(20);
                break;
            case 3 : 
                this.createEnemies(40);
                break;
            case 4 : 
                this.createEnemies(80);
                break;
        }
    }
}