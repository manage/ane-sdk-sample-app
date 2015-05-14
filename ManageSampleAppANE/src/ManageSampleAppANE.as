package
{
	import com.manage.nativeExtensions.managesdk.Manage;
	import com.manage.nativeExtensions.managesdk.ManageEvent;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.Capabilities;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	[SWF(width='480', height='320', frameRate='30', backgroundColor='#000000')]
	
	public class ManageSampleAppANE extends Sprite
	{
		private var direction : int = 1;
		private var shape : Shape;
		
		private var buttonFormat : TextFormat;
		
		private var instance1 : Manage;
		private var instance2 : Manage;
		private var instance3 : Manage;

		private var feedback : TextField;
		
		public function ManageSampleAppANE()
		{
			shape = new Shape();
			shape.graphics.beginFill( 0x666666 );
			shape.graphics.drawCircle( 0, 0, 100 );
			shape.graphics.endFill();
			shape.x = 0;
			shape.y = 200;
			addChild( shape );
			
			feedback = new TextField();
			var format : TextFormat = new TextFormat();
			format.font = "_sans";
			format.size = 16;
			format.color = 0xFFFFFF;
			feedback.defaultTextFormat = format;
			feedback.width = 320;
			feedback.height = 100;
			feedback.x = 10;
			feedback.y = 400;
			feedback.multiline = true;
			feedback.wordWrap = true;
			feedback.text = "4/24/14-2";
			addChild( feedback );
			
			createButtons();
			
			addEventListener( Event.ENTER_FRAME, animate );
			addEventListener( Event.ENTER_FRAME, init );
			
			var os : String = Capabilities.version.substr(0,3);
			
			
			if( os == "IOS" )
			{
				instance1 = new Manage("5eALOrZeZjAQEmb2cyi1fw", null);
				setInterstitialListeners(instance1);
				
				instance2 = new Manage("2ChkpdCmCnSeJBaprqM0bg", "support@appsponsor.com", true);
				setInterstitialListeners(instance2);

				instance3 = new Manage("5eALOrZeZjAQEmb2cyi1fw", null);
				setInterstitialListeners(instance3);
			}
			else
			{
				instance1 = new Manage("oIs29VQKIa2IfaA4FWkEqw", null);
				setInterstitialListeners(instance1);
				
				instance2 = new Manage("82lEvN030_0zL0kShgS_hw", "support@appsponsor.com", true);
				setInterstitialListeners(instance2);

				instance3 = new Manage("oIs29VQKIa2IfaA4FWkEqw", null);
				setInterstitialListeners(instance3);
			}
		}
		
		private function init( event : Event ) : void
		{
			removeEventListener( Event.ENTER_FRAME, init );
		}
		
		private function createButtons() : void
		{
			var startX : Number = 10;
			var startX2: Number = 130;
			var startX3: Number = 250;
			var startX4: Number = 370;

			var bottomInd: Number = 60;
			var nextY : Number = -150;
			
			//ad 1
			var loadButton1 : TextField = createButton( "Load Ad" );
			loadButton1.x = startX;
			loadButton1.y = nextY;
			loadButton1.addEventListener( MouseEvent.MOUSE_DOWN, loadInterstitial1 );
			addChild( loadButton1 );
			
			var showButton1 : TextField = createButton( "Present Ad" );
			showButton1.x = startX2;
			showButton1.y = nextY;
			showButton1.addEventListener( MouseEvent.MOUSE_DOWN, showInterstitial1 );
			addChild( showButton1 );
			
			var loadShowButton1 : TextField = createButton( "LP Ad" );
			loadShowButton1.x = startX3;
			loadShowButton1.y = nextY;
			loadShowButton1.addEventListener( MouseEvent.MOUSE_DOWN, loadShowInterstitial1 );
			addChild( loadShowButton1 );
			
			var loadEventButton1 : TextField = createButton( "LP E Ad" );
			loadEventButton1.x = startX4;
			loadEventButton1.y = nextY;
			loadEventButton1.addEventListener( MouseEvent.MOUSE_DOWN, loadEventInterstitial1 );
			addChild( loadEventButton1 );		
			
			nextY += bottomInd;
			
			//ad 2
			var loadButton2 : TextField = createButton( "Load RAd" );
			loadButton2.x = startX;
			loadButton2.y = nextY;
			loadButton2.addEventListener( MouseEvent.MOUSE_DOWN, loadInterstitial2 );
			addChild( loadButton2 );
			
			var showButton2 : TextField = createButton( "Present RAd" );
			showButton2.x = startX2;
			showButton2.y = nextY;
			showButton2.addEventListener( MouseEvent.MOUSE_DOWN, showInterstitial2 );
			addChild( showButton2 );
			
			var loadShowButton2 : TextField = createButton( "LP RAd" );
			loadShowButton2.x = startX3;
			loadShowButton2.y = nextY;
			loadShowButton2.addEventListener( MouseEvent.MOUSE_DOWN, loadShowInterstitial2 );
			addChild( loadShowButton2 );
			
			var loadEventButton2 : TextField = createButton( "LP E RAd" );
			loadEventButton2.x = startX4;
			loadEventButton2.y = nextY;
			loadEventButton2.addEventListener( MouseEvent.MOUSE_DOWN, loadEventInterstitial2 );
			addChild( loadEventButton2 );	
		}
		
		// actions
		
		private function loadInterstitial1( event : MouseEvent ) : void
		{
			instance1.load();			
			feedback.text = "loadInterstitial1d();";
		}
		
		private function showInterstitial1( event : MouseEvent ) : void
		{
			instance1.presentAd();	
			feedback.text = "showInterstitial1d();";
		}
		
		private function loadShowInterstitial1( event : MouseEvent ) : void
		{
			instance1.loadAndPresentAd();	
			feedback.text = "loadShowInterstitial1();";
		}
		
		private function loadEventInterstitial1( event: MouseEvent ) : void
		{
			instance1.addEventListener( ManageEvent.AD_CACHED, presentAd1 );
			instance1.load();
			feedback.text = "loadEventInterstitial1();";

		}
		
		private function loadInterstitial2( event : MouseEvent ) : void
		{
			instance2.load();	
			feedback.text = "loadInterstitial2d();";
		}
		
		private function showInterstitial2( event : MouseEvent ) : void
		{
			instance2.presentAd();	
			feedback.text = "showInterstitial2d();";
		}
		
		private function loadShowInterstitial2( event : MouseEvent ) : void
		{
			instance2.loadAndPresentAd();	
			feedback.text = "loadShowInterstitial2();";
		}
		
		private function loadEventInterstitial2( event: MouseEvent ) : void
		{
			instance2.addEventListener( ManageEvent.AD_CACHED, presentAd2 );
			instance2.load();	
			feedback.text = "loadEventInterstitial2();";
		}
		
		
		private function createButton( label : String ) : TextField
		{
			if( !buttonFormat )
			{
				buttonFormat = new TextFormat();
				buttonFormat.font = "_sans";
				buttonFormat.size = 14;
				buttonFormat.bold = true;
				buttonFormat.color = 0xFFFFFF;
				buttonFormat.align = TextFormatAlign.CENTER;
			}
			
			var textField : TextField = new TextField();
			textField.defaultTextFormat = buttonFormat;
			textField.width = 100;
			textField.height = 50;
			textField.text = label;
			textField.backgroundColor = 0xCC0000;
			textField.background = true;
			textField.selectable = false;
			textField.multiline = false;
			textField.wordWrap = false;
			return textField;
		}
		
		
		private function animate( event : Event ) : void
		{
			shape.x += direction;
			if( shape.x <= 0 )
			{
				direction = 1;
			}
			if( shape.x > 480 )
			{
				direction = -1;
			}
		}
		
		private function setInterstitialListeners( interstitial : Manage ) : void
		{
			interstitial.addEventListener( ManageEvent.LOAD_FAILED, eventReceived );
			interstitial.addEventListener( ManageEvent.AD_WILLAPPEAR, eventReceived );
			interstitial.addEventListener( ManageEvent.AD_WILLDISAPPEAR, eventReceived );
			interstitial.addEventListener( ManageEvent.AD_CACHED, eventReceived );
			interstitial.addEventListener( ManageEvent.AD_REWARD_END, eventReceived );
		}
		
		private function removeInterstitialListeners( interstitial : Manage ) : void
		{
			interstitial.removeEventListener( ManageEvent.LOAD_FAILED, eventReceived );
			interstitial.removeEventListener( ManageEvent.AD_WILLAPPEAR, eventReceived );
			interstitial.removeEventListener( ManageEvent.AD_WILLDISAPPEAR, eventReceived );
			interstitial.removeEventListener( ManageEvent.AD_CACHED, eventReceived );
			interstitial.removeEventListener( ManageEvent.AD_REWARD_END, eventReceived );
		}		
		
		private function presentAd1( event : ManageEvent ) : void
		{
			feedback.text = "event type: presentAd()1: " + event.type;
			if (instance1.isReady())
			{
				instance1.presentAd();
			}
		}
		
		private function presentAd2( event : ManageEvent ) : void
		{
			feedback.text = "event type: presentAd()1: " + event.type;
			if (instance2.isReady())
			{
				instance2.presentAd();
			}
		}
		
		private function eventReceived( event : ManageEvent ) : void
		{
			feedback.text = "event type:" + event.type;
		}
	}
}
