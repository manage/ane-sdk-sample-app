package
{
	import com.appsponsor.nativeExtensions.appsponsorsdk.AppSponsor;
	import com.appsponsor.nativeExtensions.appsponsorsdk.AppSponsorEvent;
	
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
		
		private var interstitial1 : AppSponsor;
		private var interstitial2 : AppSponsor;
		
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
				interstitial1 = new AppSponsor("5eALOrZeZjAQEmb2cyi1fw");
				setInterstitialListeners(interstitial1);
				
				interstitial2 = new AppSponsor("2ChkpdCmCnSeJBaprqM0bg", "support@appsponsor.com", true);
				setInterstitialListeners(interstitial2);
			}
			else
			{
				interstitial1 = new AppSponsor("oIs29VQKIa2IfaA4FWkEqw");
				setInterstitialListeners(interstitial1);
				
				interstitial2 = new AppSponsor("82lEvN030_0zL0kShgS_hw", "support@appsponsor.com", true);
				setInterstitialListeners(interstitial1);
			}
		}
		
		private function init( event : Event ) : void
		{
			removeEventListener( Event.ENTER_FRAME, init );
		}
		
		private function createButtons() : void
		{
			var startX : Number = 40;
			var startX2: Number = 200;
			var startX3: Number = 360;
			
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
		}
		
		// actions
		
		private function loadInterstitial1( event : MouseEvent ) : void
		{
			interstitial1.load();			
			feedback.text = "loadInterstitial1d();";
		}
		
		private function showInterstitial1( event : MouseEvent ) : void
		{
			interstitial1.presentAd();	
			feedback.text = "showInterstitial1d();";
		}
		
		private function loadShowInterstitial1( event : MouseEvent ) : void
		{
			interstitial1.loadAndPresentAd();	
			feedback.text = "showInterstitial1d();";
		}
		
		private function loadInterstitial2( event : MouseEvent ) : void
		{
			interstitial2.load();	
			feedback.text = "loadInterstitial2d();";
		}
		
		private function showInterstitial2( event : MouseEvent ) : void
		{
			interstitial2.presentAd();	
			feedback.text = "showInterstitial2d();";
		}
		
		private function loadShowInterstitial2( event : MouseEvent ) : void
		{
			interstitial2.loadAndPresentAd();	
			feedback.text = "showInterstitial2d();";
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
		
		private function setInterstitialListeners( interstitial : AppSponsor ) : void
		{
			interstitial.addEventListener( AppSponsorEvent.LOAD_FAILED, eventReceived );
			interstitial.addEventListener( AppSponsorEvent.AD_WILLAPPEAR, eventReceived );
			interstitial.addEventListener( AppSponsorEvent.AD_WILLDISAPPEAR, eventReceived );
			interstitial.addEventListener( AppSponsorEvent.AD_CACHED, eventReceived );
			interstitial.addEventListener( AppSponsorEvent.AD_REWARD_END, eventReceived );
		}
		
		private function removeInterstitialListeners( interstitial : AppSponsor ) : void
		{
			interstitial.removeEventListener( AppSponsorEvent.LOAD_FAILED, eventReceived );
			interstitial.removeEventListener( AppSponsorEvent.AD_WILLAPPEAR, eventReceived );
			interstitial.removeEventListener( AppSponsorEvent.AD_WILLDISAPPEAR, eventReceived );
			interstitial.removeEventListener( AppSponsorEvent.AD_CACHED, eventReceived );
			interstitial.removeEventListener( AppSponsorEvent.AD_REWARD_END, eventReceived );
		}		
		
		private function eventReceived( event : AppSponsorEvent ) : void
		{
			feedback.text = "event type:" + event.type;
		}
	}
}
