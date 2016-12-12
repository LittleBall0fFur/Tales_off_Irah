package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.display.Stage;
	
	public class MBuild extends MovieClip {
		var tower_2:Tower_2;
		public var click:int = 0;
		
		public function MBuild() {
			// constructor code
			addEventListener(MouseEvent.CLICK,isClicked);
		}
		public function isClicked(e:Event):void{
			if(Factory.getInstance().getWallet() < Factory.getInstance().giveKost()){
				click = 1;
			}
			if(Factory.getInstance().getWallet() >= Factory.getInstance().giveKost()){
				tower_2 = new Tower_2();
				Factory.getInstance().getKost(120);
				Factory.getInstance().payKost();
				Factory.getInstance().setObject(tower_2);
				tower_2.alpha = 0.5;
				Factory.getInstance().mapInstance().addChild(tower_2);
				Factory.getInstance().addBuilding(tower_2);
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
