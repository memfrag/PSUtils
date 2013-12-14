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
 * The PSColor class represents an RGB color from a Photoshop color swatch.
 */
@interface PSColor : NSObject

/** Name of the color in the color swatch. */
@property (nonatomic, copy) NSString *name;

/** Red color component. Range: 0.0f - 1.0f */
@property (nonatomic, assign) float red;

/** Green color component. Range: 0.0f - 1.0f */
@property (nonatomic, assign) float green;

/** Blue color component. Range: 0.0f - 1.0f */
@property (nonatomic, assign) float blue;

/**
 * Initializer of the PSColor RGB color object.
 *
 * @param name The name of the color in the color swatch.
 * @param red The red color component. Range: 0.0f - 1.0f
 * @param green The green color component. Range: 0.0f - 1.0f
 * @param blue The blue color component. Range: 0.0f - 1.0f
 * @return Initialized instance of the PSColor object.
 */
- (id)initWithName:(NSString *)name red:(float)red green:(float)green blue:(float)blue;

@end

/**
 * The PSColorSwatch class represents a Photoshop color swatch.
 *
 * The object is initialized with the data from an ACO file.
 */
@interface PSColorSwatch : NSObject

/**
 * Initializer of the PSColorSwatch object.
 *
 * @param acoData The contents of a Photoshop ACO file.
 * @return Initialized instance of the PSColorSwatch object.
 */
- (id)initWithData:(NSData *)acoData;

/** Array of PSColor objects from the color swatch. */
- (NSArray *)colors;

@end
