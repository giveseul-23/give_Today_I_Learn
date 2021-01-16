package Abstract;

import bomb.Bomb;
import bomb.C4;
import weapon.Gun;
import weapon.Weapon;

public class Atype implements Abstract {

	@Override
	public Weapon createWeapon() {
		return new Gun();
	}

	@Override
	public Bomb createBomb() {
		return new C4();
	}

}
