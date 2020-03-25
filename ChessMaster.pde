int titleSize = 90;
PImage[] image = new PImage[12];
Board board;
boolean moving = false;
Piece movingPiece;
boolean whiteMove = true;

void setup(){
	size(720,720);

	for(int i = 1; i <10; i++){
		image[i-1] = loadImage("assets/2000px-Chess_Pieces_Sprite_0" + i + ".png");
	}

	for(int i = 10; i <13; i++){
		image[i-1] = loadImage("assets/2000px-Chess_Pieces_Sprite_" + i + ".png");
	}
	board = new Board();

}

void draw(){
	
	showGrid();
	board.show();
}

void showGrid(){
	for(int i = 0; i < 8; i++){
		for(int j = 0; j < 8; j++){
			if((i % 2 == 0) && (j % 2 == 0)){
				fill(255);
			}
			else if ((i % 2 != 0) && (j % 2 != 0)) {
				fill(255);
			}
			else {
				fill(0);
			}
			rect(titleSize*i, titleSize*j, titleSize, titleSize);
		}
	}
}

void mousePressed(){
	int x = floor(mouseX / titleSize);
	int y = floor(mouseY / titleSize);

	if(true){ //Rajoute board.isDone() apres bg
		if(!moving){
			movingPiece = board.getPieceAt(x,y);
			if(movingPiece != null && movingPiece.isWhite == whiteMove){
				movingPiece.movingThisPiece = true;
			}
			else {
				return;
			}
		}
		else {
			if(movingPiece.canMove(x, y, board)){
				movingPiece.move(x, y, board);
				movingPiece.movingThisPiece = false;
				whiteMove = !whiteMove;
			}
			else {
				movingPiece.movingThisPiece = false;
			}
		}
		moving = !moving;
		whiteMove = !whiteMove;
	}


}