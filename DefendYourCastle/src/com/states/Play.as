package com.states
{
	import com.assets.Assets;
	import com.leebrimelow.starling.StarlingPool1Param;
	import com.managers.EnemyManager;
	import com.models.GameModel;
	import com.objects.EnemyGuy;
	import com.utils.GuyMover;
	import com.utils.RungeKuttaMover;
	import com.views.NewViewIos;
	
	import flash.geom.Point;
	import flash.utils.getTimer;
	
	import dragonBones.animation.WorldClock;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.text.TextField;
	import starling.textures.Texture;
	
	public class Play extends Sprite implements IDCState
	{
		private var _mainView:NewViewIos;
		private var _model:Object;
		private var _bg:Image;
		private var _guyMc:MovieClip;
		private var _holdingGuy:Boolean;
		private var _fingerUpPosition:Point = new Point();
		private var _throwVelocity:Point = new Point();
		private var _guyPosAry:Array = [];
		private var _offsetY:Number;
		private var _offsetX:Number;
		private var _currentTime:int;
		private var _oldTime:int;
		private var _fingerDownPosition:Point = new Point();
		private var enemy:EnemyGuy;
		private var _enemyManager:EnemyManager;
		private var _rungeKuttaMover:RungeKuttaMover;
		private var _guyCount:int = 0;
		private var _guySpawnCount:int = 0;
		private var _rungePool:StarlingPool1Param;
		private var _guyMover:GuyMover;
		public static var _killsTF:TextField;
		public static var _healthTF:TextField;
		public static var _timeTF:TextField;
		private var _levelTimer :int;
		private var _secondsGone:int;
		private var _secondsLeft:int = 100;
		private var _levelTimeLength:int = 100;
		
		public function Play(mainView:NewViewIos, model:Object)
		{
			_mainView = mainView;
			_model = model
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			trace("playing the play baby");
			buildScreen();
			
			resetGame();
			
			_rungePool = new StarlingPool1Param(RungeKuttaMover, 10, this);
			_guyMover = GuyMover.getInstance();
		}
		
		private function resetGame():void
		{
			GameModel.castleHealth = 1000;
		}		
		
		private function buildScreen():void
		{
			var _velocity:Point = new Point(0,0);
			
//			trace("beginnig the add");
			_bg = new Image(Assets.gameBgT)
			this.addChild(_bg);
//				trace("adding the bg");
				
				_enemyManager = new EnemyManager(this);
				
				_killsTF = new TextField(250, 200, "CASUALTIES: 0" , "KomikaAxis", 30, 0xFFFFFF);
				_killsTF.hAlign = "center";
				_killsTF.x = 25;
				_killsTF.y = -40;
				addChild(_killsTF);
				
				_healthTF = new TextField(250, 200, "HEALTH:" , "KomikaAxis", 30, 0xFFFFFF);
				_healthTF.hAlign = "center";
				_healthTF.x = 705;
				_healthTF.y = -40;
				_healthTF.text = "HEALTH: " + GameModel.castleHealth;
				addChild(_healthTF);
				
				_timeTF = new TextField(250, 200, "TIME:" , "KomikaAxis", 30, 0xFFFFFF);
				_timeTF.hAlign = "center";
				_timeTF.x = 390;
				_timeTF.y = -40;
				_secondsLeft = _levelTimeLength;
				_timeTF.text = "TIME: " + _secondsLeft;
				addChild(_timeTF);
				
		}
		
		public function update():void
		{
			
			WorldClock.clock.advanceTime(-1);
			_guyCount++;
			_guySpawnCount++;
			
			_levelTimer ++;
//			trace("_levelTimer" + _levelTimer);
			if (_levelTimer % 60 == 0)
			{
				_secondsLeft--;
				trace("seconds left: " + _secondsLeft);
				_timeTF.text = "TIME: " + _secondsLeft;
			}
			
			if (_guySpawnCount > 200)
			{
				_guySpawnCount = 0;
				_enemyManager.fire();
//				EnemyManager._guysOutAry[0].addEventListener(TouchEvent.TOUCH, onTouchEvent);
				GameModel.guysSentThisLevel = GameModel.guysSentThisLevel + 1;
			}

			if (_enemyManager != null)
			{
				_enemyManager.update();
				
			}
			_guyMover.update();
			
//			var len:int = GameModel.rungeMoverAry.length;
//			
//			if (len > 0)
//			{
//				for (var j:int = 0; j < GameModel.rungeMoverAry.length; j++)
//				{
//					GameModel.rungeMoverAry[j].moveGuy();
//				}
//				trace("should be moving");
//				
//			}
//			_rungeKuttaMover.update();
		}
		
		
		public function destroy():void
		{
			_bg.removeFromParent(true);
			_bg = null;
			
			removeChild(_killsTF);
			removeChild(_healthTF);
			
			_killsTF = null;
			_healthTF = null;
//			_rungePool = null;
//			_guyMover = null;
			
			_enemyManager.destroy();
//			_enemyManager = null;
//			_guyMover.destroy();
			
//			this.removeFromParent(true);
			
		}
	}
}