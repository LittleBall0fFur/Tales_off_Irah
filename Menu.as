package  {
	
	import flash.display.MovieClip;
	
	
	public class Menu extends MovieClip {
		public var start:StartGame;
		public var credits:Credits;

		
		public function Menu(_title:Title) {
			// constructor code
			setStart(_title);
			setCredits(_title);
		}
		public function setStart(_title){
			start = new StartGame(_title);
			start.x = 370;
			start.y = 330;
			addChild(start);
		}
		public function setCredits(_title){
			credits = new Credits(_title);
			credits.x = 400;
			credits.y = 600;
			addChild(credits);
		}
	}
}
