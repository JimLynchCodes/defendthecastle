package
{
	
	import com.configu.DCConfig;
	import com.controllers.DCController;
	import com.models.DCModel;
	import com.views.NewViewIos;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageAspectRatio;
	import flash.display.StageOrientation;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	
	[SWF(frameRate="60", width="960", height="640", backgroundColor="0x333333")]
	
	
	public class DefendYourCastle extends Sprite
	{
		private var _stage:Stage;
		private var _config:DCConfig;
		private var _model:DCModel;
		private var _controller:DCController;
		private var _mainView:Starling;
		private var _version:String;
		private var _nativeStage:Stage;
		private var _realWidth:int;
		private var _realHeight:int;
		private var viewPort:Rectangle;
		
		
		
		public function DefendYourCastle()
		{
			init();
		}
		
		
		private function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			assignVars();
		}
		
		
		private function assignVars():void
		{
			_nativeStage = stage;
			
			_realWidth = stage.fullScreenWidth;
			_realHeight= stage.fullScreenHeight;
			
			// makes display only landscape, put this the other way if portrait
			
			_config = new DCConfig();
			_model = new DCModel(_config);
			_controller = new DCController(_model);
			
//			viewPort = new Rectangle(0,0, _realWidth, _realHeight);
				
//			var viewPort:Rectangle = new Rectangle(0,0 , _realWidth, _realHeight) 
			_version = Capabilities.version;
			
			if (_version.substr(0, 3) == "IOS")
			{
			var viewPort:Rectangle = new Rectangle(0,0 , _realWidth, _realHeight) 
			Starling.handleLostContext = true;
				
				trace("starting ipad class");
				_mainView = new Starling(NewViewIos, stage, viewPort, null, "auto");
				_mainView.stage.stageWidth = 960;
				_mainView.stage.stageHeight = 640;
				
				_mainView.antiAliasing = 1;
				_mainView.addEventListener(starling.events.Event.ROOT_CREATED, onMainViewCreated);
				_mainView.start();
				
				trace(_mainView.contentScaleFactor)
				
				
			}
			if (_version.substr(0, 3) == "AND")
			{
				
				this.stage.setAspectRatio( StageAspectRatio.LANDSCAPE );
				
				
				viewPort = new Rectangle(0,0 , _realHeight, _realWidth) 
				trace("starting android class");
				_mainView = new Starling(NewViewIos, stage, viewPort, null, "auto");
				_mainView.stage.stageWidth = 960;
				_mainView.stage.stageHeight = 640;
				
				_mainView.antiAliasing = 1;
				_mainView.addEventListener(starling.events.Event.ROOT_CREATED, onMainViewCreated);
				_mainView.start();
				
				trace(_mainView.contentScaleFactor)
				
				
			}
			
		}
		
		protected function onContextCreated(event:flash.events.Event):void
		{
			// TODO Auto-generated method stub
			
		}		
		
		private function onMainViewCreated(e:starling.events.Event):void
		{
			var createdView:NewViewIos = Starling.current.root as NewViewIos;
			
			createdView.passVars(_model, _controller);
			
//			_mainView.stage.addChild((createdView));
			
		}
		
		
		
	}
}