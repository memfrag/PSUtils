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
 * The PSColor class represents a Photoshop curves preset.
 *
 * NOTE: Currently, only the master and RGB components are supported.
 */
@interface PSCurvesPreset : NSObject

/**
 * Initializer of the PSCurvesPreset object.
 *
 * @param acoData The contents of a Photoshop ACV file.
 * @return Initialized instance of the PSCurvesPreset object.
 */
- (id)initWithData:(NSData *)acvData;

/**
 * The curve points of the master curve which applies to all the composite
 * channels (RGB) when in composite image mode.
 *
 * @return An array with at least 2 points, or nil if there is no such curve.
 */
- (NSArray *)rgbPoints;

/**
 * The curve points of the red curve.
 *
 * @return An array with at least 2 points, or nil if there is no such curve.
 */
- (NSArray *)redPoints;

/**
 * The curve points of the green curve.
 *
 * @return An array with at least 2 points, or nil if there is no such curve.
 */
- (NSArray *)greenPoints;

/**
 * The curve points of the blue curve.
 *
 * @return An array with at least 2 points, or nil if there is no such curve.
 */
- (NSArray *)bluePoints;

@end
