package com.managers
{
	import com.assets.Assets;
	import com.leebrimelow.starling.StarlingPool;
	import com.models.GameModel;
	import com.objects.EnemyGuy;
	import com.states.Play;
	import com.utils.RungeKuttaMover;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.extensions.PDParticleSystem;

	public class EnemyManager
	{
		private var _play:Play;
		private var bullets:Array;
		private static var pool:StarlingPool;
		public static var _guysOutAry:Array;
		private var count:int = 0;	
		private var _rungeKuttaMover:RungeKuttaMover;

		
		private var timeBetweenSending:int = 200;
		private var smoke:PDParticleSystem;
		
		public function EnemyManager(play:Play)
		{
			_play = play
			_guysOutAry = new Array();
			pool = new StarlingPool(EnemyGuy, 50)
			_rungeKuttaMover = new RungeKuttaMover(play)
				
				
		}
		
		public function update():void
		{
				var g:EnemyGuy;
				var len:int = _guysOutAry.length ;
				
				if( len > 0)
				{
					for (var i:int = len - 1; i>= 0; i--)
					{
						//					
						if (_guysOutAry[i].x < 800 && _guysOutAry[i].isHeld == false)
						{
							_guysOutAry[i].x += 5;
							_guysOutAry[i].isAttacking = false;
							//						destroyGuy(_guysOutAry[i]);		
						}
						//					
						//					if (_guysOutAry[i].isHeld == true && _guysOutAry[i].y < _guysOutAry[i].highestY)
						//					{
						//						_guysOutAry[i].highestY = _guysOutAry[i].y;
						//						trace("new highest y: " + _guysOutAry[i].highestY);
						//					}
						//
						if(_guysOutAry[i].x >= 800)
						{
							GameModel.castleHealth = GameModel.castleHealth - 1;
							//						trace("from manager healthy " + GameModel.castleHealth);
							_guysOutAry[i].x = 800;
							trace("at the wall x: " + _guysOutAry[i].x);
							
							
							if (!_guysOutAry[i].isAttacking)
							{
								_guysOutAry[i].isAttacking = true;
								_guysOutAry[i].playAttackingAnimation();
								
							}
							
						}
						//					
						//					if (_guysOutAry[i].y >= _guysOutAry[i].floorY)
						//					{
						//						if ( _guysOutAry[i].highestY <= GameModel.HEIGHT_TO_KILL)
						//						{
						//							smoke = new PDParticleSystem(XML(new Assets.smokeXml()),  Assets._defendCastleTextureAtlas.getTexture("smoke"));
						//							
						//							Starling.juggler.add(smoke);
						//							_play.addChild(smoke);
						//							smoke.start(.5);
						//							smoke.emitterX = _guysOutAry[i].x;
						//							smoke.emitterY = _guysOutAry[i].y;
						//							
						//							
						//							_guysOutAry[i].highestY = 500;
						//							_guysOutAry[i].x = 0;
						//							destroyGuy(_guysOutAry[i]);
						//							
						//							
						//						}
						//					}
						
					}
				}
				if (count%10 == 0)
				{
					//do something six times per second
				}
		}
		
		public function fire():void
		{
			var g:EnemyGuy = pool.getSprite() as EnemyGuy;
			_play.addChild(g);
			_guysOutAry.unshift(g);
			g.floorY = 250 + Math.random() * 100;
			g.y = g.floorY;
			g.visible = true;
			
			g.x = 0;
		}
		
		public static function destroyGuy(guy:EnemyGuy):void
		{
			trace("destory guy now! " + guy.highestY);
			
			var len:int = _guysOutAry.length;
			
			for (var j:int= len; j >=0; j--)
			{
				if (_guysOutAry[j] == guy){
					_guysOutAry.splice(j,1);
					guy.removeFromParent(true);
					pool.returnSprite(guy);
				}
			}
			
		}
		
		public static function returnGuy(guy:EnemyGuy):void
		{
			pool.returnSprite(guy);
			guy.removeFromParent;
			
			var len:int = _guysOutAry.length;
			
			for (var j:int= len; j >=0; j--)
			{
				if (_guysOutAry[j] == guy)
				{
					_guysOutAry.splice(j,1);
				}
			}
		}
		
		public function destroy():void
		{
			var len:int = _guysOutAry.length;
			
			for (var j:int= len-1; j >=0; j--)
			{
					_guysOutAry[j].removeFromParent(true);
//					_play.removeChil
//					_guysOutAry[j].y = 10;
					
			}
			
//			pool.destroy();
//			pool = null;
//			_guysOutAry = [];
		}
		
	}
}