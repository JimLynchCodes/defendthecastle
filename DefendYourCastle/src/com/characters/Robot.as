package com.characters
{
	
	import flash.events.Event;
	import flash.utils.ByteArray;
	
	import dragonBones.Armature;
	import dragonBones.animation.WorldClock;
	import dragonBones.factorys.StarlingFactory;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;

	public class Robot extends Sprite
	{
		
		[Embed(source = "RobotSmaller.png", mimeType = "application/octet-stream")]
		public static const RobotResource1:Class;
		
		
		private var factory:StarlingFactory;
		private var armature:Armature;
		private var armatureClip:Sprite;
		
		
		public function Robot()
		{
			init();
		}
		
		private function init():void
		{
		
			
			addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		
		}
		
		private function onAddedToStage(e:starling.events.Event):void
		{
			trace("added to stage robot");
			factory = new StarlingFactory();
			factory.addEventListener(flash.events.Event.COMPLETE, textureCompleteHandler);
			factory.parseData(new Robot.RobotResource1());	
			
		}		
		
		protected function textureCompleteHandler(event:flash.events.Event):void
		{
			trace("texture done");
			
			armature = factory.buildArmature("robot");
			armatureClip = armature.display as Sprite
			addChild(armatureClip);
			WorldClock.clock.add(armature);
			armature.animation.gotoAndPlay("run");
			armatureClip.scaleX = -1.5;
			armatureClip.scaleY = 1.5;
//			armatureClip.x = 100;
//			armatureClip.y = 100;
			
			armatureClip.addEventListener(TouchEvent.TOUCH, onRobotTouch);
		}
		
		private function onRobotTouch(e:TouchEvent):void
		{
			var touch:Touch = e.getTouch(e.target as DisplayObject);
			
			if (touch)
			{
				switch(touch.phase)
				{
					case "began":
						armature.animation.gotoAndPlay("oneLegStand");
//					case "moved":
//						armature.animation.gotoAndPlay("squat");
					case "ended":
						armature.animation.gotoAndPlay("oneLegStand");
				}
			}
			
		}
		
		
		public function playRunningAnimation():void
		{
			armature.animation.gotoAndPlay("run2");
		}
		
		public function playAttackingAnimation():void
		{
			armature.animation.gotoAndPlay("squat");
		}
		
		
		
	}
}