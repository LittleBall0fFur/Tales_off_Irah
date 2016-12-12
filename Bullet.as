package  {
	
	import flash.display.MovieClip;
	import flash.sampler.Sample;
	
	
	public class Bullet extends MovieClip {
		var position:Vector2;
		var tower:Towers = new Towers();
		var dir:Vector2 = new Vector2(0,0);
		var subvec:Vector2 = new Vector2(0,0);
		var target:Vector2 = new Vector2(0,0);
		var speed:int = 60;
		var hasSpawned:Boolean;

		public function Bullet() {
			// constructor code
			trace("add");
			this.rotation = tower.rotation;
			position = new Vector2(this.x,this.y);
			
		}
		public function update():void{
			if(!hasSpawned){
				x = position.x;
				y = position.y;
				target.x = subvec.x;
				target.y = subvec.y;
				hasSpawned = true;
			}
			move();
		}
		private function move():void{
			this.x += Math.cos(Vector2.getAngle2(new Vector2(position.x, position.y), new Vector2(target.x, target.y))) * speed;
			this.y += Math.sin(Vector2.getAngle2(new Vector2(position.x, position.y), new Vector2(target.x, target.y))) * speed;
		}
	}
}
