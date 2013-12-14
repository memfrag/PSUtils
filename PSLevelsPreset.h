//
//  Copyright (c) 2013 Martin Johannesson
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//
//  (MIT License)
//

#import <Foundation/Foundation.h>

/**
 * The PSLevelsPreset class represents a Photoshop levels preset.
 *
 * The object is initialized with the data from an ALV file.
 *
 * The master component applies to all of the composite channels (RGB)
 * when in composite image mode.
 *
 * NOTE: Currently, only the master and RGB components are supported. 
 */
@interface PSLevelsPreset : NSObject

#pragma mark Master Component

/** Master component input floor. (0.0f - 253.0f) */
@property (nonatomic, readonly) CGFloat rgbMin;

/** Master component input ceiling. (2.0f - 255.0f) */
@property (nonatomic, readonly) CGFloat rgbMax;

/** Master component output floor. (0.0f - 255.0f). Matched to input floor. */
@property (nonatomic, readonly) CGFloat rgbMinOut;

/** Master component output ceiling. (0.0f - 255.0f) */
@property (nonatomic, readonly) CGFloat rgbMaxOut;

/** Master component gamma. (0.1f - 9.99f). Applied to all image data. */
@property (nonatomic, readonly) CGFloat rgbGamma;

#pragma mark Red Component

/** Red component input floor. (0.0f - 253.0f) */
@property (nonatomic, readonly) CGFloat redMin;

/** Red component input ceiling. (2.0f - 255.0f) */
@property (nonatomic, readonly) CGFloat redMax;

/** Red component output floor. (0.0f - 255.0f). Matched to input floor. */
@property (nonatomic, readonly) CGFloat redMinOut;

/** Red component output ceiling. (0.0f - 255.0f) */
@property (nonatomic, readonly) CGFloat redMaxOut;

/** Red component gamma. (0.1f - 9.99f). Applied to all image data. */
@property (nonatomic, readonly) CGFloat redGamma;

#pragma mark Green Component

/** Green component input floor. (0.0f - 253.0f) */
@property (nonatomic, readonly) CGFloat greenMin;

/** Green component input ceiling. (2.0f - 255.0f) */
@property (nonatomic, readonly) CGFloat greenMax;

/** Green component output floor. (0.0f - 255.0f). Matched to input floor. */
@property (nonatomic, readonly) CGFloat greenMinOut;

/** Green component output ceiling. (0.0f - 255.0f) */
@property (nonatomic, readonly) CGFloat greenMaxOut;

/** Green component gamma. (0.1f - 9.99f). Applied to all image data. */
@property (nonatomic, readonly) CGFloat greenGamma;

#pragma mark Blue Component

/** Blue component input floor. (0.0f - 253.0f) */
@property (nonatomic, readonly) CGFloat blueMin;

/** Blue component input ceiling. (2.0f - 255.0f) */
@property (nonatomic, readonly) CGFloat blueMax;

/** Blue component output floor. (0.0f - 255.0f). Matched to input floor. */
@property (nonatomic, readonly) CGFloat blueMinOut;

/** Blue component output ceiling. (0.0f - 255.0f) */
@property (nonatomic, readonly) CGFloat blueMaxOut;

/** Blue component gamma. (0.1f - 9.99f). Applied to all image data. */
@property (nonatomic, readonly) CGFloat blueGamma;

#pragma mark - Methods

/**
 * Initializer of the PSLevelsPreset object.
 *
 * @param alvData The contents of a Photoshop ALV file.
 * @return Initialized instance of the PSLevelsPreset object.
 */
- (id)initWithData:(NSData *)alvData;

@end
