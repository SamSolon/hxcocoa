package objc.foundation;

@:framework("Foundation")
extern class NSHTTPCookie
{

	//Constants
	static public var NSHTTPCookieName:String;
	static public var NSHTTPCookieValue:String;
	static public var NSHTTPCookieOriginURL:String;
	static public var NSHTTPCookieVersion:String;
	static public var NSHTTPCookieDomain:String;
	static public var NSHTTPCookiePath:String;
	static public var NSHTTPCookieSecure:String;
	static public var NSHTTPCookieExpires:String;
	static public var NSHTTPCookieComment:String;
	static public var NSHTTPCookieCommentURL:String;
	static public var NSHTTPCookieDiscard:String;
	static public var NSHTTPCookieMaximumAge:String;
	static public var NSHTTPCookiePort:String;

	//Static Methods
	public function cookieWithProperties( properties:NSDictionary):Dynamic;
	public function cookiesWithResponseHeaderFields( headerFields:NSDictionary,  URL:NSURL):Array<NSHTTPCookie>;
	public function requestHeaderFieldsWithCookies( cookies:Array<NSHTTPCookie>):NSDictionary;

	//Properties

	//Methods
	public function properties():NSDictionary;
	public function name():String;
	public function path():String;
	public function expiresDate():Date;
	public function isSessionOnly():Bool;
	public function isHTTPOnly():Bool;
	public function commentURL():NSURL;
	public function portList():Array<Null<Int>>;
	public function version():Int;
	public function isSecure():Bool;
	public function initWithProperties( properties:NSDictionary):Dynamic;
	public function domain():String;
	public function value():String;
	public function comment():String;
}

