package com.states
{
	import com.assets.Assets;
	import com.trash.NewViewIos;
	import com.views.DcMainView;
	
	import feathers.controls.Button;
	import feathers.text.BitmapFontTextFormat;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class ShopState extends Sprite implements IDCState
	{
		private var _mainView:DcMainView;
		private var _model:Object;
		private var _shopSprite:Sprite;
		private var _shopPopup:Image;
		
		public function ShopState(mainView:DcMainView, model:Object)
		{
			_mainView = mainView;
			_model = model
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			trace("da main been added, sir");
			buildScreen();
			
		}
		
		private function buildScreen():void
		{
			
			_shopSprite = new Sprite;
			this.addChild(_shopSprite);
			
			_shopPopup = new Image(Assets.genericPopup);
			_shopSprite.addChild(_shopPopup);
			
			var titleTF:TextField = new TextField(450, 200, "SHOP" , "BasicWhiteFont", 50, 0xFFFFFF);
			titleTF.hAlign = "center";
			titleTF.x = 200;
			titleTF.y = -40;
			_shopSprite.addChild(titleTF);
			
			var nextBtn:Button = new Button();
			nextBtn.defaultSkin = new Image(Assets.greenBtnT);
			nextBtn.label = "Play Game";
			nextBtn.defaultLabelProperties.textFormat = new BitmapFontTextFormat("BasicWhiteFont", 25);
			nextBtn.x = 120
			nextBtn.y = 208
			nextBtn.labelOffsetX = - 10; 
			//			startBtn.name = jsonArray.staff[i].RestId
			_shopSprite.addChild(nextBtn);
			nextBtn.addEventListener(starling.events.Event.TRIGGERED, onPlayGameBtnClicked)
			
			var quitBtn:Button = new Button();
			quitBtn.defaultSkin = new Image(Assets.greenBtnT);
			quitBtn.label = "QUIT";
			quitBtn.defaultLabelProperties.textFormat = new BitmapFontTextFormat("BasicWhiteFont", 25);
			quitBtn.x = 220
			quitBtn.y = 208
			quitBtn.labelOffsetX = - 10; 
			//			creditsBtn.name = jsonArray.staff[i].RestId
			_shopSprite.addChild(quitBtn);
			quitBtn.addEventListener(starling.events.Event.TRIGGERED, onQuitBtnClicked)
			
			var achievementsBtn:Button = new Button();
			achievementsBtn.defaultSkin = new Image(Assets.greenBtnT);
			achievementsBtn.label = "Achievements";
			achievementsBtn.defaultLabelProperties.textFormat = new BitmapFontTextFormat("BasicWhiteFont", 25);
			achievementsBtn.x = 220
			achievementsBtn.y = 308
			achievementsBtn.labelOffsetX = - 10; 
			//			creditsBtn.name = jsonArray.staff[i].RestId
			_shopSprite.addChild(achievementsBtn);
			achievementsBtn.addEventListener(starling.events.Event.TRIGGERED, onAchievementsBtnClicked)
			
			var buyCurrencyBtn:Button = new Button();
			buyCurrencyBtn.defaultSkin = new Image(Assets.greenBtnT);
			buyCurrencyBtn.label = "Buy Currency";
			buyCurrencyBtn.defaultLabelProperties.textFormat = new BitmapFontTextFormat("BasicWhiteFont", 25);
			buyCurrencyBtn.x = 220
			buyCurrencyBtn.y = 408
			buyCurrencyBtn.labelOffsetX = - 10; 
			//			creditsBtn.name = jsonArray.staff[i].RestId
			_shopSprite.addChild(buyCurrencyBtn);
			buyCurrencyBtn.addEventListener(starling.events.Event.TRIGGERED, onBuyCurencyBtnClicked)
			
			var exchangeCurrencyBtn:Button = new Button();
			exchangeCurrencyBtn.defaultSkin = new Image(Assets.greenBtnT);
			exchangeCurrencyBtn.label = "Exchange Currency";
			exchangeCurrencyBtn.defaultLabelProperties.textFormat = new BitmapFontTextFormat("BasicWhiteFont", 25);
			exchangeCurrencyBtn.x = 220
			exchangeCurrencyBtn.y = 508
			exchangeCurrencyBtn.labelOffsetX = - 10; 
			//			creditsBtn.name = jsonArray.staff[i].RestId
			_shopSprite.addChild(exchangeCurrencyBtn);
			exchangeCurrencyBtn.addEventListener(starling.events.Event.TRIGGERED, onExchangeCurrencyBtnClicked)
			
			
			
		}
		
		private function onExchangeCurrencyBtnClicked():void
		{
			_mainView.changeState(DcMainView.EXCHANGE_CURRENCY_STATE);
			
		}
		
		private function onBuyCurencyBtnClicked():void
		{
			_mainView.changeState(DcMainView.BUY_CURRENCY_STATE);
			
		}
		
		private function onAchievementsBtnClicked():void
		{
			_mainView.changeState(DcMainView.ACHIEVEMENTS_STATE);
		}
		
		private function onQuitBtnClicked():void
		{
			
			_mainView.changeState(DcMainView.LOAD_GAME_STATE);
			
		}
		
		private function onPlayGameBtnClicked():void
		{
			_mainView.changeState(DcMainView.LEVEL_SELECT_STATE);
		}
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
			
			_shopSprite.removeFromParent(true);
		}
	}
}