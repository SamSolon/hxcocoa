//
//  UIGraphics.h
package ios.ui;

import objc.graphics.CGContext;
import objc.graphics.CGGeometry;

@:framework("UIKit")
extern class UIGraphics {
	
@:nativeImpl @:c public static function UIGraphicsGetCurrentContext() :CGContextRef;
@:nativeImpl @:c public static function UIGraphicsPushContext(context:CGContextRef) :Void;
@:nativeImpl @:c public static function UIGraphicsPopContext() :Void;

@:nativeImpl @:c public static function UIRectFillUsingBlendMode(rect:CGRect, blendMode:CGBlendMode):Void;
@:nativeImpl @:c public static function UIRectFill(rect:CGRect):Void;

@:nativeImpl @:c public static function UIRectFrameUsingBlendMode(rect:CGRect, blendMode:CGBlendMode):Void;
@:nativeImpl @:c public static function UIRectFrame(rect:CGRect):Void;

@:nativeImpl @:c public static function UIRectClip(rect:CGRect):Void;

// UIImage context

#if display
@:c public static function UIGraphicsBeginImageContext(size:CGSize):Void;
@:c public static function UIGraphicsBeginImageContextWithOptions(size:CGSize, opaque:Bool, scale:Float):Void; // NS_AVAILABLE_IOS(4_0);
UIKIT_EXTERN UIImage* UIGraphicsGetImageFromCurrentImageContext(void);
@:c public static function UIGraphicsEndImageContext(void); 

// PDF context

UIKIT_EXTERN BOOL UIGraphicsBeginPDFContextToFile(String *path, CGRect bounds, NSDictionary *documentInfo) NS_AVAILABLE_IOS(3_2);
@:c public static function UIGraphicsBeginPDFContextToData(NSMutableData *data, CGRect bounds, NSDictionary *documentInfo) NS_AVAILABLE_IOS(3_2);
@:c public static function UIGraphicsEndPDFContext(void) NS_AVAILABLE_IOS(3_2);

@:c public static function UIGraphicsBeginPDFPage(void) NS_AVAILABLE_IOS(3_2);
@:c public static function UIGraphicsBeginPDFPageWithInfo(CGRect bounds, NSDictionary *pageInfo) NS_AVAILABLE_IOS(3_2);

UIKIT_EXTERN CGRect UIGraphicsGetPDFContextBounds(void) NS_AVAILABLE_IOS(3_2);

@:c public static function UIGraphicsSetPDFContextURLForRect(NSURL *url, CGRect rect) NS_AVAILABLE_IOS(3_2);
@:c public static function UIGraphicsAddPDFContextDestinationAtPoint(String *name, CGPoint point) NS_AVAILABLE_IOS(3_2);
@:c public static function UIGraphicsSetPDFContextDestinationForRect(String *name, CGRect rect) NS_AVAILABLE_IOS(3_2);
#end
}