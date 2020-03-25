class Piece{

	PVector matrixPositon = new PVector();
	PVector pixelPosition = new PVector();
	boolean taken = false;
	char letter;
	PImage pic;
	boolean isWhite;
	boolean movingThisPiece = false;
	byte value = 0;

	Piece() {

	}

	Piece(int x,int y,boolean isWhite){
		this.matrixPositon.set(x,y);
		this.pixelPosition.set(x * titleSize + titleSize/2, y * titleSize + titleSize/2);
		this.isWhite = isWhite;
	}

	void show() {
		imageMode(CENTER);
		image(pic, pixelPosition.x, pixelPosition.y, 80, 80);
	}

	boolean outBounds(int x, int y){
		if(x <= 0 && y <= 0 && x > 8 && y > 8){
			return true;
		}
		return false;
	}

	boolean attackingAllie(int x,int y, Board board){
		Piece attacking = board.getPieceAt(x,y);
		if(attacking != null){
			if(attacking.isWhite == this.isWhite){
				return true;
			}
		}
		return false;
	}

	boolean canMove(int x, int y, Board board){
		return !this.attackingAllie(x,y,board);
	}

	void move(int x, int y, Board board){
		Piece attacking = board.getPieceAt(x,y);
		if(attacking != null){
			attacking.taken = true;
		}
		matrixPositon.set(x,y);
		pixelPosition.set(x * titleSize + titleSize/2, y * titleSize + titleSize/2);
	}

}

class King extends Piece{

	King(int x, int y, boolean isWhite){
		super(x, y, isWhite);
		this.letter = 'K';
		if(isWhite){
			pic = image[0];
		}
		else {
			pic = image[6];
		}
		this.value = 99;
	}

}

class Queen extends Piece{

	Queen(int x, int y, boolean isWhite){
		super(x, y, isWhite);
		this.letter = 'Q';
		if(isWhite){
			pic = image[1];
		}
		else {
			pic = image[7];
		}
		this.value = 9;
	}

}

class Bishop extends Piece{

	Bishop(int x, int y, boolean isWhite){
		super(x, y, isWhite);
		this.letter = 'B';
		if(isWhite){
			pic = image[2];
		}
		else {
			pic = image[8];
		}
		this.value = 3;
	}
}

class Rook extends Piece{

	Rook(int x, int y, boolean isWhite){
		super(x, y, isWhite);
		this.letter = 'R';
		if(isWhite){
			pic = image[4];
		}
		else {
			pic = image[10];
		}
		this.value = 5;
	}

	boolean canMove(int x, int y, Board board){
		boolean attacking = board.isPieceAt(x,y);
		return true;
	}

}

class Knight extends Piece{

	Knight(int x, int y, boolean isWhite){
		super(x, y, isWhite);
		this.letter = 'K';
		if(isWhite){
			pic = image[3];
		}
		else {
			pic = image[9];
		}
		this.value = 3;
	}

}

class Pawn extends Piece{

	boolean firstRound;

	Pawn(int x, int y, boolean isWhite){
		super(x, y, isWhite);
		this.letter = 'P';
		this.firstRound = true;
		if(isWhite){
			pic = image[5];
		}
		else {
			pic = image[11];
		}
		this.value = 1;
	}

	boolean canMove(int x, int y, Board board){
		int px = int(this.matrixPositon.x);
		int py = int(this.matrixPositon.y);
		if(outBounds(x,y)){
			return false;
		}
		if(attackingAllie(x,y,board)){
			return false;
		}

		boolean attacking = board.isPieceAt(x,y);
		if(attacking){
			if((abs(x - px)) == abs(y - py) && ((isWhite && y - py == -1) || (!isWhite && y - py == 1))){
				this.firstRound = false;
				return true;
			}
		}

		if(firstRound){
			if((isWhite && (y - py == -1 || y - py == -2)) || (!isWhite && (y - py == 1 || y - py == 2))){
				this.firstRound = false;
				return true;
			}
		}

		if((isWhite && y - py == -1) || (!isWhite && y - py == 1)){
			this.firstRound = false;
			return true;
		}
		return false;
	}



}
