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
		private var interstitial3 : AppSponsor;
		private var interstitial4 : AppSponsor;
		private var interstitial5 : AppSponsor;
		private var interstitial6 : AppSponsor;
		private var interstitial7 : AppSponsor;
		private var interstitial8 : AppSponsor;
		private var interstitial9 : AppSponsor;
		private var interstitialTest : AppSponsor;
		
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
				interstitial1 = new AppSponsor("xoxZUsVbBc8lE3PZLgy3ag", "support@appsponsor.com", true);
				interstitial1.setCountry("USA");
				setInterstitialListeners(interstitial1);
				
				interstitial2 = new AppSponsor("UgpNrBfcUc5Ss8DOZQzkBg", "support@appsponsor.com", true);
				interstitial2.setCountry("BOL");
				setInterstitialListeners(interstitial2);
				
				interstitial3 = new AppSponsor("UgpNrBfcUc5Ss8DOZQzkBg", "support@appsponsor.com", true);
				interstitial3.setCountry("COG");
				setInterstitialListeners(interstitial3);
				
				interstitial4 = new AppSponsor("UgpNrBfcUc5Ss8DOZQzkBg");
				interstitial4.setCountry("TCD");
				setInterstitialListeners(interstitial4);
				
				interstitial5 = new AppSponsor("UgpNrBfcUc5Ss8DOZQzkBg");
				interstitial5.setCountry("BOL");
				setInterstitialListeners(interstitial5);
				
				interstitial6 = new AppSponsor("UgpNrBfcUc5Ss8DOZQzkBg");
				interstitial6.setCountry("COG");
				setInterstitialListeners(interstitial6);
				
				interstitial7 = new AppSponsor("UgpNrBfcUc5Ss8DOZQzkBg");
				interstitial7.setCountry("TCD");
				setInterstitialListeners(interstitial7);
				
				interstitial8 = new AppSponsor("UgpNrBfcUc5Ss8DOZQzkBg");
				interstitial8.setCountry("BOL");
				setInterstitialListeners(interstitial8);
				
				interstitial9 = new AppSponsor("UgpNrBfcUc5Ss8DOZQzkBg");
				interstitial9.setCountry("COG");
				setInterstitialListeners(interstitial9);
			}
			else
			{
				
				interstitial1 = new AppSponsor("UgpNrBfcUc5Ss8DOZQzkBg", "support@appsponsor.com", true);
				interstitial1.setCountry("USA");
				setInterstitialListeners(interstitial1);
				
				interstitial2 = new AppSponsor("UgpNrBfcUc5Ss8DOZQzkBg", "support@appsponsor.com", true);
				interstitial2.setCountry("CUB");
				setInterstitialListeners(interstitial2);
				
				interstitial3 = new AppSponsor("UgpNrBfcUc5Ss8DOZQzkBg", "support@appsponsor.com", true);
				interstitial3.setCountry("ARG");
				setInterstitialListeners(interstitial3);
				
				interstitial4 = new AppSponsor("UgpNrBfcUc5Ss8DOZQzkBg");
				interstitial4.setCountry("ARG");
				setInterstitialListeners(interstitial4);
				
				interstitial5 = new AppSponsor("UgpNrBfcUc5Ss8DOZQzkBg");
				interstitial5.setCountry("KHM");
				setInterstitialListeners(interstitial5);
				
				interstitial6 = new AppSponsor("UgpNrBfcUc5Ss8DOZQzkBg");
				interstitial6.setCountry("CUB");
				setInterstitialListeners(interstitial6);
				
				interstitial7 = new AppSponsor("UgpNrBfcUc5Ss8DOZQzkBg");
				interstitial7.setCountry("DMA");
				setInterstitialListeners(interstitial7);
				
				interstitial8 = new AppSponsor("UgpNrBfcUc5Ss8DOZQzkBg");
				interstitial8.setCountry("DMA");
				setInterstitialListeners(interstitial8);
				
				interstitial9 = new AppSponsor("UgpNrBfcUc5Ss8DOZQzkBg");
				interstitial9.setCountry("CUB");
				setInterstitialListeners(interstitial9);
			}
		}
		
		private function init( event : Event ) : void
		{
			removeEventListener( Event.ENTER_FRAME, init );
		}
		
		private function createButtons() : void
		{
			var startX : Number = 40;
			var startX2: Number = 300;
			
			var bottomInd: Number = 60;
			var nextY : Number = -150;
			
			//ad 1
			var loadButton1 : TextField = createButton( "load Ad 1" );
			loadButton1.x = startX;
			loadButton1.y = nextY;
			loadButton1.addEventListener( MouseEvent.MOUSE_DOWN, loadInterstitial1 );
			addChild( loadButton1 );
			
			var showButton1 : TextField = createButton( "Show Ad 1" );
			showButton1.x = startX2;
			showButton1.y = nextY;
			showButton1.addEventListener( MouseEvent.MOUSE_DOWN, showInterstitial1 );
			addChild( showButton1 );
			
			nextY += bottomInd;
			
			//ad 2
			var loadButton2 : TextField = createButton( "load Ad 2" );
			loadButton2.x = startX;
			loadButton2.y = nextY;
			loadButton2.addEventListener( MouseEvent.MOUSE_DOWN, loadInterstitial2 );
			addChild( loadButton2 );
			
			var showButton2 : TextField = createButton( "Show Ad 2" );
			showButton2.x = startX2;
			showButton2.y = nextY;
			showButton2.addEventListener( MouseEvent.MOUSE_DOWN, showInterstitial2 );
			addChild( showButton2 );
			
			nextY += bottomInd;
			
			//ad 3
			var loadButton3 : TextField = createButton( "load Ad 3" );
			loadButton3.x = startX;
			loadButton3.y = nextY;
			loadButton3.addEventListener( MouseEvent.MOUSE_DOWN, loadInterstitial3 );
			addChild( loadButton3 );
			
			var showButton3 : TextField = createButton( "Show Ad 3" );
			showButton3.x = startX2;
			showButton3.y = nextY;
			showButton3.addEventListener( MouseEvent.MOUSE_DOWN, showInterstitial3 );
			addChild( showButton3 );
			
			nextY += bottomInd;
			
			//ad 4
			var loadButton4 : TextField = createButton( "load Ad 4" );
			loadButton4.x = startX;
			loadButton4.y = nextY;
			loadButton4.addEventListener( MouseEvent.MOUSE_DOWN, loadInterstitial4 );
			addChild( loadButton4 );
			
			var showButton4 : TextField = createButton( "Show Ad 4" );
			showButton4.x = startX2;
			showButton4.y = nextY;
			showButton4.addEventListener( MouseEvent.MOUSE_DOWN, showInterstitial4 );
			addChild( showButton4 );
			
			nextY += bottomInd;
			
			//ad 5
			var loadButton5 : TextField = createButton( "load Ad 5" );
			loadButton5.x = startX;
			loadButton5.y = nextY;
			loadButton5.addEventListener( MouseEvent.MOUSE_DOWN, loadInterstitial5 );
			addChild( loadButton5 );
			
			var showButton5 : TextField = createButton( "Show Ad 5" );
			showButton5.x = startX2;
			showButton5.y = nextY;
			showButton5.addEventListener( MouseEvent.MOUSE_DOWN, showInterstitial5 );
			addChild( showButton5 );
			
			nextY += bottomInd;
			
			//ad 6
			var loadButton6 : TextField = createButton( "load Ad 6" );
			loadButton6.x = startX;
			loadButton6.y = nextY;
			loadButton6.addEventListener( MouseEvent.MOUSE_DOWN, loadInterstitial6 );
			addChild( loadButton6 );
			
			var showButton6 : TextField = createButton( "Show Ad 6" );
			showButton6.x = startX2;
			showButton6.y = nextY;
			showButton6.addEventListener( MouseEvent.MOUSE_DOWN, showInterstitial6 );
			addChild( showButton6 );
			
			nextY += bottomInd;
			
			//ad 7
			var loadButton7 : TextField = createButton( "load Ad 7" );
			loadButton7.x = startX;
			loadButton7.y = nextY;
			loadButton7.addEventListener( MouseEvent.MOUSE_DOWN, loadInterstitial7 );
			addChild( loadButton7 );
			
			var showButton7 : TextField = createButton( "Show Ad 7" );
			showButton7.x = startX2;
			showButton7.y = nextY;
			showButton7.addEventListener( MouseEvent.MOUSE_DOWN, showInterstitial7 );
			addChild( showButton7 );
			
			nextY += bottomInd;
			
			//ad 8
			var loadButton8 : TextField = createButton( "load Ad 8" );
			loadButton8.x = startX;
			loadButton8.y = nextY;
			loadButton8.addEventListener( MouseEvent.MOUSE_DOWN, loadInterstitial8 );
			addChild( loadButton8 );
			
			var showButton8 : TextField = createButton( "Show Ad 8" );
			showButton8.x = startX2;
			showButton8.y = nextY;
			showButton8.addEventListener( MouseEvent.MOUSE_DOWN, showInterstitial8 );
			addChild( showButton8 );
			
			nextY += bottomInd;
			
			//ad 9
			var loadButton9 : TextField = createButton( "load Ad 9" );
			loadButton9.x = startX;
			loadButton9.y = nextY;
			loadButton9.addEventListener( MouseEvent.MOUSE_DOWN, loadInterstitial9 );
			addChild( loadButton9 );
			
			var showButton9 : TextField = createButton( "Show Ad 9" );
			showButton9.x = startX2;
			showButton9.y = nextY;
			showButton9.addEventListener( MouseEvent.MOUSE_DOWN, showInterstitial9 );
			addChild( showButton9 );
			
			nextY += bottomInd;
			
		}
		
		// actions
		
		private function loadInterstitial1( event : MouseEvent ) : void
		{
			try
			{
				interstitial1.load();
			} 
			catch(error:Error) 
			{
				feedback.text = "error = " + error;
			}
			
			//feedback.text = "loadInterstitial1d();";
		}
		
		private function showInterstitial1( event : MouseEvent ) : void
		{
			interstitial1.presentAd();	
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
		
		private function loadInterstitial3( event : MouseEvent ) : void
		{
			interstitial3.load();	
			feedback.text = "loadInterstitial3d();";
		}
		
		private function showInterstitial3( event : MouseEvent ) : void
		{
			interstitial3.presentAd();	
			feedback.text = "showInterstitial3d();";
		}
		
		private function loadInterstitial4( event : MouseEvent ) : void
		{
			interstitial4.load();
			feedback.text =  "loadInterstitial4d()";
		}
		
		private function showInterstitial4( event : MouseEvent ) : void
		{
			interstitial4.presentAd();		
			feedback.text =  "showInterstitial4d()";
		}
		
		private function loadInterstitial5( event : MouseEvent ) : void
		{
			interstitial5.load();	
			feedback.text = "loadInterstitial5d();";
		}
		
		private function showInterstitial5( event : MouseEvent ) : void
		{
			interstitial5.presentAd();	
			
			feedback.text = "showInterstitial5d();";
		}
		
		private function loadInterstitial6( event : MouseEvent ) : void
		{
			interstitial6.load();
			feedback.text = "loadInterstitial6d();";
		}
		
		private function showInterstitial6( event : MouseEvent ) : void
		{
			interstitial6.presentAd();	
			feedback.text = "showInterstitial6d();";
		}
		
		private function loadInterstitial7( event : MouseEvent ) : void
		{
			interstitial7.load();	
			feedback.text = "loadInterstitial7d();";
		}
		
		private function showInterstitial7( event : MouseEvent ) : void
		{
			interstitial7.presentAd();	
			feedback.text = "showInterstitial7d();";
		}
		
		private function loadInterstitial8( event : MouseEvent ) : void
		{
			interstitial8.load();		
			feedback.text = "loadInterstitial8d();";
		}
		
		private function showInterstitial8( event : MouseEvent ) : void
		{
			interstitial8.presentAd();	
			feedback.text = "showInterstitial8d();";
		}
		
		private function loadInterstitial9( event : MouseEvent ) : void
		{
			interstitial9.load();
			feedback.text = "loadInterstitial9d();";
		}
		
		private function showInterstitial9( event : MouseEvent ) : void
		{
			interstitial9.presentAd();
			feedback.text = "showInterstitial9d();";
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
			textField.width = 140;
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