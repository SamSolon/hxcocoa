package ios.ui;

import ios.ui.UITextInputTraits;

import objc.foundation.NSObject;
import objc.foundation.NSRange;
import objc.graphics.CGGeometry;

@:framework("UIKit")
@:fakeEnum(Int)
extern enum UITextBorderStyle {
    UITextBorderStyleNone;
    UITextBorderStyleLine;
    UITextBorderStyleBezel;
    UITextBorderStyleRoundedRect;
}

@:framework("UIKit")
@:fakeEnum(Int)
extern enum UITextFieldViewMode {
    UITextFieldViewModeNever;
    UITextFieldViewModeWhileEditing;
    UITextFieldViewModeUnlessEditing;
    UITextFieldViewModeAlways;
}

@:framework("UIKit")
extern class UITextField extends UIControl implements UITextInput implements NSCoding {


	public var text :String;                 // default is nil
	public var attributedText :NSAttributedString;// NS_AVAILABLE_IOS(6_0); // default is nil
	public var textColor :UIColor;            // default is nil. use opaque black
	public var font :UIFont;                 // default is nil. use system font 12 pt
//!!!!	public var textAlignment :NSTextAlignment;// default is NSLeftTextAlignment
	public var borderStyle :UITextBorderStyle;// default is UITextBorderStyleNone. If set to UITextBorderStyleRoundedRect, custom background images are ignored.
	public var placeholder :String;          // default is nil. string is drawn 70% gray
	public var attributedPlaceholder :NSAttributedString;// NS_AVAILABLE_IOS(6_0); // default is nil
	public var clearsOnBeginEditing :Bool; // default is NO which moves cursor to location clicked. if YES, all text cleared
	public var adjustsFontSizeToFitWidth :Bool; // default is NO. if YES, text will shrink to minFontSize along baseline
	public var minimumFontSize :Float;      // default is 0.0. actual min may be pinned to something readable. used if adjustsFontSizeToFitWidth is YES
	public var delegate :UITextFieldDelegate;             // default is nil. weak reference
	public var background :UIImage;           // default is nil. draw in border rect. image should be stretchable
	public var disabledBackground :UIImage;   // default is nil. ignored if background not set. image should be stretchable

	public var editing (default, null) :Bool;
	public var allowsEditingTextAttributes :Bool;// NS_AVAILABLE_IOS(6_0); // default is NO. allows editing text attributes with style operations and pasting rich text
//!!!!public var typingAttributes :NSDictionary;// NS_AVAILABLE_IOS(6_0); // automatically resets when the selection changes


	public var clearButtonMode :UITextFieldViewMode; // sets when the clear button shows up. default is UITextFieldViewModeNever

	public var leftView :UIView;        // e.g. magnifying glass
	public var leftViewMode :UITextFieldViewMode;    // sets when the left view shows up. default is UITextFieldViewModeNever

	public var rightView :UIView;       // e.g. bookmarks button
	public var rightViewMode :UITextFieldViewMode;   // sets when the right view shows up. default is UITextFieldViewModeNever

// drawing and positioning overrides

	public function borderRectForBounds (bounds:CGRect) :CGRect;
	public function textRectForBounds (bounds:CGRect) :CGRect;
	public function placeholderRectForBounds (bounds:CGRect) :CGRect;
	public function editingRectForBounds (bounds:CGRect) :CGRect;
	public function clearButtonRectForBounds (bounds:CGRect) :CGRect;
	public function leftViewRectForBounds (bounds:CGRect) :CGRect;
	public function rightViewRectForBounds (bounds:CGRect) :CGRect;

	public function drawTextInRect (rect:CGRect) :Void;
	public function drawPlaceholderInRect (rect:CGRect) :Void;

// Presented when object becomes first responder.  If set to nil, reverts to following responder chain.  If
// set while first responder, will not take effect until reloadInputViews is called.
//!!!!	public var inputView :UIView;             
//!!!!	public var inputAccessoryView :UIView;

	public var clearsOnInsertion :Bool;// NS_AVAILABLE_IOS(6_0); // defaults to NO. if YES, the selection UI is hidden, and inserting text will replace the contents of the field. changing the selection will automatically set this to NO.

	// Definitions for protocols -- since Haxe doesn't have that concept
	
	// UIKeyInput
	public var hasText:Bool;
	public function insertText(text:String):Void;
	public function deleteBackward():Void;
	
	// UITextInputTraits
	public var  autocapitalizationType:UITextAutocapitalizationType;
}


@:framework("UIKit")
extern interface UITextFieldDelegate {

	//@optional
    public function textFieldDidBeginEditing(textField:UITextField):Void;           // became first responder
    public function textFieldShouldEndEditing(textField:UITextField):Bool;          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    public function textFieldDidEndEditing(textField:UITextField):Void;             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

    public function textField(textField:UITextField, shouldChangeCharactersInRange:NSRange, replacementString:String):Bool;

    public function textFieldShouldClear(textField:UITextField):Bool;               // called when clear button pressed. return NO to ignore (no notifications)
    public function textFieldShouldReturn(textField:UITextField):Bool;              // called when 'return' key pressed. return NO to ignore.
#if display
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;        // return NO to disallow editing.
	public function textFieldDidBeginEditing:(UITextField *)textField;           // became first responder
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
	public function textFieldDidEndEditing:(UITextField *)textField;             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(String *)string;

- (BOOL)textFieldShouldClear:(UITextField *)textField;               // called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldReturn:(UITextField *)textField;              // called when 'return' key pressed. return NO to ignore.
#end
}

//UIKIT_EXTERN String *const UITextFieldTextDidBeginEditingNotification;
//UIKIT_EXTERN String *const UITextFieldTextDidEndEditingNotification;
//UIKIT_EXTERN String *const UITextFieldTextDidChangeNotification;

