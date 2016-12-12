package  {	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class Map extends MovieClip {
		
		
		public function Map() {
			// constructor code
			addEventListener(MouseEvent.CLICK,isClicked);
		}
		private function isClicked(e:Event):void{
			if(Factory.getInstance().getObject() != null){
				Factory.getInstance().getObject().alpha = 1;
				Factory.getInstance().setObject(null);
			}
		}
	}
}
