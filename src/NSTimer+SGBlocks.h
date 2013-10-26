//
//  NSTimer+SGBlocks.h
//  SGBlockTimer
//
//  Created by Alexander Gusev on 10/26/13.
//  Copyright (c) 2013 sanekgusev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (SGBlocks)

- (id)sg_initWithFireDate:(NSDate *)date
                 interval:(NSTimeInterval)ti
                    block:(void(^)(NSTimer *timer))block
                  repeats:(BOOL)rep;

+ (instancetype)sg_timerWithTimeInterval:(NSTimeInterval)timeInterval
                                   block:(void(^)(NSTimer *timer))block
                                 repeats:(BOOL)yesOrNo;

@end
