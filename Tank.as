package  {
	import flash.display.MovieClip;
	
	public class Tank extends Enemy{
		private var sprite:MovieClip;
		
		public function Tank(spawnPoint:int = 1){
			// constructor code
			sprite = new TankImg();
			pos = new Vector2(0,0);
			speed = 6;
			damage = 40;
			health = 50;
			this.addChild(sprite);
			this.x = pos.x;
			this.y = pos.y;
			switch (spawnPoint) {
				case 1:
					pos = new Vector2(-50, -50);
					pathArray.push(new Vector2(202, 121));
					pathArray.push(new Vector2(470, 213));
					pathArray.push(new Vector2(726, 333));
					pathArray.push(new Vector2(950, 493));
					pathArray.push(new Vector2(1339, 630));
					pathArray.push(new Vector2(1515, 670));
					pathArray.push(new Vector2(1614, 650));
					pathArray.push(new Vector2(1819, 564));
					pathArray.push(new Vector2(2034, 564));
					pathArray.push(new Vector2(2169, 627));
					pathArray.push(new Vector2(2342, 925));
					pathArray.push(new Vector2(2310, 1055));
					pathArray.push(new Vector2(2267, 1267));
					pathArray.push(new Vector2(2267, 1507));
					pathArray.push(new Vector2(2415, 1743));
					pathArray.push(new Vector2(2575, 1827));
					pathArray.push(new Vector2(2847, 1883));
					pathArray.push(new Vector2(3063, 1867));
					pathArray.push(new Vector2(3196, 1759));
					pathArray.push(new Vector2(3220, 1663));
					pathArray.push(new Vector2(3146, 1533));
					pathArray.push(new Vector2(2889, 1291));
					pathArray.push(new Vector2(2876, 1198));
					pathArray.push(new Vector2(2876, 1198));
					pathArray.push(new Vector2(3466, 723));
					break;
				case 2:
					pos = new Vector2(-50, 1403);
					pathArray.push(new Vector2(43, 1422));
					pathArray.push(new Vector2(121, 1437));
					pathArray.push(new Vector2(261, 1498));
					pathArray.push(new Vector2(408, 1488));
					pathArray.push(new Vector2(576, 1391));
					pathArray.push(new Vector2(649, 1299));
					pathArray.push(new Vector2(756, 1065));
					pathArray.push(new Vector2(854, 978));
					pathArray.push(new Vector2(1197, 838));
					pathArray.push(new Vector2(1406, 855));
					pathArray.push(new Vector2(1724, 952));
					pathArray.push(new Vector2(1809, 888));
					pathArray.push(new Vector2(1971, 868));
					pathArray.push(new Vector2(2155, 932));
					pathArray.push(new Vector2(2310, 1055));
					pathArray.push(new Vector2(2267, 1267));
					pathArray.push(new Vector2(2267, 1507));
					pathArray.push(new Vector2(2415, 1743));
					pathArray.push(new Vector2(2575, 1827));
					pathArray.push(new Vector2(2847, 1883));
					pathArray.push(new Vector2(3063, 1867));
					pathArray.push(new Vector2(3196, 1759));
					pathArray.push(new Vector2(3220, 1663));
					pathArray.push(new Vector2(3146, 1533));
					pathArray.push(new Vector2(2889, 1291));
					pathArray.push(new Vector2(2876, 1198));
					pathArray.push(new Vector2(2963, 1037));
					pathArray.push(new Vector2(3466, 723));
					break;
				case 3:
					pos = new Vector2(1094, 2196);
					pathArray.push(new Vector2(1202, 2051));
					pathArray.push(new Vector2(1307, 1986));
					pathArray.push(new Vector2(1456, 1937));
					pathArray.push(new Vector2(1844, 1858));
					pathArray.push(new Vector2(1926, 1709));
					pathArray.push(new Vector2(1909, 1570));
					pathArray.push(new Vector2(1698, 1147));
					pathArray.push(new Vector2(1731, 949));
					pathArray.push(new Vector2(1809, 888));
					pathArray.push(new Vector2(1971, 868));
					pathArray.push(new Vector2(2155, 932));
					pathArray.push(new Vector2(2310, 1055));
					pathArray.push(new Vector2(2267, 1267));
					pathArray.push(new Vector2(2267, 1507));
					pathArray.push(new Vector2(2415, 1743));
					pathArray.push(new Vector2(2575, 1827));
					pathArray.push(new Vector2(2847, 1883));
					pathArray.push(new Vector2(3063, 1867));
					pathArray.push(new Vector2(3196, 1759));
					pathArray.push(new Vector2(3220, 1663));
					pathArray.push(new Vector2(3146, 1533));
					pathArray.push(new Vector2(2889, 1291));
					pathArray.push(new Vector2(2876, 1198));
					pathArray.push(new Vector2(2963, 1037));
					pathArray.push(new Vector2(3466, 723));
					break;
				}
		}
		public function update(): void {
			if (currentCheckPoint < pathArray.length) {
				pos.sub(Vector2.moveTowards(pos, pathArray[currentCheckPoint], speed));
				if (Vector2.distancePoints(pos, pathArray[currentCheckPoint]) < 10) {
					currentCheckPoint++;
				}
				this.x = pos.x;
				this.y = pos.y;
			}
		}
	}
}
