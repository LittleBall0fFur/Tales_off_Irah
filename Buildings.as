package  {
	import flash.display.MovieClip;
	
	public class Buildings extends MovieClip {
		public static var health:int;
		public var kost:int;
		
		public function Buildings() {
			// constructor code
		}
		public function payKost(money:int){
			
		}
		public static function setHealth(eDamage:int):void{
			health = health - eDamage;
		}
		public static function getHealth():int{
			return health;
		}
	}
}
