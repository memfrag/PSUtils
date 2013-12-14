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

#if !__has_feature(objc_arc)
#error ARC must be enabled!
#endif

#import "PSCurvesPreset.h"

@implementation PSCurvesPreset {
    NSUInteger _offset;
    NSMutableArray *_rgbPoints;
    NSMutableArray *_redPoints;
    NSMutableArray *_bluePoints;
    NSMutableArray *_greenPoints;
}

- (id)initWithData:(NSData *)acvData {
    self = [super init];
    if (self) {
        @autoreleasepool {
            [self parseCurvesData:acvData];
        }
    }
    return self;
}

- (NSArray *)rgbPoints {
    return _rgbPoints;
}

- (NSArray *)redPoints {
    return _redPoints;
}

- (NSArray *)greenPoints {
    return _greenPoints;
}

- (NSArray *)bluePoints {
    return _bluePoints;
}

- (NSUInteger)nextValueFromData:(NSData *)data {
    uint16_t value = 0;
    [data getBytes:&value range:NSMakeRange(_offset, sizeof(value))];
    _offset += sizeof(value);
    return value;
}

- (void)parseCurvesData:(NSData *)data {
    
    uint16_t version = [self nextValueFromData:data];
    if (version != 4) {
        // This code only understands version 4.
        return;
    }
    
    uint16_t curveCount = [self nextValueFromData:data];
    if (curveCount != 5) {
        // There should be exactly 5 curves for RGB.
        return;
    }

    NSArray *curves = @[[NSMutableArray array],
                        [NSMutableArray array],
                        [NSMutableArray array],
                        [NSMutableArray array]];
    
    for (int c = 0; c < 4; c++) {
        NSMutableArray *curve = curves[c];
        
        uint16_t pointCount = [self nextValueFromData:data];
        if (pointCount < 2 || pointCount > 19) {
            // There should be at least 2 points, but at most 19 points.
            return;
        }
        
        for (int p = 0; p < pointCount; p++) {
            uint16_t input = [self nextValueFromData:data];
            uint16_t output = [self nextValueFromData:data];
            
            // Transform the values into [0, 1] floats.
            CGFloat x = (CGFloat)input / 255.0f;
            CGFloat y = (CGFloat)output / 255.0f;
            
#if TARGET_OS_IPHONE
            NSValue *point = [NSValue valueWithCGPoint:CGPointMake(x, y)];
#else
            NSValue *point = [NSValue valueWithPoint:CGPointMake(x, y)];
#endif
            [curve addObject:point];
        }
    }

    _rgbPoints = curves[0];
    _redPoints = curves[1];
    _greenPoints = curves[2];
    _bluePoints = curves[3];
}

@end
