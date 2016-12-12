package {
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class T1Bullet extends Bullet {
		private var sprite:MovieClip;
		
		public function T1Bullet(posX:int, posY:int, _target:Enemy) {
			// constructor code
			sprite = new T1BImg();
			this.addChild(sprite);
			position = new Vector2(posX, posY);
			subvec = new Vector2(_target.x, _target.y);
		}
	}
}