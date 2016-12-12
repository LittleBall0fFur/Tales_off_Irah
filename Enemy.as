package {
	import flash.events.*;
	import flash.display.MovieClip;

	public class Enemy extends MovieClip {
		public static var health:int;
		public static var damage:int;
		public var speed:int;
		public var spawnpoint1:Boolean;
		public var spawnpoint2:Boolean;
		public var spawnpoint3:Boolean;
		//movement
		public var pathArray:Array;
		public var currentCheckPoint:int = 0;
		public var pos:Vector2;

		public function Enemy() {
			// constructor code
			pathArray = new Array();
			spawnpoint1 = true;
		}
		public function returnPos():Vector2{
			return pos;
		}
		public static function returnDamage():int{
			return damage;
		}
		public static function setHealth(i:int){
			health = health - i;
		}
		public static function getHealth(){
			return health;
		}
	}
}