package Abstract;

import bomb.Bomb;
import weapon.Weapon;

public interface Abstract {
	
	public Weapon createWeapon();
	
	public Bomb createBomb();
}
