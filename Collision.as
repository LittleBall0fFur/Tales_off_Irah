package {
	import flash.display.DisplayObject;

	public class Collision {

		public function Collision() {
			// constructor code
		}
		public function colUpdate(): void {
			//bullets
			for each(var bulletPointer:DisplayObject in Factory.getInstance().getBullets()) {
				if (bulletPointer is Bullet) {
					//Get bullet borders
					var bulletLeft:int = bulletPointer.x - (bulletPointer.width / 2);
					var bulletRight:int = bulletPointer.x + (bulletPointer.width / 2);
					var bulletBottom:int = bulletPointer.y + (bulletPointer.height / 2);
					var bulletTop:int = bulletPointer.y - (bulletPointer.height / 2);
					//Cross reference enemies with bullets
					for each(var enemyPointer:DisplayObject in Factory.getInstance().getEnemies()) {
						if (enemyPointer is Enemy) {
							//Get Borders
							var enemyLeft:int = enemyPointer.x - (enemyPointer.width / 2);
							var enemyRight:int = enemyPointer.x + (enemyPointer.width / 2);
							var enemyBottom:int = enemyPointer.y + (enemyPointer.height / 2);
							var enemyTop:int = enemyPointer.y - (enemyPointer.height / 2);
							if (bulletLeft >= enemyLeft && bulletLeft <= enemyRight && bulletTop >= enemyTop && bulletBottom <= enemyBottom) {
								//Collide
								Factory.getInstance().removeBullet(bulletPointer);
								Enemy.setHealth(Towers.returnDamage());
								if(Enemy.getHealth() <= 0){
									Factory.getInstance().removeEnemy(enemyPointer);
								}
							}
						}
					}
				}
			}
			for each(var enemy2Pointer:DisplayObject in Factory.getInstance().getEnemies()) {
				if (enemy2Pointer is Enemy) {
					//Get Borders
					var enemy2Left:int = enemy2Pointer.x - (enemy2Pointer.width / 2);
					var enemy2Right:int = enemy2Pointer.x + (enemy2Pointer.width / 2);
					var enemy2Bottom:int = enemy2Pointer.y + (enemy2Pointer.height / 2);
					var enemy2Top:int = enemy2Pointer.y - (enemy2Pointer.height / 2);
				}
				for each(var buildingPointer:DisplayObject in Factory.getInstance().getBuildings()) {
					if (buildingPointer is Core) {
						//Get buildings borders
						var buildingLeft:int = buildingPointer.x - (buildingPointer.width / 2);
						var buildingRight:int = buildingPointer.x + (buildingPointer.width / 2);
						var buildingBottom:int = buildingPointer.y + (buildingPointer.height / 2);
						var buildingTop:int = buildingPointer.y - (buildingPointer.height / 2);
						//Cross reference enemies with buildings
						if (enemy2Left >= buildingLeft && enemy2Left <= buildingRight && enemy2Top >= buildingTop && enemy2Bottom <= buildingBottom) {
							Factory.getInstance().removeEnemy(enemy2Pointer);
							Buildings.setHealth(Enemy.returnDamage());
						}
					}
				}
			}
		}
	}
}