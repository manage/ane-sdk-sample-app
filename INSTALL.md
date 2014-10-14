# ADOBE AIR INSTALL GUIDE

### Overview

This guide provides integration instructions for the Manage Publisher Adobe Air SDK.  If you need support or have any questions, feel free to email us at [support@appsponsor.com](support@appsponsor.com)

Requirements and Dependencies:

* Android:
    * Android version 2.3 or greater
    * Google Play Services Library (in order to use the Google Advertising ID)
    http://developer.android.com/google/play-services/setup.html
* iOS:
    * iOS 6+
* If you are using a Rewarded ad, you will need to set up your [Server to Server](https://appsponsor.com/site/page/?view=install_server2server) callback.

### 1. Download and Install the SDK

The SDK for Adobe AIR is available once you [sign up](https://appsponsor.com/user/registration). The Manage Publisher SDK includes everything you need to serve full screen interstitial, video, and playable ad units.

The SDK for Unity can be downloaded here: [ManageSDK-ANE-v3.1.zip](/downloads/ManageSDK-ANE-v3.1.zip).

##### Google Play Services

If you are using an existing ANE file with Google Play Services, you can download a version of the SDK without the Google Play Services JAR here: [ManageSDK-ANE-NO_GPS-v3.1.zip](/downloads/ManageSDK-ANE-NO_GPS-v3.1.zip).

To see an example implementation, please see our [sample app](https://github.com/manage/ane-sdk-sample-app).

*Note:* There are some third party ANE files, which obfuscate Google Play Services. In such cases, we can provide custom SDK builds without Google Play Services.

### 2. Adding the SDK to your project

1. Unzip the Manage Publisher ANE zip file into a directory. It contains the ManageSDK ANE file

2. In Flash Builder, open your project `Properties`

 ![](https://s3.amazonaws.com/cdn.manage.com/appsponsor/documentation/ane/step-1.png)

3. Select `ActionScript Build Path`, and then click `Native Extensions` tab.  On this tab, click `Add ANE` button

 ![](https://s3.amazonaws.com/cdn.manage.com/appsponsor/documentation/ane/step-2.png)

4. Select the ManageSDK ANE file

5. Next, select `ActionScript Build Packaging`, and then depending on iOS and/or Android, click `Native Extensions` and check the ManageSDK ANE package

 **Android:**

  ![](https://s3.amazonaws.com/cdn.manage.com/appsponsor/documentation/ane/step-3.png)

 **iOS:**

  ![](https://s3.amazonaws.com/cdn.manage.com/appsponsor/documentation/ane/step-4.png)

6. Click Apply

### 3. Update your *-app.xml

For Android, put this code in your Android Manifest

```
<android>
        <manifestAdditions><![CDATA[
			<manifest android:installLocation="auto">
			    <uses-sdk android:minSdkVersion="9" android:targetSdkVersion="17" />
				<uses-permission android:name="android.permission.INTERNET" />
				<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
				<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
				<uses-permission android:name="android.permission.READ_PHONE_STATE" />
				<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
				
				// Add this within application tag
				<application>
					<activity android:name="com.appsponsor.appsponsorsdk.activity.PopupAdActivity" android:launchMode="singleTop" android:theme="@android:style/Theme.Translucent" />
					<activity android:name="com.appsponsor.appsponsorsdk.activity.VideoAdActivity" android:screenOrientation="landscape" android:launchMode="singleTop" android:theme="@android:style/Theme.NoTitleBar.Fullscreen" />
					
					// Add Google Play Services
					<meta-data android:name="com.google.android.gms.version" android:value="4323000" />
				</application>	
			</manifest>
			
		]]></manifestAdditions>
    </android>
```

Verify that the Manage SDK entry is added :

```
<extensions>
    <extensionID>com.appsponsor.nativeExtensions.appsponsorsdk</extensionID>
</extensions>
```

### 4. Integrating Manage SDK

1. Import the appsponsorsdk into your desired Activity: 

```
import com.appsponsor.nativeExtensions.appsponsorsdk.AppSponsor;
import com.appsponsor.nativeExtensions.appsponsorsdk.AppSponsorEvent;
```

2. Create a variable for the AppSponsor interstitial ad:

```
private var popupAd : AppSponsor;

/* Rewarded ad */
private var rewardedAd : AppSponsor;
```

3. Next you will need to add some code to the method where you want to initialize a Manage Publisher ad.

```
popupAd = new AppSponsor("YOUR ZONE ID");

/* Rewarded ad */
rewardedAd = new AppSponsor("YOUR ZONE ID", "PUBLISHER USER ID", true);

```

#### 4.1 Improve Ad Targeting by setting non PII user data:

```
popupAd.setCity("");
popupAd.setUCity("");
popupAd.setCountry("");
popupAd.setUCountry("")
popupAd.setRegion("")
popupAd.setMetro("")
popupAd.setZip("")
popupAd.setUZip("")
popupAd.setLongitude("")
popupAd.setLatitude("")
popupAd.setGender("");
popupAd.setYob("")
popupAd.setKeywords("");

```
#### 4.2 Pre-Cached Ads 
   
Pre-cache ad:

```
popupAd.load();

/* Rewarded ad */
rewardedAd.load();
```

To show ad:

```
if (popupAd.isReady()) {
    popupAd.presentAd();   
}

/* Rewarded ad */
if (rewardedAd.isReady()) {
    rewardedAd.presentAd();   
}
```

####4.3 Load and Present Ad Synchronously

To show ad:
```
popupAd.loadAndPresentAd();

/* Rewarded ad */
rewardedAd.loadAndPresentAd();
```

### 5. Optional Steps

#### 5.1 Register Events Listeners

Add event listeners along with callback:

```
popupAd.addEventListener( AppSponsorEvent.AD_CACHED, eventReceived );
popupAd.addEventListener( AppSponsorEvent.AD_WILLAPPEAR, eventReceived ); 
popupAd.addEventListener( AppSponsorEvent.AD_WILLDISAPPEAR, eventReceived ); 
popupAd.addEventListener( AppSponsorEvent.LOAD_FAILED, eventReceived ); 
popupAd.addEventListener( AppSponsorEvent.AD_REWARD_END, eventReceived );

private function eventReceived(e:AppSponsorEvent):void {
  Debug.log(event);
}
```

Example:

```
rewardedAd = new AppSponsor("YOUR ZONE ID", "PUBLISHER USER ID", true);

rewardedAd.addEventListener( AppSponsorEvent.AD_CACHED, presentAd );
rewardedAd.addEventListener( AppSponsorEvent.AD_REWARD_END, showRewardSuccess );

rewardedAd.load();

function presentAd(e:AppSponsorEvent):void{
  if (rewardedAd.isReady()){
    rewardedAd.presentAd();
  }
}

function showRewardSuccess(e:AppSponsorEvent):void{
    // Show success message to user
}

```

#### 5.2 Unregister Events Listeners

```
interstitial.removeEventListener( AppSponsorEvent.AD_WILLAPPEAR, eventReceived ); 
interstitial.removeEventListener( AppSponsorEvent.AD_WILLDISAPPEAR, eventReceived ); 
interstitial.removeEventListener( AppSponsorEvent.AD_CACHED, eventReceived ); 
interstitial.removeEventListener( AppSponsorEvent.LOAD_FAILED, eventReceived ); 
interstitial.removeEventListener( AppSponsorEvent.AD_REWARD_END, eventReceived );

```