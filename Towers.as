package  {
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class Towers extends MovieClip {
		var myIdentifier:Timer = new Timer(1500, 0);
		var kost:int;
		var target:Enemy;
		var bullet:Bullet;
		static var damage:int;
		var position:Vector2;
		var dir:Vector2 = new Vector2(0,0);
		var BPosition:Vector2;
		
		public function Towers() {
			// constructor code
			myIdentifier.addEventListener(TimerEvent.TIMER, timer);
			myIdentifier.start();
		}
		public function timer(e:TimerEvent):void{
			chooseTarget();
			shootEnemy(target);
		}
		public function destroy():void{
			myIdentifier.removeEventListener(TimerEvent.TIMER, timer);
		}
		public function chooseTarget():void{
			for each(var enemy:Enemy in Factory.getInstance().getEnemies()){
				var TPosition:Vector2 = new Vector2(this.x,this.y);
				if(target == null){
					target = enemy;
				}
				else if(Vector2.distancePoints(TPosition, enemy.returnPos()) <= 500){
					target = enemy;
				}
			}
		}
		public function shootEnemy(target):void{
			// addChild through factory
			if(target != null && this.alpha == 1){
				for each(var enemy:Enemy in Factory.getInstance().getEnemies()){
					var EPosition:Vector2 = new Vector2(enemy.x,enemy.y);
					var TPosition:Vector2 = new Vector2(this.x,this.y);
					if(Vector2.distancePoints(EPosition, TPosition) <= 500){
						Factory.getInstance().addBullet(new T1Bullet(this.x, this.y, target));
					}
				}
			}
		}
		public static function returnDamage():int{
			return damage;
		}
	}
}
