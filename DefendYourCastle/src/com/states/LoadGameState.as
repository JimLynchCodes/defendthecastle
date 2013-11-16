package com.states
{
	import com.assets.Assets;
	import com.models.SaveModel;
	import com.views.DcMainView;
	
	import flash.net.SharedObject;
	
	import feathers.controls.Button;
	import feathers.text.BitmapFontTextFormat;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class LoadGameState extends Sprite implements IDCState
	{
		
		private var _mainView:DcMainView;
		private var _model:Object;
		private var _LoadGamePopup:Image;
		private var _loadGameSprite:Sprite;
		private var shared:SharedObject;
		
		public function LoadGameState(mainView:DcMainView, model:Object)
		{
			_mainView = mainView;
			_model = model
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);	
		}
		
		private function onAddedToStage():void
		{
			buildScreen();
			
		}
		
		private function buildScreen():void
		{
			_loadGameSprite = new Sprite;
			this.addChild(_loadGameSprite);
			
			_LoadGamePopup = new Image(Assets.genericPopup);
			_loadGameSprite.addChild(_LoadGamePopup);
			
			var titleTF:TextField = new TextField(450, 200, "SELECT FILE" , "BasicWhiteFont", 50, 0xFFFFFF);
			titleTF.hAlign = "center";
			titleTF.x = 200;
			titleTF.y = -40;
			_loadGameSprite.addChild(titleTF);
			
			var game1Btn:Button = new Button();
			game1Btn.defaultSkin = new Image(Assets.greenBtnT);
			game1Btn.label = "Game 1";
			game1Btn.defaultLabelProperties.textFormat = new BitmapFontTextFormat("BasicWhiteFont", 25);
			game1Btn.x = 120
			game1Btn.y = 208
			game1Btn.labelOffsetX = - 10; 
			_loadGameSprite.addChild(game1Btn);
			game1Btn.name = "game1";
			game1Btn.addEventListener(starling.events.Event.TRIGGERED, onGame1BtnClicked)
			
			var game2Btn:Button = new Button();
			game2Btn.defaultSkin = new Image(Assets.greenBtnT);
			game2Btn.label = "Game 2";
			game2Btn.defaultLabelProperties.textFormat = new BitmapFontTextFormat("BasicWhiteFont", 25);
			game2Btn.x = 235
			game2Btn.y = 208
			game2Btn.labelOffsetX = - 10; 
			_loadGameSprite.addChild(game2Btn);
			game2Btn.name = "game2";
			game2Btn.addEventListener(starling.events.Event.TRIGGERED, onGame2BtnClicked)
			
			var game3Btn:Button = new Button();
			game3Btn.defaultSkin = new Image(Assets.greenBtnT);
			game3Btn.label = "Game 3";
			game3Btn.defaultLabelProperties.textFormat = new BitmapFontTextFormat("BasicWhiteFont", 25);
			game3Btn.x = 350
			game3Btn.y = 208
			game3Btn.labelOffsetX = - 10; 
			_loadGameSprite.addChild(game3Btn);
			game3Btn.name = "game3";
			game3Btn.addEventListener(starling.events.Event.TRIGGERED, onGame3BtnClicked)
			
			var quitBtn:Button = new Button();
			quitBtn.defaultSkin = new Image(Assets.greenBtnT);
			quitBtn.label = "Quit";
			quitBtn.defaultLabelProperties.textFormat = new BitmapFontTextFormat("BasicWhiteFont", 25);
			quitBtn.x = 220
			quitBtn.y = 308
			quitBtn.labelOffsetX = - 10; 
			//			creditsBtn.name = jsonArray.staff[i].RestId
			_loadGameSprite.addChild(quitBtn);
			quitBtn.addEventListener(starling.events.Event.TRIGGERED, onQuitBtnClicked)
				
		}
		
		private function onQuitBtnClicked():void
		{
			_mainView.changeState(DcMainView.MAIN_MENU_STATE);
		}
		
		private function loadSavedObject(gameName:String):void
		{
			shared = SharedObject.getLocal(gameName);
			SaveModel.sharedObj = shared;
			
			if (shared.data.g ==undefined) {
				shared.data.g = 1;
				trace("starting a new game on: " + gameName + " " + shared.data.g);
			}
			else {
				shared.data.g ++;
				trace("game data found on: " + gameName + "!" + shared.data.g);
				
				SaveModel.fillWithSavedData();
			}
//			show_text(shared.data.visits);
//			shared.close();
			
		}
		
		private function onGame3BtnClicked(e:Event):void
		{
			var btn:Button = e.currentTarget as Button;
			trace("event.currentTarget.name " + btn.name);
			
			loadSavedObject(btn.name);
			
			_mainView.changeState(DcMainView.SHOP_STATE);
			
			
		}
		
		
		private function onGame2BtnClicked(e:Event):void
		{
			var btn:Button = e.currentTarget as Button;
			trace("event.currentTarget.name " + btn.name);
			loadSavedObject(btn.name);
			_mainView.changeState(DcMainView.SHOP_STATE);
			
		}
		
		private function onGame1BtnClicked(e:Event):void
		{
			var btn:Button = e.currentTarget as Button;
			trace("event.currentTarget.name " + btn.name);
			loadSavedObject(btn.name);
			_mainView.changeState(DcMainView.SHOP_STATE);
			
		}
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
			_loadGameSprite.removeFromParent(true);
			
			
		}
	}
}