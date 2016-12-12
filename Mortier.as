package  {
	import flash.display.MovieClip;
	
	public class Mortier extends Towers {
		private var sprite:MovieClip;
		
		public function Mortier() {
			// constructor code
			damage = 10;
			sprite = new MImg();
			this.addChild(sprite);
			super();
		}
		public function update():void{
			//Rotation
			if(this.alpha == 1 && target != null){
				position = new Vector2(this.x,this.y);
				var EPosition = new Vector2(target.x, target.y);
				dir.create(EPosition, position);
				this.rotation = dir.getAngle();
			}
		}
	}
}
