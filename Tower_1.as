package  {
	import flash.display.MovieClip;
	
	public class Tower_1 extends Towers {
		private var sprite:MovieClip;
		
		public function Tower_1() {
			// constructor code
			damage = 5;
			sprite = new T1Img();
			kost = 100;
			this.addChild(sprite);
			super();
		}
		public function update():void{
			//Rotation
			if(this.alpha == 1 && target != null){
				position = new Vector2(this.x,this.y);
				var EPosition = new Vector2(target.x, target.y);
				dir.create(position, EPosition);
				this.rotation = dir.getAngle();
			}
		}
	}
}
