/*
        NSShadow.m
        Application Kit
	Copyright (c) 2002-2011, Apple Inc.
        All rights reserved.
*/

/* NSShadow stores the properties of a drop shadow to be added to drawing.  */

#import <Foundation/NSObject.h>
#import <Foundation/NSGeometry.h>

@class NSColor;


extern class NSShadow extends NSObject, implements NSCopying, NSCoding> {
    /*All instance variables are private*/
    NSUInteger _shadowFlags;
    NSSize _shadowOffset;
    Float _shadowBlurRadius;
    NSColor *_shadowColor;
    Float _reservedFloat[3];
    void *_reserved;
}

- (id)init;     // designated initializer, returns a default shadow with zero offset, zero blur radius, and default color

- (NSSize)shadowOffset;  // offset in user space of the shadow from the original drawing, in default user space units, where positive values are up and to the right
- (void)setShadowOffset:(NSSize)offset;

- (Float)shadowBlurRadius;      // blur radius of the shadow in default user space units
- (void)setShadowBlurRadius:(Float)val;

- (NSColor *)shadowColor;   // color used for the shadow (default is black with an alpha value of 1/3)
- (void)setShadowColor:(NSColor *)color;

- (void)set;

}

