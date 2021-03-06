package objc.foundation;
import objc.foundation.NSObject;

@:framework("Foundation")
extern class NSURLResponse extends NSObject /* implements NSObject implements NSCopying*/ {
	
//	public function initWithURL (URL:NSURL, MIMEType:String, expectedContentLength:Int, textEncodingName:String) :NSURLResponse;
	public function URL () :NSURL;
	public function MIMEType () :String;
	public function expectedContentLength () :Int;
	public function textEncodingName () :String;
	public function suggestedFilename () :String;
	
}

@:framework("Foundation")
extern class NSHTTPURLResponse extends NSURLResponse {
	
//	public function initWithURL (url:NSURL, statusCode:Int, HTTPVersion:String, headerFields:NSDictionary) :NSHTTPURLResponse;
	public function statusCode () :Int;
	public function allHeaderFields () :NSDictionary;
	public static function localizedStringForStatusCode (statusCode:Int) :String;
	
}
