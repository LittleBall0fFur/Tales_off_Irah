package  {
	import flash.display.MovieClip;
	
	public class Core extends Buildings{
		private var sprite:MovieClip;
		
		public function Core() {
			// constructor code
			sprite = new CoreImg();
			health = 5000;
			this.addChild(sprite);
		}
	} 
}
