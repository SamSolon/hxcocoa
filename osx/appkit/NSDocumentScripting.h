/*
        NSDocumentScripting.h
        AppKit Framework
        Copyright (c) 1997-2011, Apple Inc.
        All rights reserved.
*/

#import <AppKit/NSDocument.h>

@class NSCloseCommand;
@class NSScriptCommand;
@class NSScriptObjectSpecifier;
@class NSString;

extern class NSDocument (NSScripting)

- (NSString *)lastComponentOfFileName;
- (void)setLastComponentOfFileName:(NSString *)str;

- (id)handleSaveScriptCommand:(NSScriptCommand *)command;
- (id)handleCloseScriptCommand:(NSCloseCommand *)command;
- (id)handlePrintScriptCommand:(NSScriptCommand *)command;

- (NSScriptObjectSpecifier *)objectSpecifier;

}
