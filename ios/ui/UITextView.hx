//
//  UITextView.h
package ios.ui;

import objc.foundation.NSObject;
import objc.foundation.NSRange;
import objc.graphics.CGGeometry;

//@:framework("UIKit")
//extern interface UITextViewDelegate <NSObject, UIScrollViewDelegate>

#if display
@optional

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;
- (BOOL)textViewShouldEndEditing:(UITextView *)textView;

	public function textViewDidBeginEditing:(UITextView *)textView;
	public function textViewDidEndEditing:(UITextView *)textView;

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(String *)text;
	public function textViewDidChange:(UITextView *)textView;

	public function textViewDidChangeSelection:(UITextView *)textView;

}
#end

@:framework("UIKit")
extern class UITextView extends UIScrollView {

	//public var delegate :UITextViewDelegate;
	public var text :String;
	public var font :UIFont;
	public var textColor :UIColor;
	//public var textAlignment :NSTextAlignment;    // default is NSLeftTextAlignment
	public var selectedRange :NSRange;
	public var editable :Bool;
	//public var dataDetectorTypes :UIDataDetectorTypes;

	public var  allowsEditingTextAttributes:Bool;// NS_AVAILABLE_IOS(6_0); // defaults to NO
	public var  attributedText:NSAttributedString; // NS_AVAILABLE_IOS(6_0); // default is nil
	//public var  typingAttributes:NSDictionary; // NS_AVAILABLE_IOS(6_0); // automatically resets when the selection changes

#if display
- (BOOL)hasText;
#end
	public function scrollRangeToVisible(range:NSRange):Void;


// Presented when object becomes first responder.  If set to nil, reverts to following responder chain.  If
// set while first responder, will not take effect until reloadInputViews is called.
	//public var  (readwrite, retain) UIView *inputView;             
	//public var  (readwrite, retain) UIView *inputAccessoryView;

	//public var  BOOL clearsOnInsertion; // NS_AVAILABLE_IOS(6_0); // defaults to NO. if YES, the selection UI is hidden, and inserting text will replace the contents of the field. changing the selection will automatically set this to NO.

}
#if display
UIKIT_EXTERN String * const UITextViewTextDidBeginEditingNotification;
UIKIT_EXTERN String * const UITextViewTextDidChangeNotification;
UIKIT_EXTERN String * const UITextViewTextDidEndEditingNotification;
#end
