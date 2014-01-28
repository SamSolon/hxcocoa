//
//  UICollectionViewController.h
package ios.ui;
//
//  Copyright (c) 2011 Apple Inc. All rights reserved.
//

import ios.ui.UIViewController;
import ios.ui.UICollectionView;
//import ios.ui.UIKitDefines.h;

//@class UICollectionViewLayout;
//@class UICollectionViewController;

@:framework("UIKit")
@:require(ios6) extern class UICollectionViewController extends UIViewController implements UICollectionViewDelegate /*implements UICollectionViewDataSource*/ {

	public function initWithCollectionViewLayout(layout:UICollectionViewLayout):Dynamic;

	public var collectionView:UICollectionView;
	public var clearsSelectionOnViewWillAppear:Bool; // defaults to YES, and if YES, any selection is cleared in viewWillAppear:

}
