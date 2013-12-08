package objc.foundation;

@:framework("Foundation")
extern class NSHTTPCookieStorage
{

	//Constants
	static public var NSHTTPCookieManagerAcceptPolicyChangedNotification:String;
	static public var NSHTTPCookieManagerCookiesChangedNotification:String;

	//Static Methods
	static public function sharedHTTPCookieStorage():NSHTTPCookieStorage;

	//Properties

	//Methods
	public function cookies():Array<NSHTTPCookie>;
	public function setCookies( cookies:Array<NSHTTPCookie>,  URL:NSURL,  mainDocumentURL:NSURL):Void;
	public function setCookieAcceptPolicy( cookieAcceptPolicy:NSHTTPCookieAcceptPolicy):Void;
	public function deleteCookie( cookie:NSHTTPCookie):Void;
	public function cookieAcceptPolicy():NSHTTPCookieAcceptPolicy;
	public function sortedCookiesUsingDescriptors( sortOrder:Array<Dynamic>):Array<NSHTTPCookie>;
	public function setCookie( cookie:NSHTTPCookie):Void;
	public function cookiesForURL( URL:NSURL):Array<NSHTTPCookie>;
}

extern enum NSHTTPCookieAcceptPolicy
{
	NSHTTPCookieAcceptPolicyAlways;
	NSHTTPCookieAcceptPolicyNever;
	NSHTTPCookieAcceptPolicyOnlyFromMainDocumentDomain;
}

