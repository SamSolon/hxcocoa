package objc.graphics;


//typedef CGColorRef = CGColor;
@:framework("CoreGraphics")
extern class CGColorRef {
}

@:framework("CoreGraphics")
extern class CGColor {

/* Create a color in the color space `space' with color components
   (including alpha) specified by `components'. `space' may be any color
   space except a pattern color space. */

//	@nativeImpl @:c public static function CGColorCreate(space:CGColorSpaceRef, components:Array<Float>):CGColorRef;
	// CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Create a color in the "Generic" gray color space. */

	@nativeImpl @:c public static function CGColorCreateGenericGray(gray:Float, alpha:Float):CGColorRef;
	//  CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/* Create a color in the "Generic" RGB color space. */

	@nativeImpl @:c public static function CGColorCreateGenericRGB(red:Float, green:Float, blue:Float, alpha:Float):CGColorRef;
	// CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/* Create a color in the "Generic" CMYK color space. */

	@nativeImpl @:c public static function CGColorCreateGenericCMYK(cyan:Float, magenta:Float, yellow:Float, black:Float, alpha:Float):CGColorRef;
 	//CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/* Return a constant color. As `CGColorGetConstantColor' is not a "Copy" or
   "Create" function, it does not necessarily return a new reference each
   time it's called. As a consequence, you should not release the returned
   value. However, colors returned from `CGColorGetConstantColor' can be
   retained and released in a properly nested fashion, just like any other
   CF type. */

	@nativeIpl @:c public static function CGColorGetConstantColor(colorName:String/*CFStringRef*/):CGColorRef;
  //CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

/* Create a color in color space `space' with pattern `pattern' and
   components `components'. `space' must be a pattern color space. */

//	@nativeImpl @:c public static function CGColorCreateWithPattern(space:CGColorSpaceRef,pattern:CGPatternRef, components:Array<Float>):CGColorRef;
  //CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Create a copy of `color'. */

	@nativeImpl @:c public static function CGColorCreateCopy(color:CGColorRef):CGColorRef;
  //CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Create a copy of `color' with alpha set to `alpha'. */

	@nativeImpl @:c public static function CGColorCreateCopyWithAlpha(color:CGColorRef, alpha:Float):CGColorRef;
  //CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Equivalent to `CFRetain(color)', except it doesn't crash (as CFRetain
   does) if `color' is NULL. */

	@nativeImpl @:c public static function CGColorRetain(color:CGColorRef):CGColorRef;
  //CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Equivalent to `CFRelease(color)', except it doesn't crash (as CFRelease
   does) if `color' is NULL. */

	@:nativeImpl @:c public static function CGColorRelease(color:CGColorRef):Void;
  //CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return true if `color1' is equal to `color2'; false otherwise. */

	@:nativeImpl @:c public static function CGColorEqualToColor(color1:CGColorRef, color2:CGColorRef):Bool;
  //CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return the number of color components (including alpha) associated with
   `color'. */

	@nativeImpl @:c public static function CGColorGetNumberOfComponents(color:CGColorRef):Int;
  //CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return the color components (including alpha) associated with `color'. */

//	@nativeImpl @:c public static function const Float *CGColorGetComponents(CGColorRef color)
//  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return the alpha component associated with `color'. */

	@nativeImpl @:c public static function CGColorGetAlpha(color:CGColorRef):Float;
  //CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return the color space associated with `color'. */

//	@nativeImpl @:c public static function CGColorGetColorSpace(color:CGColorRef):CGColorSpaceRef;
  //CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return the pattern associated with `color', if it's a color in a pattern
   color space; NULL otherwise. */

//	@nativeImpl @:c public static function CGColorGetPattern(color:CGColorRef):CGPatternRef;
  //CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/* Return the CFTypeID for CGColors. */

//	@:c public static function CFTypeID CGColorGetTypeID(void)
//  CG_AVAILABLE_STARTING(__MAC_10_3, __IPHONE_2_0);

/*** Names of colors for use with `CGColorGetConstantColor'. ***/

/* Colors in the "Generic" gray color space. */

//	@:c public static function const CFStringRef kCGColorWhite
  //CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

	//@:c public static function const CFStringRef kCGColorBlack
  //CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);

	//@:c public static function const CFStringRef kCGColorClear
  //CG_AVAILABLE_STARTING(__MAC_10_5, __IPHONE_NA);
}
