package {
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.text.*; 

	public class Title extends MovieClip {
		//Vectors
		public var position:Vector2 = new Vector2(-90, 0);
		public var placing:Vector2 = new Vector2(mouseX, mouseY);
		//Menu
		public var menu:Menu;
		public var crScreen:CrScreen;
		//Buildings
		public var core:Core;
		//Build Menu
		static var hud:HUD;
		static var t1B:T1Build;
		public var mB:MBuild;
		public var morB:MortierB;
		public var back:BackB;
		//collision
		public var collision:Collision = new Collision();
		//HUD
		public var noMoney:NoMoney;
		public var healthTxt:TextField = new TextField();
		public var loseTxt:TextField = new TextField();
		public var waveTxt:TextField = new TextField();
		public var walletTxt:TextField = new TextField();
		public var timerTxt:TextField = new TextField();
		public var hudTop:hudTime = new hudTime();
		public var health1:Health1 = new Health1();
		public var health2:Health2 = new Health2();
		public var health3:Health3 = new Health3();
		public var health4:Health4 = new Health4();
		public var health5:Health5 = new Health5();
		public var health6:Health6 = new Health6();
		public var health7:Health7 = new Health7();
		//Waves
		public var enemyTimer:int;
		public var wave:int = 1;
		public var wave1:Boolean = false;
		public var wave2:Boolean = false;
		public var wave3:Boolean = false;
		public var wave4:Boolean = false;
		public var wave5:Boolean = false;
		public var wave6:Boolean = false;
		public var wave7:Boolean = false;
		//timer
		public var timer:int = 0;
		public var min:int = 0;
		public var seconden:String;
		
		public function Title() {
			// constructor code
			openMenu();
		}
		public function startGame() {
			core = new Core();
			t1B = new T1Build();
			mB = new MBuild();
			morB = new MortierB();
			hud = new HUD(this);
			noMoney = new NoMoney();
			removeChild(menu);
			addEventListener(Event.ENTER_FRAME, update);
			core.alpha = 0
			noMoney.alpha = 0;
			noMoney.x = 750;
			noMoney.y = 340;
			addmap();
			addCore();
			addHUD();
			wave1 = true;

		}
		private function update(e:Event): void {
			timers();
			addHealthTxt();
			addWaveTxt();
			addWalletTxt();
			addTimerTxt();
			waveHandler();
			collision.colUpdate();
			updates();
			gameOverCheck();
			playerMovement();
			building();
			healthSpriteCheck();
			notEnoughMoney();
			
			for each(var bullet:Bullet in Factory.getInstance().getBullets()){
				if(bullet != null){
					if(bullet.x >= 3840 || bullet.x <= 0 || bullet.y <= 0 || bullet.y >= 2160){
						Factory.getInstance().removeBullet(bullet);
					}
				}
			}
			if(stage.contains(noMoney) && noMoney.alpha != 1){
				noMoney.alpha += 0.02;
			}
		}
	//Beginning of the Game
		public function healthSpriteCheck():void{
			if(Buildings.getHealth() <= 714){
				health1.x = 733;
				health1.y = 1065;
				if(!stage.contains(health1)){
					removeChild(health2);
					addChildAt(health1, 1);
				}
			}
			if(Buildings.getHealth() <= 1428 && Buildings.getHealth() >= 714){
				health2.x = 733;
				health2.y = 1065;
				if(!stage.contains(health2)){
					removeChild(health3);
					addChildAt(health2, 1);
				}
			}
			if(Buildings.getHealth() <= 2142 && Buildings.getHealth() >= 1428){
				health3.x = 733;
				health3.y = 1065;
				if(!stage.contains(health3)){
					removeChild(health4);
					addChildAt(health3, 1);
				}
			}
			if(Buildings.getHealth() <= 2856 && Buildings.getHealth() >= 2142){
				health4.x = 733;
				health4.y = 1065;
				if(!stage.contains(health4)){
					removeChild(health5);
					addChildAt(health4, 1);
				}
			}
			if(Buildings.getHealth() <= 3570 && 2856){
				health5.x = 733;
				health5.y = 1065;
				if(!stage.contains(health5)){
					removeChild(health6);
					addChildAt(health5, 1);
				}
			}
			if(Buildings.getHealth() <= 4284 && Buildings.getHealth() >= 3570){
				health6.x = 733;
				health6.y = 1065;
				if(stage.contains(health7)){
					removeChild(health7);
				}
				if(!stage.contains(health6)){
					addChildAt(health6, 1);
				}
			}
			if(Buildings.getHealth() <= 5100 && Buildings.getHealth() >= 4284){
				health7.x = 733;
				health7.y = 1065;
				if(!stage.contains(health7)){
					addChildAt(health7, 1);
				}
			}
		}
		public function timers():void{
			timer++;
			
			if(timer/24 == 60){
				min++;
				timer = 0;
			}
			enemyTimer++;
			if(enemyTimer / 24 == 3){
				enemyTimer = 0;
			}
		}
		public function playerMovement():void{
			//Movement and boundries map
			if (mouseX >= 1820 && Factory.getInstance().mapInstance().x >= -1820) {
				Factory.getInstance().mapInstance().x -= 33;
			}
			if (mouseX <= 100 && Factory.getInstance().mapInstance().x != -90) {
				Factory.getInstance().mapInstance().x += 33;
			}
			if (mouseY >= 980 && Factory.getInstance().mapInstance().y >= -1040) {
				Factory.getInstance().mapInstance().y -= 33;
			}
			if (mouseY <= 100 && Factory.getInstance().mapInstance().y != 0) {
				Factory.getInstance().mapInstance().y += 33;
			}
			if (menu.alpha >= 0) {
				Factory.getInstance().mapInstance().alpha -= 0.001;
			}
			if (Factory.getInstance().mapInstance().alpha <= 1) {
				Factory.getInstance().mapInstance().alpha += 0.02;
			}
		}
		public function building():void{
			if (Factory.getInstance().getObject() != null) {
				Factory.getInstance().getObject().x = Factory.getInstance().mapInstance().mouseX + 20;
				Factory.getInstance().getObject().y = Factory.getInstance().mapInstance().mouseY - 20;
			}
		}
		public function updates():void{
			for each(var enemy:Object in Factory.getInstance().getEnemies()) {
				if (enemy is Enemy) {
					enemy.update();
				}
			}
			for each(var bullet:Object in Factory.getInstance().getBullets()) {
				if (bullet is Bullet) {
					bullet.update();
				}
			}
			for each(var building:Object in Factory.getInstance().getBuildings()) {
				if (building is Towers) {
					building.update();
				}
			}
		}
		public function addmap() {
			Factory.getInstance().mapInstance().alpha = 0;
			addChild(Factory.getInstance().mapInstance());
			Factory.getInstance().mapInstance().x = position.x;
			Factory.getInstance().mapInstance().y = position.y;
		}
		public function addHUD() {
			addChild(hud);
			addChild(hudTop);
			hudTop.y = 10;
			t1B.x = 1392;
			t1B.y = 980;
			addChild(t1B);
			mB.x = 1577;
			mB.y = 980;
			addChild(mB);
			morB.x = 1763;
			morB.y = 980;
			addChild(morB);
		}
		public function addCore():void{
			core.x = 3422;
			core.y = 734;
			Factory.getInstance().addBuilding(core);
		}
		public function addHealthTxt():void{
			var myFormat:TextFormat = new TextFormat();
			var font1:Font1 = new Font1();
			healthTxt.x = 673;
			healthTxt.y = 965;
			healthTxt.width = 500;
			myFormat.size = 20;
			myFormat.font = font1.fontName;
			healthTxt.defaultTextFormat = myFormat;
			healthTxt.embedFonts = true;
			healthTxt.antiAliasType = AntiAliasType.ADVANCED;
			healthTxt.text = "Health: "+ Buildings.getHealth();
			if(!stage.contains(healthTxt)){
				addChild(healthTxt);
			}
		}
		public function addWaveTxt():void{
			var myFormat2:TextFormat = new TextFormat();
			var font1:Font1 = new Font1();
			waveTxt.x = 150;
			waveTxt.y = 45;
			waveTxt.width = 500;
			myFormat2.size = 25;
			myFormat2.font = font1.fontName;
			waveTxt.defaultTextFormat = myFormat2;
			waveTxt.embedFonts = true;
			waveTxt.antiAliasType = AntiAliasType.ADVANCED;
			waveTxt.text = "Wave: "+ wave;
			if(!stage.contains(waveTxt)){
				addChild(waveTxt);

			}
		}
		public function addWalletTxt():void{
			var myFormat3:TextFormat = new TextFormat();
			var font1:Font1 = new Font1();
			walletTxt.x = 260;
			walletTxt.y = 45;
			walletTxt.width = 500;
			myFormat3.size = 25;
			myFormat3.font = font1.fontName;
			walletTxt.defaultTextFormat = myFormat3;
			walletTxt.embedFonts = true;
			walletTxt.antiAliasType = AntiAliasType.ADVANCED;
			walletTxt.text = "Coins: "+ Factory.getInstance().getWallet();
			if(!stage.contains(walletTxt)){
				addChild(walletTxt);
			}
		}
		public function addTimerTxt():void{
			var myFormat4:TextFormat = new TextFormat();
			var font1:Font1 = new Font1();
			timerTxt.x = 400;
			timerTxt.y = 45;
			timerTxt.width = 500;
			myFormat4.size = 25;
			myFormat4.font = font1.fontName;
			timerTxt.defaultTextFormat = myFormat4;
			timerTxt.embedFonts = true;
			timerTxt.antiAliasType = AntiAliasType.ADVANCED;
			seconden = ""+timer/24;
			timerTxt.text = "Time:  "+ min + " : " + seconden.substr(0,2);
			if(!stage.contains(timerTxt)){
				addChild(timerTxt);
			}
		}
	//Menu	
		public function openMenu() {
			menu = new Menu(this);
			addChild(menu);
		}
		public function openCredits() {
			crScreen = new CrScreen(this);
			addChild(crScreen);
		}
		public function backMenu() {
			removeChild(crScreen);
		}
	//End of game
		public function gameOver(){
				//add lose display and return to menu button
			var myFormat5:TextFormat = new TextFormat();
			var font1:Font1 = new Font1();
			loseTxt.x = 750;
			loseTxt.y = 440;
			loseTxt.width = 500;
			myFormat5.size = 50;
			myFormat5.font = font1.fontName;
			loseTxt.defaultTextFormat = myFormat5;
			loseTxt.embedFonts = true;
			loseTxt.antiAliasType = AntiAliasType.ADVANCED;
			loseTxt.text = "DEFEAT";
			loseTxt.textColor = 0xFF0000;
			if(!stage.contains(loseTxt)){
				addChild(loseTxt);
			}
			removeEventListener(Event.ENTER_FRAME, update);
		}
		public function waveHandler():void{
			if(wave1){
				//Grunts
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() < 3) {	
					Factory.getInstance().addEnemy(new Grunt(3));
				}
				//Tanks
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() >= 2 && Factory.getInstance().getSpawnCounter() <= 6){
					Factory.getInstance().addEnemy(new Tank(3));
				}
				if(Factory.getInstance().getSpawnCounter() == 6){
					enemyTimer = 0;
					if(Factory.getInstance().getCounter() == 6){
						wave2 = true;
						wave++;
						wave1 = false;
					}
				}
			}
			if(wave2){
				//Grunts
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() < 9){
					Factory.getInstance().addEnemy(new Grunt(2));
				}
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() >= 8 && Factory.getInstance().getSpawnCounter() < 11){
					Factory.getInstance().addEnemy(new Grunt(1));
				}
				//Tanks
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() >= 10 && Factory.getInstance().getSpawnCounter() < 13){
						Factory.getInstance().addEnemy(new Tank(3));
				}
				if(Factory.getInstance().getSpawnCounter() >= 12){
					enemyTimer = 0;
					if(Factory.getInstance().getCounter() == 12){
						wave3 = true;
						wave++;
						wave2 = false;
					}
				}
			}
			if(wave3){
				//Grunts
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() < 14){
					Factory.getInstance().addEnemy(new Grunt(2));
				}
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() >= 13 && Factory.getInstance().getSpawnCounter() < 16){
					Factory.getInstance().addEnemy(new Grunt(1));
				}
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() >= 15 && Factory.getInstance().getSpawnCounter() < 19){
					Factory.getInstance().addEnemy(new Grunt(3));
				}
				//Tanks
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() >= 18 && Factory.getInstance().getSpawnCounter() < 21){
						Factory.getInstance().addEnemy(new Tank(2));
				}
				if(Factory.getInstance().getSpawnCounter() >= 20){
					enemyTimer = 0;
					if(Factory.getInstance().getCounter() == 20){
						wave4 = true;
						wave++;
						wave3 = false;
					}
				}
			}
			if(wave4){
				//Grunts

				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() < 23){
					
					Factory.getInstance().addEnemy(new Grunt(2));
				}
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() >= 22 && Factory.getInstance().getSpawnCounter() < 24){
					Factory.getInstance().addEnemy(new Grunt(1));
				}
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() >= 23 && Factory.getInstance().getSpawnCounter() < 26){
					Factory.getInstance().addEnemy(new Grunt(3));
				}
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() >= 25 && Factory.getInstance().getSpawnCounter() < 28){
					Factory.getInstance().addEnemy(new Tank(1));
				}
				if(Factory.getInstance().getSpawnCounter() >= 27){
					enemyTimer = 0;
					if(Factory.getInstance().getCounter() == 27){
						wave5 = true;
						wave++;
						wave4 = false;
					}
				}
			}
			if(wave5){
				//Grunts
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() < 29){
					Factory.getInstance().addEnemy(new Grunt(2));
				}
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() >= 28 && Factory.getInstance().getSpawnCounter() < 31){
					Factory.getInstance().addEnemy(new Grunt(1));
				}
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() >= 30 && Factory.getInstance().getSpawnCounter() < 33){
					Factory.getInstance().addEnemy(new Grunt(3));
				}
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() >= 32 && Factory.getInstance().getCounter() < 34){
					Factory.getInstance().addEnemy(new Tank(1));
				}
				if(enemyTimer / 24 == 2 && Factory.getInstance().getCounter() >= 33 && Factory.getInstance().getCounter() < 35){
					Factory.getInstance().addEnemy(new Tank(3));
				}
				if(enemyTimer / 24 == 2 && Factory.getInstance().getCounter() >= 34 && Factory.getInstance().getCounter() < 36){
					Factory.getInstance().addEnemy(new Tank(2));
				}
				if(Factory.getInstance().getSpawnCounter() >= 35){
					enemyTimer = 0;
					if(Factory.getInstance().getCounter() == 35){
						wave6 = true;
						wave++;
						wave5 = false;
					}
				}
			}
			if(wave6){
				//Grunts
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() < 38){
					Factory.getInstance().addEnemy(new Grunt(2));
				}
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() >= 37 && Factory.getInstance().getSpawnCounter() < 41){
					Factory.getInstance().addEnemy(new Grunt(1));
				}
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() >= 40 && Factory.getInstance().getSpawnCounter() < 42){
					Factory.getInstance().addEnemy(new Grunt(3));
				}
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() >= 41 && Factory.getInstance().getSpawnCounter() < 44){
					Factory.getInstance().addEnemy(new Tank(1));
				}
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() >= 43 && Factory.getInstance().getSpawnCounter() < 45){
					Factory.getInstance().addEnemy(new Tank(3));
				}
				if(enemyTimer / 24 == 2 && Factory.getInstance().getSpawnCounter() >= 44 && Factory.getInstance().getSpawnCounter() < 46){
					Factory.getInstance().addEnemy(new Tank(1));
				}
				if(Factory.getInstance().getSpawnCounter() >= 45){
					enemyTimer = 0;
					if(Factory.getInstance().getCounter() == 45){
						wave7 = true;
						wave++;
						wave6 = false;
					}
				}
			}
			if(wave7){
				Factory.getInstance().setCounter(0);
				Factory.getInstance().setSpawnCounter(0);
				wave1 = true;
				wave7 = false;
				
			}
		}
		public function gameOverCheck():void{
			if(Buildings.getHealth() <= 0){
				removeChild(health1);
				gameOver();
			}
		}
		public function notEnoughMoney():void{
			if(t1B.getInt() == 1 || mB.getInt() == 1 || morB.getInt() == 1){
				if(Factory.getInstance().getWallet() < Factory.getInstance().giveKost()){
					if(noMoney.alpha >= 0 && noMoney.alpha <= 1){
						if(!stage.contains(noMoney)){
							addChild(noMoney);	
						}
					}
					if(noMoney.alpha >= 1 && stage.contains(noMoney)){
						removeChild(noMoney);
						t1B.setInt(0);
						mB.setInt(0);
						morB.setInt(0);
						noMoney.alpha = 0;
					}
				}
			}
		}
	}
}