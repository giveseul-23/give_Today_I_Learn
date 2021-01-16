package main;

import Abstract.Atype;
import factory.CharFactory;

public class MainClass {

	public static void main(String[] args) {
		
		CharFactory char1 = new CharFactory();
		char1.create(new Atype());
		
		char1.m_weapon.drawWeapon();
		char1.m_bomb.drawBomb();
		
	}

}
