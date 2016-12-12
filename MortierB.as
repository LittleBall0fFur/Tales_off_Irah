package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.display.Stage;
	
	public class MortierB extends MovieClip {
		var mortier:Mortier;
		public var click:int = 0;
		
		public function MortierB() {
			// constructor code
			addEventListener(MouseEvent.CLICK,isClicked);
		}
		public function isClicked(e:Event):void{
			if(Factory.getInstance().getWallet() < Factory.getInstance().giveKost()){
				click = 1;
			}
			if(Factory.getInstance().getWallet() >= Factory.getInstance().giveKost()){
				mortier = new Mortier();
				Factory.getInstance().getKost(150);
				Factory.getInstance().payKost();
				Factory.getInstance().setObject(mortier);
				mortier.alpha = 0.5;
				Factory.getInstance().mapInstance().addChild(mortier);
				Factory.getInstance().addBuilding(mortier);
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
