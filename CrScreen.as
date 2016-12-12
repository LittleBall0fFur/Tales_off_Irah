package  {
	
	import flash.display.MovieClip;
	
	public class CrScreen extends MovieClip {
		public var back:BackB;
		
		public function CrScreen(_title:Title) {
			// constructor code
			setBack(_title);
		}
		public function setBack(_title){
			back = new BackB(_title);
			back.x = 1750;
			back.y = 900;
			addChild(back);
		}
	}
}
