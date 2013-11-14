package com.states
{
	import com.assets.Assets;
	import com.characters.Robot;
	import com.views.NewViewIos;
	import com.zf.ui.buttons.loadGameButton.LoadGameButton;
	
	import dragonBones.animation.WorldClock;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class MainMenu extends Sprite implements IDCState
	{
		private var _mainView:NewViewIos;
		private var _model:Object;
		private var _bkgd:Image;
		private var _logo:Button;
		private var newGameBtnT:Button;
		public function MainMenu(mainView:NewViewIos, model:Object)
		{
			_mainView = mainView;
			_model = model
				
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			trace("da main been added, sir");
			buildScreen();
			addListeners();
		}
		
		private function addListeners():void
		{
			_logo.addEventListener(Event.TRIGGERED, onClick);
			
		}
		
		private function onClick():void
		{
			trace("clicked");
			_mainView.changeState(NewViewIos.PLAY_STATE);
		}
		
		private function buildScreen():void
		{
			
//			_bkgd = new Image(Assets.bkgdT);
//			stage.addChild(_bkgd);
			
			trace(Assets.logoT);
			_logo = new Button(Assets.logoT);
			_logo.x = 75;
			_logo.y = 75;
			addChild(_logo);
			
			trace(Assets.newGameBtnT);
			newGameBtnT = new Button(Assets.newGameBtnT);
			newGameBtnT.x = 75;
			newGameBtnT.y = 75;
			addChild(newGameBtnT);
			
			trace(Assets.number);
			Assets.number += 4;
			trace(Assets.number);
			
			var robot:Robot = new Robot();
			addChild(robot);
			
			
//			_game1 = new LoadGameButton('Game 1', 'game1');
//			_game1.x = 50;
//			_game1.y = 450;
//			_game1.onGameSelected.add(_onGameSelected);
//			addChild(_game1);
//			
//			_game2 = new LoadGameButton('Game 2', 'game2');
//			_game2.x = 300;
//			_game2.y = 450;
//			_game2.onGameSelected.add(_onGameSelected);
//			addChild(_game2);
//			
//			_game3 = new LoadGameButton('Game 3', 'game3');
//			_game3.x = 525;
//			_game3.y = 450;
//			_game3.onGameSelected.add(_onGameSelected);
//			addChild(_game3);
			
		}
		
		public function update():void
		{
			WorldClock.clock.advanceTime(-1);
			
		}
		
		public function destroy():void
		{
			_logo.removeFromParent(true);
			_logo = null;
		}
	}
}