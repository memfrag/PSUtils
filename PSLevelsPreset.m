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

#import "PSLevelsPreset.h"

@implementation PSLevelsPreset {
    NSUInteger _offset;
}

- (id)initWithData:(NSData *)alvData {
    self = [super init];
    if (self) {
        @autoreleasepool {
            [self parseLevelsData:alvData];
        }
    }
    return self;
}

- (NSUInteger)nextValueFromData:(NSData *)data {
    uint16_t value = 0;
    [data getBytes:&value range:NSMakeRange(_offset, sizeof(value))];
    _offset += sizeof(value);
    return value;
}

- (void)parseLevelsData:(NSData *)data {
    
    uint16_t version = [self nextValueFromData:data];
    if (version != 2) {
        // This code only understands version 2.
        return;
    }
    
    _rgbMin = (float)[self nextValueFromData:data];
    _rgbMax = (float)[self nextValueFromData:data];
    _rgbMinOut = (float)[self nextValueFromData:data];
    _rgbMaxOut = (float)[self nextValueFromData:data];
    _rgbGamma = 0.1f * (float)[self nextValueFromData:data];

    _redMin = (float)[self nextValueFromData:data];
    _redMax = (float)[self nextValueFromData:data];
    _redMinOut = (float)[self nextValueFromData:data];
    _redMaxOut = (float)[self nextValueFromData:data];
    _redGamma =  0.1f * (float)[self nextValueFromData:data];

    _greenMin = (float)[self nextValueFromData:data];
    _greenMax = (float)[self nextValueFromData:data];
    _greenMinOut = (float)[self nextValueFromData:data];
    _greenMaxOut = (float)[self nextValueFromData:data];
    _greenGamma =  0.1f * (float)[self nextValueFromData:data];

    _blueMin = (float)[self nextValueFromData:data];
    _blueMax = (float)[self nextValueFromData:data];
    _blueMinOut = (float)[self nextValueFromData:data];
    _blueMaxOut = (float)[self nextValueFromData:data];
    _blueGamma =  0.1f * (float)[self nextValueFromData:data];
}

@end
