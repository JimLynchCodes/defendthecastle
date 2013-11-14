package com.states
{
	import com.views.NewViewIos;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Shop extends Sprite implements IDCState
	{
		private var _mainView:NewViewIos;
		private var _model:Object;
		public function Shop(mainView:NewViewIos, model:Object)
		{
			_mainView = mainView;
			_model = model
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			// TODO Auto Generated method stub
			
		}
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
		}
	}
}