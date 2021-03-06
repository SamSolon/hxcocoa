//
//  UICollectionViewCell.h
package ios.ui;
import ios.ui.UICollectionViewLayout;

@:framework("UIKit")
@:require(ios6)
extern class UICollectionReusableView extends UIView {

	public var reuseIdentifier (default, null) :String;

// Override point.
// Called by the collection view before the instance is returned from the reuse queue.
// Subclassers must call super.
	public function prepareForReuse () :Void;

// Classes that want to support custom layout attributes specific to a given UICollectionViewLayout subclass can apply them here.
// This allows the view to work in conjunction with a layout class that returns a custom subclass of UICollectionViewLayoutAttributes from -layoutAttributesForItem: or the corresponding layoutAttributesForHeader/Footer methods.
// -applyLayoutAttributes: is then called after the view is added to the collection view and just before the view is sent to the delegate in the appropriate collectionView:configureXXX method.
	public function applyLayoutAttributes (layoutAttributes:UICollectionViewLayoutAttributes) :Void;

// Override these methods to provide custom UI for specific layouts.
	public function willTransitionFromLayout (oldLayout:UICollectionViewLayout, toLayout:UICollectionViewLayout) :Void;
	public function didTransitionFromLayout (oldLayout:UICollectionViewLayout, toLayout:UICollectionViewLayout) :Void;

}

@:framework("UIKit")
@:require(ios6)
extern class UICollectionViewCell extends UICollectionReusableView {

	public var contentView :UIView; // add custom subviews to the cell's contentView

// Cells become highlighted when the user touches them.
// The selected state is toggled when the user lifts up from a highlighted cell.
// Override these methods to provide custom UI for a selected or highlighted state.
// The collection view may call the setters inside an animation block.
	public var selected :Bool;
	public var highlighted :Bool;

// The background view is a subview behind all other views.
// If selectedBackgroundView is different than backgroundView, it will be placed above the background view and animated in on selection.
	public var backgroundView :UIView;
	public var selectedBackgroundView :UIView;

}
