public class Robot {
    
    int x = 0;    
    int y = 0;   
    Direction direction = Direction.UP;

    public Direction getDirection() {
        return direction;
    }

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public void turnLeft() {
        switch (getDirection()){
            default:
            case DOWN: direction = Direction.LEFT;
                break;
            case UP: direction = Direction.LEFT;
                break;
            case RIGHT: direction = Direction.UP;
                break;
            case LEFT: direction = Direction.DOWN;
        }
    }
    public void turnRight() {
        switch (getDirection()){
            default:
            case DOWN: direction = Direction.RIGHT;
                break;
            case UP: direction = Direction.LEFT;
                break;
            case RIGHT: direction = Direction.DOWN;
                break;
            case LEFT: direction = Direction.UP;
        }
    }
    public void stepForward() {
        switch (getDirection()){
            default:
            case RIGHT: x++;
                break;
            case LEFT: x--;
                break;
            case UP: y++;
                break;
            case DOWN: y--;
                break;
        }
    }

    public static void moveRobot(Robot robot, int toX, int toY) {
        switch (robot.getDirection()) {
            case UP: robot.turnRight();
                break;
            case DOWN: robot.turnLeft();
                break;
        }
        while(robot.getX() != toX) {
            int distX = Math.abs(robot.getX() - toX);
            robot.stepForward();
            if (Math.abs(robot.getX() - toX) > distX) {
                robot.turnLeft();
                robot.turnLeft();
            }
        }

        robot.turnLeft();
        while(robot.getY() != toY) { 
            int distY = Math.abs(robot.getY() - toY);
            robot.stepForward();
            if (Math.abs(robot.getY() - toY) > distY) {
                robot.turnLeft();
                robot.turnLeft();
            }
        }
    }
    
}
