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

#import "PSColorSwatch.h"

@implementation PSColor

- (id)initWithName:(NSString *)name red:(float)red green:(float)green blue:(float)blue
{
    self = [super init];
    if (self) {
        self.name = name;
        self.red = red;
        self.green = green;
        self.blue = blue;
    }
    return self;
}

@end

@implementation PSColorSwatch {
    NSUInteger _offset;
    NSMutableArray *_swatchColors;
}

- (id)initWithData:(NSData *)acoData {
    self = [super init];
    if (self) {
        @autoreleasepool {
            [self parseColorSwatchData:acoData];
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

- (NSString *)unicodeStringFromData:(NSData *)data {
    uint32_t length = 0;
    [data getBytes:&length range:NSMakeRange(_offset, sizeof(length))];
    _offset += sizeof(length);
    uint8_t buffer[length * 2];
    [data getBytes:buffer range:NSMakeRange(_offset, length * 2)];
    _offset += length * 2;
    NSString *str = [[NSString alloc] initWithBytes:buffer length:(length * 2) encoding:NSUTF16BigEndianStringEncoding];
    return str;
}

- (void)parseColorSwatchData:(NSData *)data {
    
    uint16_t version = [self nextValueFromData:data];
    if (version != 1) {
        return;
    }
    
    uint16_t colorCount = [self nextValueFromData:data];
    
    for (int c = 0; c < colorCount; c++) {
        uint16_t colorSpace = [self nextValueFromData:data];
        (void)colorSpace;
        uint16_t values[4];
        values[0] = [self nextValueFromData:data];
        values[1] = [self nextValueFromData:data];
        values[2] = [self nextValueFromData:data];
        values[3] = [self nextValueFromData:data];
    }
    
    version = [self nextValueFromData:data];
    if (version != 2) {
        return;
    }
    
    colorCount = [self nextValueFromData:data];
    
    _swatchColors = [NSMutableArray array];
    
    for (int c = 0; c < colorCount; c++) {
        uint16_t colorSpace = [self nextValueFromData:data];
        uint16_t values[4];
        values[0] = [self nextValueFromData:data];
        values[1] = [self nextValueFromData:data];
        values[2] = [self nextValueFromData:data];
        values[3] = [self nextValueFromData:data];
        NSString *colorName = [self unicodeStringFromData:data];
        
        // Only support RGB for now.
        if (colorSpace != 0) {
            float r = ((float)values[0]) / 65535.0f;
            float g = ((float)values[0]) / 65535.0f;
            float b = ((float)values[0]) / 65535.0f;
            PSColor *color = [[PSColor alloc] initWithName:colorName red:r green:g blue:b];
            [_swatchColors addObject:color];
        }
    }
}

- (NSArray *)colors
{
    return _swatchColors;
}

@end
