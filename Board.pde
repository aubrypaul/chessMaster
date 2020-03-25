class Board{

	Piece[] whitePieces;
	Piece[] blackPieces;
	int score;

	Board(){
		whitePieces = new Piece[16];
		blackPieces = new Piece[16];
		setupPiece();
	}

	void setupPiece(){
		//White pieces
		whitePieces[0] = new King(4,7,true);
		whitePieces[1] = new Queen(3,7,true);
		whitePieces[2] = new Rook(7,7,true);
		whitePieces[3] = new Rook(0,7,true);
		whitePieces[4] = new Bishop(2,7,true);
		whitePieces[5] = new Bishop(5,7,true);
		whitePieces[6] = new Knight(6,7,true);
		whitePieces[7] = new Knight(1,7,true);

		whitePieces[8] = new Pawn(0,6,true);
		whitePieces[9] = new Pawn(1,6,true);
		whitePieces[10] = new Pawn(2,6,true);
		whitePieces[11] = new Pawn(3,6,true);
		whitePieces[12] = new Pawn(4,6,true);
		whitePieces[13] = new Pawn(5,6,true);
		whitePieces[14] = new Pawn(6,6,true);
		whitePieces[15] = new Pawn(7,6,true);

		//Black pieces
		blackPieces[0] = new King(4,0,false);
		blackPieces[1] = new Queen(3,0,false);
		blackPieces[2] = new Rook(7,0,false);
		blackPieces[3] = new Rook(0,0,false);
		blackPieces[4] = new Bishop(2,0,false);
		blackPieces[5] = new Bishop(5,0,false);
		blackPieces[6] = new Knight(6,0,false);
		blackPieces[7] = new Knight(1,0,false);

		blackPieces[8] = new Pawn(0,1,false);
		blackPieces[9] = new Pawn(1,1,false);
		blackPieces[10] = new Pawn(2,1,false);
		blackPieces[11] = new Pawn(3,1,false);
		blackPieces[12] = new Pawn(4,1,false);
		blackPieces[13] = new Pawn(5,1,false);
		blackPieces[14] = new Pawn(6,1,false);
		blackPieces[15] = new Pawn(7,1,false);
	}

	void show(){
		for(int i = 0; i < whitePieces.length; i++){
			whitePieces[i].show();
		}

		for(int i = 0; i < blackPieces.length; i++){
			blackPieces[i].show();
		}

	}

	Piece getPieceAt(int x, int y){
		for(int i = 0; i < whitePieces.length; i++){
			if(whitePieces[i].matrixPositon.x == x && whitePieces[i].matrixPositon.y == y){
				return whitePieces[i];
			}
		}
		for(int i = 0; i < blackPieces.length; i++){
			if(blackPieces[i].matrixPositon.x == x && blackPieces[i].matrixPositon.y == y){
				return blackPieces[i];
			}
		}

		return null; //IDE de merde
	}

	boolean isDone(){
		return this.whitePieces[0].taken || this.blackPieces[0].taken;
	}

	boolean isPieceAt(int x,int y){
		for(int i = 0; i < whitePieces.length; i++){
			if(whitePieces[i].matrixPositon.x == x && whitePieces[i].matrixPositon.y == y){
				return true;
			}
		}
		for(int i = 0; i < blackPieces.length; i++){
			if(blackPieces[i].matrixPositon.x == x && blackPieces[i].matrixPositon.y == y){
				return true;
			}
		}

		return false;
	}


}