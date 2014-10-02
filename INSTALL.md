i#ADOBE AIR INSTALL GUIDE

###Overview

This guide provides integration instructions for the Manage Publisher Adobe AIR SDK.  If you need support or have any questions, feel free to email us at [support@appsponsor.com](support@appsponsor.com)

###1. Download and install the SDK
The SDK for Adobe AIR is available once you sign up. The Manage Publisher SDK includes everything you need to serve full screen interstitial, video, and playable ad units.

Adobe AIR 14.0: https://appsponsor.com/downloads/AppSponsor.ane-3.0.5.6a.zip

Adobe AIR 4.0: https://appsponsor.com/downloads/AppSponsor.ane-3.0.5.6a-AIR4.0.zip

If you are using an existing **Google Play Services** ANE file:

Adobe AIR 14.0: https://appsponsor.com/downloads/AppSponsor.ane-3.0.5.6a-No_GPS.zip

Adobe AIR 4.0: https://appsponsor.com/downloads/AppSponsor.ane-3.0.5.6a-No_GPS-AIR4.0.zip

**Note:** There are some third party ANE files, which obfuscate Google Play Services. In such cases, we can provide custom SDK builds without Google Play Services.

####Requirements:

* Android version 2.3+
* iOS version 6.0+

###2. Adding the SDK to your project

Unzip the Manage Publisher ANE zip file into a directory. It contains a library file called **AppSponsor.ane**.

In Flash Builder, open your `project properties`.

`Insert Flash Builder Properties Screen Shot`


Click `"ActionScript Build Path"`, and then click `"Native Extensions"` tab.  On this tab, click `"Add ANE"` button.

`Insert Add ANE Screen Shot`


Select the **AppSponsor.ane** file.


3. Update your project settings

For android build, put this code in your app xml settings:

```
<activity android:name="com.appsponsor.appsponsorsdk.PopupAdActivity" android:configChanges="keyboardHidden|orientation|screenSize" android:launchMode="singleTop" android:theme="@android:style/Theme.Translucent"> </activity> 

<activity android:name="com.appsponsor.appsponsorsdk.video.VideoAdActivity" android:screenOrientation="landscape" android:launchMode="singleTop" android:theme="@android:style/Theme.NoTitleBar.Fullscreen" android:configChanges="keyboardHidden|orientation|screenSize"> </activity> 

<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.READ_PHONE_STATE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
// and add this within application tag
<meta-data android:name="com.google.android.gms.version" android:value="4323000" />

```
`Insert code implementation of the above here`

Put the following extension id on your app xml settings if it is not in it already:

```
<extensions> <extensionID>com.appsponsor.nativeExtensions.appsponsorsdk</extensionID> </extensions>
```

###4. Displaying an interstitial AD


Next copy the following code to the top of the ActionScript class where you plan to show AppSponsor ads:

Import the appsponsorSDK into any activity that uses it

```
import com.appsponsor.nativeExtensions.appsponsorsdk.AppSponsorEvent; 
import com.appsponsor.nativeExtensions.appsponsorsdk.AppSponsor;
```
It should look something like this:

`Insert import code implementation screen shot`

and create a variable for the AppSponsor interstitial ad:

```
private var interstitial : AppSponsor;
```
Next you will need to add some code to the method where you want to initialize a Manage Publisher ad.

```
// for interstitial ad
interstitial = new AppSponsor("Unique Zone ID for your Android or iOS application"); 
```
Loading an ad

```
var _interstitial:AppSponsor;

_interstitial = new AppSponsor("Unique Zone ID");
_interstitial.addEventListener( AppSponsorEvent.AD_CACHED, loadAndPresentAd );

_interstitial.load();


function loadAndPresentAd(e:AppSponsorEvent):void
{
  Debug.log(Object(this).constructor, "AppSponsorAd.showAd loadAndPresentAd");
  if (_interstitial.isReady())
  {
    Debug.log(Object(this).constructor, "AppSponsorAd.showAd isReady");
    _interstitial.presentAd();
  }
}
```

###4. Rewarded Ads

Please follow the [Install Guide - Server to Server](https://appsponsor.com/site/page/?view=install_server2server) to set up your zone to support Rewarded Ads First. In order to use Rewarded Ads, you must use the new constructor for this type of ad. There are additional delegates to help you use the rewarded functionality.

```
//Rewarded ad should use this constructor to init ad
interstitial = new AppSponsor("Rewarded ad Zone ID for your Android or iOS application", "Player ID in App", true); 
```
There is also new event triggers when a Rewarded Ad finishes playing.

```
AppSponsorEvent.AD_REWARD_END
```
Function **isReady** returns true if the rewarded ad is ready to play. 
And function **rewardedAdStatus** tells you what percentage of the ad has finished playing.

```
//Sample code on checking rewarded available and play 
if (interstitial.isReady()) {
  interstitial.presentAd();
}

//sample code to reward user after viewing it
private function eventReceived( event : AppSponsorEvent ) : void //a listener function triggers by AD_REWARD_END
{//feedback is TextField to display test message
  feedback.appendText( "reward ad status is: " + interstitial.rewardedAdStatus()); 
}
```

###5. Optional steps

Optionally, you can add event listeners during Ad display.

```
//an ad will show up interstitial.addEventListener( AppSponsorEvent.AD_WILLAPPEAR, eventReceived ); 
//an ad will disappear interstitial.addEventListener( AppSponsorEvent.AD_WILLDISAPPEAR, eventReceived ); 
//an ad is ready to display interstitial.addEventListener( AppSponsorEvent.AD_CACHED, eventReceived ); 
//an ad is failed to load interstitial.addEventListener( AppSponsorEvent.LOAD_FAILED, eventReceived ); 
//ad rewarded ad finishes interstitial.addEventListener( AppSponsorEvent.AD_REWARD_END, eventReceived );

//and remove event listeners:
interstitial.removeEventListener( AppSponsorEvent.AD_WILLAPPEAR, eventReceived ); 
interstitial.removeEventListener( AppSponsorEvent.AD_WILLDISAPPEAR, eventReceived ); 
interstitial.removeEventListener( AppSponsorEvent.AD_CACHED, eventReceived ); 
interstitial.removeEventListener( AppSponsorEvent.LOAD_FAILED, eventReceived ); 
interstitial.removeEventListener( AppSponsorEvent.AD_REWARD_END, eventReceived );
```

You can specify additional data about the user/device to be sent to the server for improved targeting.
We highly recommend passing this information for increasing eCPMs, since many programmatic brand and performance advertisers will oftentimes pay a premium for users with this type of specific, non-personally identifiable information.

```
public function setCountry( country : String ) : void // ex: "USA" (3-letter ISO format http://bit.ly/GpSRc) 
public function setRegion( region : String ) : void // ex: "California" 
public function setMetro( metro : String ) : void // ex: "San Francisco"
public function setCity( city : String ) : void // ex: "San Francisco"
public function setZip( zip : String ) : void // ex: "94104"
public function setGender( gender : String ) : void // ex: "F", "M", or "O" (F=Female, M=Male, O=Other)
public function setYob( yob : String ) : void // ex: 1970
public function setKeywords( keywords : String ) : void // ex: "jackpot, sports, finance"
public function setUCountry( u_country : String ) : void // ex: "CAN"
public function setUCity( u_city : String ) : void // ex: "Vancouver"
public function setUZip( u_zip : String ) : void // ex: "V6B 376"
public function setLongitude( long : String ) : void //
public function setLatitude( lat : String ) : void //
//a sample
interstitial = new AppSponsor("ZONE ID"); // Zone ID for Android
interstitial.setCountry("USA");
interstitial.setRegion("California");
interstitial.setMetro("San Francisco");
interstitial.setCity("San Francisco");
interstitial.setZip("94104");
interstitial.setGender("F");
interstitial.setYob("1970");
interstitial.setKeywords("jackpot, sports, finance");
interstitial.load();
//you can have your code wait a while and call isReady 
if (interstitial.isReady()) {
interstitial.presentAd();
}
```

###6. Your Stats Dashboard

Now that you are up and running, serving ads in your app and making money you will want to familiarize yourself with your Manage Publisher dashboard.

You can quickly view the performance of your apps, and break the performance down to see the performance of individual Zones.

The Manage Publisher Ops team will be happy to work with you for best practices and optimization. Feel free to give us a call!

