package  {
	
	import flash.display.MovieClip;
	
	public class HUD extends MovieClip {
		public var title:Title;
		
		public function HUD(_title:Title) {
			// constructor code
			title = _title;
			this.y = 1000;
			this.x = -100;
		}
	}	
}
