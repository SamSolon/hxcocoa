/*
 *  CTStringAttributes.h
 *  CoreText
 *
 *  Copyright (c) 2004-2012 Apple Inc. All rights reserved.
 *
 */

#ifndef __CTSTRINGATTRIBUTES__
#define __CTSTRINGATTRIBUTES__

#include <CoreText/CTDefines.h>
#include <CoreFoundation/CFNumber.h>
#include <CoreFoundation/CFString.h>
#include <CoreGraphics/CGColor.h>

#if defined(__cplusplus)
extern "C" {
#endif

/* The purpose of this file is to define all the attributes to which
    CoreText will respond when placed in a CFAttributedString. These
    are left out of other header file on purpose in order to avoid
    layering problems. This file is allowed to include any other header
    file it wants to. */

/* --------------------------------------------------------------------------- */
/* CFAttributedStringRef Attribute Prototypes */
/* --------------------------------------------------------------------------- */

/*!
    @const      kCTFontAttributeName
    @abstract   The font.

    @discussion Value must be a CTFontRef. Default is Helvetica 12.
*/

extern const CFStringRef kCTFontAttributeName CT_AVAILABLE_STARTING( __MAC_10_5, __IPHONE_3_2);


/*!
    @const      kCTForegroundColorFromContextAttributeName
    @abstract   Never set a foreground color in the CGContext; use what is set as
                the context's fill color.

    @discussion Value must be a CFBooleanRef. Default is false. The reason
                why this exists is because an NSAttributedString defaults to a
                black color if no color attribute is set. This forces CoreText to
                set the color in the context. This will allow developers to
                sidestep this, making CoreText set nothing but font information
                in the CGContext. If set, this attribute also determines the
                color used by kCTUnderlineStyleAttributeName, in which case it
                overrides the foreground color.
*/

extern const CFStringRef kCTForegroundColorFromContextAttributeName CT_AVAILABLE_STARTING( __MAC_10_5, __IPHONE_3_2);


/*!
    @const      kCTKernAttributeName
    @abstract   A kerning adjustment.

    @discussion Value must be a CFNumberRef float. Default is standard kerning.
                The kerning attribute indicate how many points the following
                character should be shifted from its default offset as defined
                by the current character's font in points; a positive kern
                indicates a shift farther along and a negative kern indicates a
                shift closer to the current character. If this attribute is not
                present, standard kerning will be used. If this attribute is
                set to 0.0, no kerning will be done at all.
*/

extern const CFStringRef kCTKernAttributeName CT_AVAILABLE_STARTING( __MAC_10_5, __IPHONE_3_2);


/*!
    @const      kCTLigatureAttributeName
    @abstract   Controls ligature formation.

    @discussion Value must be a CFNumberRef. Default is int value 1. The ligature
                attribute determines what kinds of ligatures should be used when
                displaying the string. A value of 0 indicates that only ligatures
                essential for proper rendering of text should be used, 1
                indicates that standard ligatures should be used, and 2 indicates
                that all available ligatures should be used. Which ligatures are
                standard depends on the script and possibly the font. Arabic
                text, for example, requires ligatures for many character
                sequences, but has a rich set of additional ligatures that
                combine characters. English text has no essential ligatures, and
                typically has only two standard ligatures, those for "fi" and
                "fl" -- all others being considered more advanced or fancy.

                On iOS releases prior to 6.0 essential ligatures are applied
                if the font contains glyphs for any of U+FB00 through U+FB04 and
                the font lacks AAT or OpenType shaping tables, but as of 6.0
                shaping tables (or the lack thereof) are treated as definitive.
                This character-based shaping will still be performed if this
                attribute is explicitly specified with the default value of 1.
*/

extern const CFStringRef kCTLigatureAttributeName CT_AVAILABLE_STARTING( __MAC_10_5, __IPHONE_3_2);


/*!
    @const      kCTForegroundColorAttributeName
    @abstract   The foreground color.

    @discussion Value must be a CGColorRef. Default value is black.
*/

extern const CFStringRef kCTForegroundColorAttributeName CT_AVAILABLE_STARTING( __MAC_10_5, __IPHONE_3_2);


/*!
    @const      kCTParagraphStyleAttributeName
    @abstract   A CTParagraphStyle object which is used to specify things like
                line alignment, tab rulers, writing direction, etc.

    @discussion Value must be a CTParagraphStyleRef. Default is an empty
                CTParagraphStyle object. See CTParagraphStyle.h for more
                information.
*/

extern const CFStringRef kCTParagraphStyleAttributeName CT_AVAILABLE_STARTING( __MAC_10_5, __IPHONE_3_2);


/*!
    @const      kCTStrokeWidthAttributeName
    @abstract   The stroke width.

    @discussion Value must be a CFNumberRef. Default value is 0.0, or no stroke.
                This attribute, interpreted as a percentage of font point size,
                controls the text drawing mode: positive values effect drawing
                with stroke only; negative values are for stroke and fill. A
                typical value for outlined text is 3.0.
*/

extern const CFStringRef kCTStrokeWidthAttributeName CT_AVAILABLE_STARTING( __MAC_10_6, __IPHONE_3_2);


/*!
    @const      kCTStrokeColorAttributeName
    @abstract   The stroke color.

    @discussion Value must be a CGColorRef. Default is the foreground color.
*/

extern const CFStringRef kCTStrokeColorAttributeName CT_AVAILABLE_STARTING( __MAC_10_6, __IPHONE_3_2);


/*!
    @const      kCTUnderlineStyleAttributeName
    @abstract   Allows the setting of an underline to be applied at render
                time.

    @discussion Value must be a CFNumberRef. Default is kCTUnderlineStyleNone.
                Set a value of something other than kCTUnderlineStyleNone to draw
                an underline. In addition, the CTUnderlineStyleModifiers can be
                used to modify the look of the underline. The underline color
                will be determined by the text's foreground color.
*/

extern const CFStringRef kCTUnderlineStyleAttributeName CT_AVAILABLE_STARTING( __MAC_10_5, __IPHONE_3_2);


/*!
    @const      kCTSuperscriptAttributeName
    @abstract   Controls vertical text positioning.

    @discussion Value must be a CFNumberRef. Default is int value 0. If supported
                by the specified font, a value of 1 enables superscripting and a
                value of -1 enables subscripting.
*/

extern const CFStringRef kCTSuperscriptAttributeName CT_AVAILABLE_STARTING( __MAC_10_5, __IPHONE_3_2);


/*!
    @const      kCTUnderlineColorAttributeName
    @abstract   The underline color.

    @discussion Value must be a CGColorRef. Default is the foreground color.
*/

extern const CFStringRef kCTUnderlineColorAttributeName CT_AVAILABLE_STARTING( __MAC_10_5, __IPHONE_3_2);


/*!
    @const      kCTVerticalFormsAttributeName
    @abstract   Controls glyph orientation.

    @discussion Value must be a CFBooleanRef. Default is false. A value of false
                indicates that horizontal glyph forms are to be used, true
                indicates that vertical glyph forms are to be used.
*/

extern const CFStringRef kCTVerticalFormsAttributeName CT_AVAILABLE_STARTING( __MAC_10_5, __IPHONE_4_3);


/*!
    @const      kCTGlyphInfoAttributeName
    @abstract   Allows the use of unencoded glyphs.

    @discussion Value must be a CTGlyphInfoRef. The glyph specified by this
                CTGlyphInfo object is assigned to the entire attribute range,
                provided that its contents match the specified base string and
                that the specified glyph is available in the font specified by
                kCTFontAttributeName. See CTGlyphInfo.h for more information.
*/

extern const CFStringRef kCTGlyphInfoAttributeName CT_AVAILABLE_STARTING( __MAC_10_5, __IPHONE_3_2);


/*!
    @const      kCTCharacterShapeAttributeName
    @abstract   Controls glyph selection.

    @discussion Value must be a CFNumberRef. Default is value is 0 (disabled).
                A non-zero value is interpreted as an SFNT kCharacterShapeType
                selector + 1; see SFNTLayoutTypes.h for selectors. For example,
                an attribute value of 1 corresponds to kTraditionalCharactersSelector.
*/

extern const CFStringRef kCTCharacterShapeAttributeName CT_AVAILABLE_STARTING( __MAC_10_5, __IPHONE_3_2);


/*!
    @const      kCTRunDelegateAttributeName
    @abstract   Allows customization of certain aspects of a range of text's
                appearance.

    @discussion Value must be a CTRunDelegateRef. The values returned by the
                embedded object for an attribute range apply to each glyph
                resulting from the text in that range. Because an embedded object
                is only a display-time modification, care should be taken to
                avoid applying this attribute to a range of text with complex
                behavior, such as a change of writing direction, combining marks,
                etc. Consequently, it is recommended that this attribute be
                applied to a range containing the single character U+FFFC. See
                CTRunDelegate.h for more information.
*/

extern const CFStringRef kCTRunDelegateAttributeName CT_AVAILABLE_STARTING( __MAC_10_5, __IPHONE_3_2);


/*!
    @enum       CTUnderlineStyle
    @abstract   Underline style specifiers.

    @discussion These underline type specifiers can be applied to the value set
                with the kCTUnderlineStyleAttributeName attribute to tell
                CoreText that you want a different underline style.
*/

typedef CF_OPTIONS(int32_t, CTUnderlineStyle) {
    kCTUnderlineStyleNone           = 0x00,
    kCTUnderlineStyleSingle         = 0x01,
    kCTUnderlineStyleThick          = 0x02,
    kCTUnderlineStyleDouble         = 0x09
};


/*!
    @enum       CTUnderlineStyleModifiers
    @abstract   Underline style modifiers.

    @discussion Set these bits with the CTUnderlineStyle that you set with the
                kCTUnderlineStyleAttributeName attribute to modify how the
                underline will be drawn.
*/

typedef CF_OPTIONS(int32_t, CTUnderlineStyleModifiers) {
    kCTUnderlinePatternSolid        = 0x0000,
    kCTUnderlinePatternDot          = 0x0100,
    kCTUnderlinePatternDash         = 0x0200,
    kCTUnderlinePatternDashDot      = 0x0300,
    kCTUnderlinePatternDashDotDot   = 0x0400
};


/*!
    @const      kCTBaselineClassAttributeName
    @abstract   Key to reference a baseline class override.

    @discussion Value must be one of the kCTBaselineClass constants. Normally,
                glyphs on the line will be assigned baseline classes according to
                the 'bsln' or 'BASE' table in the font. This attribute may be
                used to change this assignment.

    @seealso    kCTBaselineClassRoman
    @seealso    kCTBaselineClassIdeographicCentered
    @seealso    kCTBaselineClassIdeographicLow
    @seealso    kCTBaselineClassIdeographicHigh
    @seealso    kCTBaselineClassHanging
    @seealso    kCTBaselineClassMath
*/

extern const CFStringRef kCTBaselineClassAttributeName CT_AVAILABLE_STARTING( __MAC_10_8, __IPHONE_6_0);


/*!
    @const      kCTBaselineInfoAttributeName
    @abstract   Key to reference a baseline info dictionary.

    @discussion Value must be a CFDictionaryRef. Normally, baseline offsets will
                be assigned based on the 'bsln' or 'BASE' table in the font. This
                attribute may be used to assign different offsets. Each key in
                the dictionary is one of the kCTBaselineClass constants and the
                value is a CFNumberRef of the baseline offset in points. You only
                need to specify the offsets you wish to change.

    @seealso    kCTBaselineClassRoman
    @seealso    kCTBaselineClassIdeographicCentered
    @seealso    kCTBaselineClassIdeographicLow
    @seealso    kCTBaselineClassIdeographicHigh
    @seealso    kCTBaselineClassHanging
    @seealso    kCTBaselineClassMath
*/

extern const CFStringRef kCTBaselineInfoAttributeName CT_AVAILABLE_STARTING( __MAC_10_8, __IPHONE_6_0);


/*!
    @const      kCTBaselineReferenceInfoAttributeName
    @abstract   Key to reference a baseline info dictionary for the reference baseline.

    @discussion Value must be a CFDictionaryRef. All glyphs in a run are assigned
                a baseline class and then aligned to the offset for that class in
                the reference baseline baseline info. See the discussion of
                kCTBaselineInfoAttributeName for information about the contents
                of the dictionary. You can also use the kCTBaselineReferenceFont
                key to specify that the baseline offsets of a particular
                CTFontRef should be used as the reference offsets.

    @seealso    kCTBaselineClassRoman
    @seealso    kCTBaselineClassIdeographicCentered
    @seealso    kCTBaselineClassIdeographicLow
    @seealso    kCTBaselineClassIdeographicHigh
    @seealso    kCTBaselineClassHanging
    @seealso    kCTBaselineClassMath
    @seealso    kCTBaselineReferenceFont
*/

extern const CFStringRef kCTBaselineReferenceInfoAttributeName CT_AVAILABLE_STARTING( __MAC_10_8, __IPHONE_6_0);


/*!
    @const      kCTWritingDirectionAttributeName
    @abstract   Specifies a bidirectional override or embedding.

    @discussion Value must be a CFArray of CFNumberRefs, each of which should
                have a value of either kCTWritingDirectionLeftToRight or
                kCTWritingDirectionRightToLeft, plus one of
                kCTWritingDirectionEmbedding or kCTWritingDirectionOverride.
                This array represents a sequence of nested bidirectional
                embeddings or overrides, in order from outermost to innermost,
                with (kCTWritingDirectionLeftToRight | kCTTextWritingDirectionEmbedding)
                corresponding to a LRE/PDF pair in plain text or
                <span dir="ltr"></span> in HTML, (kCTWritingDirectionRightToLeft
                | kCTTextWritingDirectionEmbedding) corresponding to a RLE/PDF
                pair in plain text or a <span dir="rtl"></span> in HTML,
                (kCTWritingDirectionLeftToRight | kCTTextWritingDirectionOverride)
                corresponding to a LRO/PDF pair in plain text or
                <bdo dir="ltr"></span> in HTML, and (kCTWritingDirectionRightToLeft
                | kCTTextWritingDirectionOverride) corresponding to a RLO/PDF
                pair in plain text or <bdo dir="rtl"></span> in HTML.

    @seealso    kCTWritingDirectionLeftToRight
    @seealso    kCTWritingDirectionRightToLeft
    @seealso    kCTWritingDirectionEmbedding
    @seealso    kCTWritingDirectionOverride
*/

extern const CFStringRef kCTWritingDirectionAttributeName CT_AVAILABLE_STARTING( __MAC_10_8, __IPHONE_6_0);


/*!
    @abstract   Additional values for use with kCTWritingDirectionAttributeName
                in combination with kCTWritingDirectionLeftToRight or
                kCTWritingDirectionRightToLeft.

    @seealso    kCTWritingDirectionAttributeName
    @seealso    kCTWritingDirectionLeftToRight
    @seealso    kCTWritingDirectionRightToLeft
*/

enum {
    kCTWritingDirectionEmbedding = (0 << 1),
    kCTWritingDirectionOverride = (1 << 1)
};


#if defined(__cplusplus)
}
#endif

#endif
