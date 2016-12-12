package  {
	import flash.display.MovieClip;
	
	public class Tower_2 extends Towers {
		private var sprite:MovieClip;
		
		public function Tower_2() {
			// constructor code
			damage = 2;
			sprite = new T2Img();
			this.addChild(sprite);
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
