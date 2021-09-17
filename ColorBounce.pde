public class ColorBounce {

    ArrayList < Enemy > enemies;

    ColorBounce() {
        enemies = new ArrayList < > ();
        this.createEnemies(1);
    }

    public ArrayList < Enemy > getEnemies() {
        return new ArrayList < Enemy > (enemies);
    }

    public void addEnemey(Enemy e) {
        this.enemies.add(e);
    }

    public void spawnEnemies() {
        for (Enemy enemy: enemies) {
            fill(enemy.getColor());
            enemy.display();
            enemy.move();
        }
    }

    private void createEnemies(int enemiesCount) {
        for (int i = 0; i < enemiesCount; i++) {
            //float randXPos = random(0, width);
            //  float randYPos = random( -10000, -2000);
            // float randXSize = random(10, 30);
            // float randYSize = random(10, 30);
            float randSpeed = random(3, 6);
            Enemy e = new Enemy(20, 20, width / 2, height / 2, randSpeed);
            this.addEnemey(e);
        }
    }

    public boolean detectCollision() {
        float randYPos = random(-10000, -2000);
        for (Enemy e: this.getEnemies()) {
            if (p.getPlayerYPos() <= e.getYPos() && p.getPlayerXPos() - p.getPlayerXSize() / 2 <= e.getXPos() &&
                p.getPlayerXPos() + p.getPlayerXSize() / 2 >= e.getXPos()) {
                return true;
            } else {
                return false;
            }
        }
        return false;
    }

    public boolean borderColl() {
        fill(255, 255, 255);
        // top border
        rect(0, 0, width, 5);

        for (Enemy e: this.getEnemies()) {
            if (e.getYPos() <= 0) {
                return true;
            }
            if (e.getXPos() <= 0) {
                return true;
            }
            if (e.getXPos() + e.getXSize() >= width) {
                return true;
            }
        }
        return false;
    }
}