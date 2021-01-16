package cls;

public class SutdaDeck {
	final int CARD_NUM = 20;
	
	public SutdaCard[] cards = new SutdaCard[CARD_NUM];
	
	public SutdaDeck() {
		for(int i=0;i < cards.length;i++) {
				int num = i%10+1;
				boolean isKwang = (i < 10)&&(num==1||num==3||num==8);
				cards[i] = new SutdaCard(num,isKwang);
		}
	}
	
	public void shuffle() {
		
		int r = (int)Math.random()*20;
		int i = (int)Math.random()*20;
		SutdaCard temp;
		
		temp = cards[r];
			cards[r] = cards[i];
			cards[i] = temp;

	}
	
	public SutdaCard pick(int index) {
		if(index < 0 || index >= CARD_NUM) { // index의 유효성을 검사한다.
			return null;
		}
		
		return cards[index];
	}
	
	public SutdaCard pick() {
		int index = (int)(Math.random()*cards.length);
		
		return pick(index); // pick(int index)를 호출한다.
	}



}
