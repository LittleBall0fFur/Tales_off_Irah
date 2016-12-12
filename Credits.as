package  {
	
	import flash.display.SimpleButton;
	import flash.events.*;
	
	public class Credits extends SimpleButton {
		public var title:Title;
		
		public function Credits(_title:Title) {
			// constructor code
			title = _title;
			this.addEventListener(MouseEvent.CLICK,isClicked);
		}
		public function isClicked(e:Event):void{
			title.openCredits();
		}
	}
	
}
