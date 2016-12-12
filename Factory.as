package  {
	import flash.display.DisplayObject;
	
	public class Factory {
		private var object:Object;
		private static var factoryInstance:Factory;
		private var map:Map;
		private var enemies:Array;
		private var bullets:Array;
		private var buildings:Array;
		private var killCounter:int;
		private var wallet:int = 300;
		private var kost:int;
		private var spawnCounter:int;
		
		public function Factory() {
			// constructor code
			enemies = new Array();
			bullets = new Array();
			buildings = new Array();
			killCounter = 0;
			spawnCounter = 0;
		}
		public static function getInstance():Factory{
			if(factoryInstance == null){
				factoryInstance = new Factory();
			}
			return factoryInstance;
		}
		public function mapInstance():Map{
			if(map == null){
				map = new Map();
			}
			return map;
		}
		public function addEnemy(entity:Enemy):void{
			enemies.push(entity);
			spawnCounter++;
			mapInstance().addChild(entity);
		}
		public function removeEnemy(entity:DisplayObject):void{
			enemies.splice(enemies.indexOf(entity), 1);
			mapInstance().removeChild(entity);
			killCounter++;
			wallet = wallet + 5;
		}
		public function getEnemies():Array{
			return enemies;
		}
		public function addBullet(entity:DisplayObject):void{
			bullets.push(entity);
			mapInstance().addChildAt(entity, 1);
		}
		public function removeBullet(entity:DisplayObject):void{
			bullets.splice(bullets.indexOf(entity), 1);
			mapInstance().removeChild(entity);
		}
		public function getBullets():Array{
			return bullets;
		}
		public function addBuilding(entity:DisplayObject):void{
			mapInstance().addChild(entity);
			buildings.push(entity);
		}
		public function removeBuilding(entity:DisplayObject):void{
			buildings.splice(buildings.indexOf(entity), 1);
			mapInstance().removeChild(entity);
		}
		public function getBuildings():Array{
			return buildings;
		}
		public function getObject():Object{
			return object;
		}
		public function setObject(entity:DisplayObject):void{
			object = entity;
		}
		public function getCounter():int{
			return killCounter;
		}
		public function getSpawnCounter():int{
			return spawnCounter;
		}
		public function setSpawnCounter(i:int):void{
			spawnCounter = i;
		}
		public function setCounter(i:int):void{
			killCounter = i;
		}
		public function getWallet():int{
			return wallet;
		}
		public function getKost(Tkost:int):int{
			kost = Tkost;
			return kost;
		}
		public function giveKost():int{
			return kost;
		}
		public function payKost():void{
			if(wallet >= kost){
				wallet = wallet - kost;
			}
		}
	}
}
