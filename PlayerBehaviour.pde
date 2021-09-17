public interface PlayerBehaviour {

    public Player setSize();
}


    private class Player1 implements PlayerBehaviour {

        public Player setSize() {
            return new Player(1000, 1000);
        }
    }

    // private class Player2 implements PlayerBehaviour {
    //     public void setXSize() {

    //     }
    //     public void setYSize() {
            
    //     }
    // }

