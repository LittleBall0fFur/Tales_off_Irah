package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.display.Stage;
	
	public class T1Build extends MovieClip {
		public var tower_1:Tower_1;
		public var click:int = 0;
		
		public function T1Build() {
			// constructor code
			addEventListener(MouseEvent.CLICK,isClicked);
			
		}
		public function isClicked(e:Event):void{
			if(Factory.getInstance().getWallet() < Factory.getInstance().giveKost()){
				click = 1;
			}
			if(Factory.getInstance().getWallet() >= Factory.getInstance().giveKost()){
				tower_1 = new Tower_1();
				Factory.getInstance().getKost(100);
				Factory.getInstance().payKost();
				Factory.getInstance().setObject(tower_1);
				tower_1.alpha = 0.5;
				Factory.getInstance().mapInstance().addChild(tower_1);
				Factory.getInstance().addBuilding(tower_1);
			}
		}
		public function getInt():int{
			return click;
		}
		public function setInt(i:int):void{
			click = i;
		}
	}
}
