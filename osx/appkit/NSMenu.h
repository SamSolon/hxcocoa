/*
 NSMenu.h
 Application Kit
 Copyright (c) 1996-2011, Apple Inc.
 All rights reserved.
*/

#import <Foundation/NSObject.h>
#import <Foundation/NSGeometry.h>
#import <AppKit/AppKitDefines.h>
#import <AppKit/NSMenuItem.h>

@class NSEvent, NSView, NSFont;
@class NSMenu;
@class NSMutableArray, NSArray;
@protocol NSMenuDelegate;

extern class NSMenu extends NSObject, implements NSCopying, NSCoding>
{
    /*All instance variables are private*/
    @private
    NSMenu *_supermenu;
    NSString *_title;
    id _itemArray;
    id _extra;
    struct __mFlags {
        unsigned int noAutoenable:1;
        unsigned int inMain:1;
        unsigned int internalPerformAction:1;
        unsigned int condenseSeparators:1;
        unsigned int disabled:1;
        unsigned int ownedByPopUp:1;
	unsigned int delegateNeedsUpdate:1;
	unsigned int delegateUpdateItem:1;
	unsigned int delegateHasKeyEquiv:1;
	unsigned int delegateHasAltKeyEquiv:1;
	unsigned int excludeMarkColumn:1;
	unsigned int isContextualMenu:1;
        unsigned int cmPluginMode:2;
        unsigned int invertedCMPluginTypes:2;
        unsigned int allowsDifferentSelection:1;
        unsigned int noTopPadding:1;
        unsigned int noBottomPadding:1;
        unsigned int RESERVED:13;
    } _mFlags;
    NSString *_uiid;
}

/* Designated initializer.  If this menu is used as a submenu of an item in the application's main menu, then the title is what appears in the menu bar.  Otherwise, the title is ignored.  Do not pass nil (an exception will result), but you may pass an empty string.
 */
- (id)initWithTitle:(NSString *)aTitle;

/* Set and get the menu's title.  The titles of the submenus of the application's main menu items appear in the menu bar. */
- (void)setTitle:(NSString *)aString;
- (NSString *)title;

/* Pops up the receiver as a context menu.  The menu is positioned such that the top left corner lies at the given event's location, interpreted in the coordinate system of the given view.  If this would cause the menu to scroll offscreen, it will be moved up to be onscreen.  The event must not be nil.
 
 If a font is specified, then it will be applied to the menu.  In 10.6, the setFont: API below should be preferred.
*/
 
+ (void)popUpContextMenu:(NSMenu*)menu withEvent:(NSEvent*)event forView:(NSView*)view;
+ (void)popUpContextMenu:(NSMenu*)menu withEvent:(NSEvent*)event forView:(NSView*)view withFont:(NSFont*)font;

/* Pops up the receiver as a popup menu. The top left or right corner of the given item (which must be present in the receiver) is positioned at the given location in the given view, interpreted in the view's own coordinate system.  If item is nil, the menu is positioned such that the top left or right of the menu content frame is at the given location.  If view is nil, the location is interpreted in the screen coordinate system. This allows you to pop up a menu disconnected from any window.  The method returns YES if menu tracking ended because an item was selected, and NO if menu tracking was cancelled for any reason.
 
   This method determines whether to use the top left or right corner by calling userInterfaceLayoutDirection on the view or its cell (if implemented).  If not implemented, or if the view is nil, it inspects the userInterfaceLayoutDirection of the NSApplication.
*/
- (BOOL)popUpMenuPositioningItem:(NSMenuItem *)item atLocation:(NSPoint)location inView:(NSView *)view NS_AVAILABLE_MAC(10_6);

/* Determines whether the menu bar is visible for this application.  Users cannot access the menu bar unless it is visible.  It is visible by default. */
+ (void)setMenuBarVisible:(BOOL)visible;
+ (BOOL)menuBarVisible;

/* Returns the menu containing the item that has the receiver as a submenu, or nil if this menu is not the submenu of an item in a menu. */
- (NSMenu *)supermenu;
 
/* If a menu item has the receiver as a submenu, then this method will be called when the menu containing that item changes.  You should never call this, but you may override it to take some action when the supermenu changes. */
 - (void)setSupermenu:(NSMenu *)supermenu;

/* Inserts a menu item at the given index, which must be at least zero and no more than the receiver's item count.  If newItem is nil, this raises an exception. */
- (void)insertItem:(NSMenuItem *)newItem atIndex:(Int)index;

/* Appends an item to the end of the menu.  A nil item will raise an exception. */
- (void)addItem:(NSMenuItem *)newItem;

/* Inserts a new menu item with the given title, action, and key equivalent, at the given index.  The index must be at least zero and no more than the receiver's item count.  The title and key equivalent must not be nil (pass the empty string to indicate no key equivalent). This returns the new item.
 */
- (NSMenuItem *)insertItemWithTitle:(NSString *)aString action:(SEL)aSelector keyEquivalent:(NSString *)charCode atIndex:(Int)index;

/* Appends a new menu item with the given properties to the end of the menu. */
- (NSMenuItem *)addItemWithTitle:(NSString *)aString action:(SEL)aSelector keyEquivalent:(NSString *)charCode;

/* Removes the item at the given index, which must be at least zero and less than the number of items.  All subsequent items will shift down one index. */
- (void)removeItemAtIndex:(Int)index;

/* Removes the item from the menu.  If the item is nil, or is not present in the receiver, an exception will be raised. */
- (void)removeItem:(NSMenuItem *)item;

/* Same as [anItem setSubmenu:aMenu].  anItem may not be nil. */
- (void)setSubmenu:(NSMenu *)aMenu forItem:(NSMenuItem *)anItem;

/* Removes all items.  This is more efficient than removing items one by one.  This does not post NSMenuDidRemoveItemNotification, for efficiency.
*/
- (void)removeAllItems NS_AVAILABLE_MAC(10_6);

/* Returns an array containing the receiver's menu items. */
- (NSArray *)itemArray;

/* Returns the number of menu items in the menu. */
- (Int)numberOfItems;

/* Returns the item at the given index, which must be at least zero and less than the number of items. */
 - (NSMenuItem *)itemAtIndex:(Int)index;

/* Returns the index of the item in the menu, or -1 if the item is not present in the menu */
- (Int)indexOfItem:(NSMenuItem *)index;

/* Returns the first item in the menu that matches the given property, or -1 if no item in the menu matches. */
- (Int)indexOfItemWithTitle:(NSString *)aTitle;
- (Int)indexOfItemWithTag:(Int)aTag;
- (Int)indexOfItemWithRepresentedObject:(id)object;
- (Int)indexOfItemWithSubmenu:(NSMenu *)submenu;
- (Int)indexOfItemWithTarget:(id)target andAction:(SEL)actionSelector;

/* Returns the first item in the menu with the given property, or nil if no item in the menu matches. */
- (NSMenuItem *)itemWithTitle:(NSString *)aTitle;
- (NSMenuItem *)itemWithTag:(Int)tag;

/* Set and get whether the menu autoenables items.  If a menu autoenables items, then calls to -[NSMenuItem setEnabled:] are ignored, and the enabled state is computed via the NSMenuValidation informal protocol below.  Autoenabling is on by default. */
- (void)setAutoenablesItems:(BOOL)flag;
- (BOOL)autoenablesItems;
 
 /* If the receiver is set to autoenable items, then this triggers autovalidation of all menu items according to the NSMenuValidation informal protocol; otherwise this does nothing.  It is normally not necessary to call this; it will be called for you at the right time. */
- (void)update;
  
/* Attempts to perform the given key equivalent.  If the event is a key down event that matches the key equivalent of a menu item in the receiver or, recursively, any menu item in a submenu of the receiver, then this triggers that menu item's action and returns YES.  Otherwise, this returns NO.
*/
- (BOOL)performKeyEquivalent:(NSEvent *)theEvent;

/* This method is called when a menu item's enabled state, submenu, title, attributed title, image, key equivalent, key equivalent modifier mask, alternate status, indent, tooltip, view, or visibility (via isHidden) changes.  This method posts NSMenuDidChangeItemNotification.  Future properties will likely not call this method when they change, because posting a notification when a property changes is rather expensive.
 */
- (void)itemChanged:(NSMenuItem *)item;

/* Triggers the action for the item at the given index in the receiver.  This is useful as both an override point and something you may call directly.  As an override point, this is called when the user chooses the item during normal menu tracking; subclassers can override it to take some different action.  If you call it directly, it triggers the action for that item.  In SnowLeopard and later, calling it directly will also highlight the menu (if present in the main menu) and trigger accessibility notifications, including VoiceOver speaking the title.
*/
- (void)performActionForItemAtIndex:(Int)index;

/* Set and get the delegate for the menu.  See the NSMenuDelegate protocol for methods that the delegate may implement. */
- (void)setDelegate:(id <NSMenuDelegate>)anObject;
- (id <NSMenuDelegate>)delegate;

/* If called on the main menu, returns the height of the menu bar in pixels.  If called on any other menu, returns 0.
 */
- (Float)menuBarHeight;

/* Dismisses the menu and ends all menu tracking */
- (void)cancelTracking NS_AVAILABLE_MAC(10_5);

/* Dismisses the menu immediately, without any fade or other effect, and ends all menu tracking */
- (void)cancelTrackingWithoutAnimation NS_AVAILABLE_MAC(10_6);

/* Returns the highlighted item in the menu, or nil if no item in the menu is highlighted */
- (NSMenuItem *)highlightedItem NS_AVAILABLE_MAC(10_5);

/* Set the minimum width of the menu, in screen coordinates. The menu will prefer to not draw smaller than its minimum width, but may draw larger if it needs more space. The default value is 0.
*/
- (Float)minimumWidth NS_AVAILABLE_MAC(10_6);
- (void)setMinimumWidth:(Float)width NS_AVAILABLE_MAC(10_6);

/* Returns the size of the menu, in screen coordinates.  The menu may draw at a smaller size when shown, depending on its positioning and display configuration.
*/
- (NSSize)size NS_AVAILABLE_MAC(10_6);

/* Sets the font for the menu.  This also affects the font of all submenus that do not have their own font.
*/
- (NSFont *)font NS_AVAILABLE_MAC(10_6);
- (void)setFont:(NSFont *)font NS_AVAILABLE_MAC(10_6);

/* Determines whether contextual menu plugins may be appended to the menu, if used as a context menu. The default is YES.
*/
- (BOOL)allowsContextMenuPlugIns NS_AVAILABLE_MAC(10_6);
- (void)setAllowsContextMenuPlugIns:(BOOL)allows NS_AVAILABLE_MAC(10_6);

/* Determines whether the menu contains a column for the state image.  The default is YES. */
- (void)setShowsStateColumn:(BOOL)showsState NS_AVAILABLE_MAC(10_5);
- (BOOL)showsStateColumn NS_AVAILABLE_MAC(10_5);

/* Returns the zone used to allocate NSMenu objects.  This is left in for compatibility and always returns NSDefaultMallocZone().  It is not necessary to use this - menus can be allocated the usual way. */
+ (NSZone *)menuZone;

/* In SnowLeopard, the following methods no longer do anything useful. */
- (void)setMenuChangedMessagesEnabled:(BOOL)flag;
- (BOOL)menuChangedMessagesEnabled;
- (void)helpRequested:(NSEvent *)eventPtr;
- (BOOL)isTornOff;

}

extern class NSMenu (NSSubmenuAction)
- (void)submenuAction:(id)sender;
}

extern class NSObject (NSMenuValidation)
- (BOOL)validateMenuItem:(NSMenuItem *)menuItem;
}

@protocol NSMenuDelegate <NSObject>
@optional
- (void)menuNeedsUpdate:(NSMenu*)menu;

- (Int)numberOfItemsInMenu:(NSMenu*)menu;
- (BOOL)menu:(NSMenu*)menu updateItem:(NSMenuItem*)item atIndex:(Int)index shouldCancel:(BOOL)shouldCancel;
    // implement either the first one or the next two to populate the menu
- (BOOL)menuHasKeyEquivalent:(NSMenu*)menu forEvent:(NSEvent*)event target:(id*)target action:(SEL*)action;
    // bypasses populating the menu for checking for key equivalents. set target and action on return

/* indicates that the menu is being opened (displayed) or closed (hidden).  Do not modify the structure of the menu or the menu items from within these callbacks. */
- (void)menuWillOpen:(NSMenu *)menu NS_AVAILABLE_MAC(10_5);
- (void)menuDidClose:(NSMenu *)menu NS_AVAILABLE_MAC(10_5);

/* Indicates that menu is about to highlight item.  Only one item per menu can be highlighted at a time.  If item is nil, it means all items in the menu are about to be unhighlighted. */
- (void)menu:(NSMenu *)menu willHighlightItem:(NSMenuItem *)item NS_AVAILABLE_MAC(10_5);


/* Given a menu that is about to be opened on the given screen, return a rect, in screen coordinates, within which the menu will be positioned.  If you return NSZeroRect, or if the delegate does not implement this method, the menu will be confined to the bounds appropriate for the given screen.  The returned rect may not be honored in all cases, such as if it would force the menu to be too small.
*/
- (NSRect)confinementRectForMenu:(NSMenu *)menu onScreen:(NSScreen *)screen NS_AVAILABLE_MAC(10_6);

}

/* The NSMenuProperties type is a bitmask used for specifying a set of menu or menu item properties, used in the following method.
 */
enum {
    NSMenuPropertyItemTitle = 1 << 0,            // the menu item's title
    NSMenuPropertyItemAttributedTitle = 1 << 1,  // the menu item's attributed title
    NSMenuPropertyItemKeyEquivalent = 1 << 2,    // the menu item's key equivalent
    NSMenuPropertyItemImage = 1 << 3,            // the menu item's image
    NSMenuPropertyItemEnabled = 1 << 4,          // whether the menu item is enabled or disabled
    NSMenuPropertyItemAccessibilityDescription = 1 << 5 // the menu item's accessibility description
};
typedef NSUInteger NSMenuProperties;

/* The following method may be called from delegate callbacks to determine which properties need to be updated and which may be skipped.  It is intended to allow more efficient updating of the menu in certain circumstances.  For example, if the NSMenuPropertyItemImage bit is zero, your delegate does not need to update the images of the menu items, because the images are not needed (for example, during key equivalent matching).  Calling this is optional: it is always acceptable to fully update the menu.
 
 This may be called from the menu delegate method -menuNeedsUpdate:.  Calling this at other times will raise an exception.
 */
extern class NSMenu (NSMenuPropertiesToUpdate)
- (NSMenuProperties)propertiesToUpdate NS_AVAILABLE_MAC(10_6);
}

APPKIT_EXTERN NSString *NSMenuWillSendActionNotification;
APPKIT_EXTERN NSString *NSMenuDidSendActionNotification;

APPKIT_EXTERN NSString *NSMenuDidAddItemNotification;
APPKIT_EXTERN NSString *NSMenuDidRemoveItemNotification;
APPKIT_EXTERN NSString *NSMenuDidChangeItemNotification;
// All three of these have a user info key NSMenuItemIndex with a NSNumber value.

APPKIT_EXTERN NSString *NSMenuDidBeginTrackingNotification;
APPKIT_EXTERN NSString *NSMenuDidEndTrackingNotification;

// The remainder of this file contains deprecated methods
extern class NSMenu (NSDeprecated)

- (void)setMenuRepresentation:(id)menuRep NS_DEPRECATED_MAC(10_0, 10_2);
- (id)menuRepresentation NS_DEPRECATED_MAC(10_0, 10_2);

- (void)setContextMenuRepresentation:(id)menuRep NS_DEPRECATED_MAC(10_0, 10_2);
- (id)contextMenuRepresentation NS_DEPRECATED_MAC(10_0, 10_2);

- (void)setTearOffMenuRepresentation:(id)menuRep NS_DEPRECATED_MAC(10_0, 10_2);
- (id)tearOffMenuRepresentation NS_DEPRECATED_MAC(10_0, 10_2);

+ (void)setMenuZone:(NSZone *)aZone NS_DEPRECATED_MAC(10_0, 10_2);

- (NSMenu *)attachedMenu NS_DEPRECATED_MAC(10_0, 10_2);
- (BOOL)isAttached NS_DEPRECATED_MAC(10_0, 10_2);
- (void)sizeToFit NS_DEPRECATED_MAC(10_0, 10_2);
- (NSPoint)locationForSubmenu:(NSMenu *)aSubmenu NS_DEPRECATED_MAC(10_0, 10_2);

}
