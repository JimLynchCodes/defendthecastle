package com.states
{
	import com.assets.Assets;
	import com.views.DcMainView;
	
	import feathers.controls.Button;
	import feathers.text.BitmapFontTextFormat;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class AchievementsState extends Sprite implements IDCState
	{
		
		private var _mainView:DcMainView;
		private var _model:Object;
		private var _achievementsSprite:Sprite;
		private var _achievementsPopup:Image;
		
		public function AchievementsState(mainView:DcMainView, model:Object)
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
		
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
			_achievementsSprite.removeFromParent(true);
			
		}
		
		private function buildScreen():void
		{
			
			_achievementsSprite = new Sprite;
			this.addChild(_achievementsSprite);
			
			_achievementsPopup = new Image(Assets.genericPopup);
			_achievementsSprite.addChild(_achievementsPopup);
			
			var titleTF:TextField = new TextField(450, 200, "ACHIEVEMENTS" , "BasicWhiteFont", 50, 0xFFFFFF);
			titleTF.hAlign = "center";
			titleTF.x = 200;
			titleTF.y = -40;
			_achievementsSprite.addChild(titleTF);
			
			var achievement1Btn:Button = new Button();
			achievement1Btn.defaultSkin = new Image(Assets.greenBtnT);
			achievement1Btn.label = "Achievement1";
			achievement1Btn.defaultLabelProperties.textFormat = new BitmapFontTextFormat("BasicWhiteFont", 25);
			achievement1Btn.x = 120
			achievement1Btn.y = 208
			achievement1Btn.labelOffsetX = - 10; 
			//			startBtn.name = jsonArray.staff[i].RestId
			_achievementsSprite.addChild(achievement1Btn);
			achievement1Btn.addEventListener(starling.events.Event.TRIGGERED, onAchievement1BtnClicked)
			
				
				
			var rewardsBtn:Button = new Button();
			rewardsBtn.defaultSkin = new Image(Assets.greenBtnT);
			rewardsBtn.label = "REWARDS";
			rewardsBtn.defaultLabelProperties.textFormat = new BitmapFontTextFormat("BasicWhiteFont", 25);
			rewardsBtn.x = 320
			rewardsBtn.y = 408
			rewardsBtn.labelOffsetX = - 10; 
			//			creditsBtn.name = jsonArray.staff[i].RestId
			_achievementsSprite.addChild(rewardsBtn);
			rewardsBtn.addEventListener(starling.events.Event.TRIGGERED, onRewardsBtnClicked)
				
			var quitBtn:Button = new Button();
			quitBtn.defaultSkin = new Image(Assets.greenBtnT);
			quitBtn.label = "Quit";
			quitBtn.defaultLabelProperties.textFormat = new BitmapFontTextFormat("BasicWhiteFont", 25);
			quitBtn.x = 420
			quitBtn.y = 208
			quitBtn.labelOffsetX = - 10; 
			//			creditsBtn.name = jsonArray.staff[i].RestId
			_achievementsSprite.addChild(quitBtn);
			quitBtn.addEventListener(starling.events.Event.TRIGGERED, onQuitBtnClicked)
			
			
			
		}
		
		private function onQuitBtnClicked():void
		{
			_mainView.changeState(DcMainView.SHOP_STATE);
			
		}
		
		private function onAchievement1BtnClicked():void
		{
			
			// tween in achievement description popup
			
		}		
		
		private function onRewardsBtnClicked():void
		{
			_mainView.changeState(DcMainView.ACHIEVEMENT_REWARDS_STATE);
			
		}		
		
	}
}