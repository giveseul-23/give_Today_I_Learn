package Abstract;

import bomb.Bomb;
import bomb.Dynamite;
import weapon.Sword;
import weapon.Weapon;

public class Btype implements Abstract {

	@Override
	public Weapon createWeapon() {
		return new Sword();
	}

	@Override
	public Bomb createBomb() {
		// TODO Auto-generated method stub
		return new Dynamite();
	}

}
