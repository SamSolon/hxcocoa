package ios.ui;

import objc.foundation.NSArray;
import objc.foundation.NSCoder;
import objc.foundation.NSData;
import objc.foundation.NSError;
import objc.foundation.NSDictionary;
import objc.foundation.NSURL;

import objc.graphics.CGGeometry;

import ios.ui.UIApplication;

@:framework("UIKit")
extern interface UIApplicationDelegate {

	public var window :UIWindow;
	
	@:sel("application:didFinishLaunchingWithOptions:")
	public function application (application:UIApplication, didFinishLaunchingWithOptions:NSDictionary) :Bool;

	public function applicationDidBecomeActive (application:UIApplication) :Void;
	public function applicationWillResignActive (application:UIApplication) :Void;

	@:sel("application:handleOpenURL:")
	public function applicationHandleOpenURL (application:UIApplication, handleOpenURL:NSURL) :Bool;
	@:sel("application:openURL:sourceApplication:annotation:")
	public function applicationOpenURL (application:UIApplication, openURL:NSURL, sourceApplication:String, annotation:Dynamic) :Bool;

	public function applicationDidReceiveMemoryWarning (application:UIApplication) :Void;
	public function applicationWillTerminate (application:UIApplication) :Void;
	public function applicationSignificantTimeChange (application:UIApplication) :Void;

	@sel("application:willChangeStatusBarOrientation:duration:")
	public function applicationWillChangeStatusBarOrientation (application:UIApplication, willChangeStatusBarOrientation:UIInterfaceOrientation, duration:Int) :Void;
	@sel("application:didChangeStatusBarOrientation:")
	public function applicationDidChangeStatusBarOrientation (application:UIApplication, didChangeStatusBarOrientation:UIInterfaceOrientation) :Void;

	@sel("application:willChangeStatusBarFrame:")
	public function applicationWillChangeStatusBarFrame (application:UIApplication, willChangeStatusBarFrame:CGRect) :Void;
	@sel("application:didChangeStatusBarFrame:")
	public function applicationDidChangeStatusBarFrame (application:UIApplication, didChangeStatusBarFrame:CGRect) :Void;

	@sel("application:didRegisterForRemoteNotificationsWithDeviceToken:")
	public function applicationDidRegisterForRemoteNotificationsWithDeviceToken (application:UIApplication, didRegisterForRemoteNotificationsWithDeviceToken:NSData) :Void;
	@sel("application:didFailToRegisterForRemoteNotificationsWithError:")
	public function applicationDidFailToRegisterForRemoteNotificationsWithError (application:UIApplication, didFailToRegisterForRemoteNotificationsWithError:NSError) :Void;

	@sel("application:didReceiveRemoteNotification:")
	public function applicationDidReceiveRemoteNotification (application:UIApplication, didReceiveRemoteNotification :NSDictionary) :Void;
	@sel("application:didReceiveLocalNotification:")
	public function applicationDidReceiveLocalNotification (application:UIApplication, didReceiveLocalNotification :UILocalNotification) :Void;

	public function applicationDidEnterBackground (application:UIApplication) :Void;
	public function applicationWillEnterForeground (application:UIApplication) :Void;

	public function applicationProtectedDataWillBecomeUnavailable (application:UIApplication) :Void;
	public function applicationProtectedDataDidBecomeAvailable (application:UIApplication) :Void;

//	public function applicationSupportedInterfaceOrientationsForWindow (application:UIApplication, supportedInterfaceOrientationsForWindow:UIWindow) :Int;

	@sel("application:viewControllerWithRestorationIdentifierPath:coder:")
	public function applicationViewControllerWithRestorationIdentifierPath (application:UIApplication, viewControllerWithRestorationIdentifierPath:NSArray, coder:NSCoder) :UIViewController;
	
	@sel("application:shouldSaveApplicationState:")
	public function applicationShouldSaveApplicationState (application:UIApplication, shouldSaveApplicationState:NSCoder) :Bool;
	
	@sel("application:shouldRestoreApplicationState:")
	public function applicationShouldRestoreApplicationState (application:UIApplication, shouldRestoreApplicationState:NSCoder) :Bool;
	
	@sel("application:willEncodeRestorableStateWithCoder:")
	public function applicationWillEncodeRestorableStateWithCoder (application:UIApplication, willEncodeRestorableStateWithCoder:NSCoder) :Void;
	
	@sel("application:didEncodeRestorableStateWithCoder:")
	public function applicationDidDecodeRestorableStateWithCoder (application:UIApplication, didDecodeRestorableStateWithCoder:NSCoder) :Void;
}
