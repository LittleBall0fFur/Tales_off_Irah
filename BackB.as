package  {
	
	import flash.display.SimpleButton;
	import flash.events.*;
	
	public class BackB extends SimpleButton {
		public var title:Title;
		
		public function BackB(_title:Title) {
			// constructor code
			title = _title;
			this.addEventListener(MouseEvent.CLICK,isClicked);
		}
		public function isClicked(e:Event):void{
			title.backMenu();
		}
	}
}
