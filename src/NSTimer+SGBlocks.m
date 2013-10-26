//
//  NSTimer+SGBlocks.m
//  SGBlockTimer
//
//  Created by Alexander Gusev on 10/26/13.
//  Copyright (c) 2013 sanekgusev. All rights reserved.
//

#import "NSTimer+SGBlocks.h"

@implementation NSTimer (SGBlocks)

- (id)sg_initWithFireDate:(NSDate *)date
                 interval:(NSTimeInterval)ti
                    block:(void(^)(NSTimer *timer))block
                  repeats:(BOOL)rep {
    __typeof (self) __weak wself = self;
    return [self initWithFireDate:date
                         interval:ti
                           target:[NSBlockOperation blockOperationWithBlock:^{
        if (block) {
            block(wself);
        }
    }]
                         selector:@selector(main)
                         userInfo:nil
                          repeats:rep];
}

+ (instancetype)sg_timerWithTimeInterval:(NSTimeInterval)timeInterval
                                   block:(void(^)(NSTimer *timer))block
                                 repeats:(BOOL)yesOrNo {
    __block NSTimer * __weak weakTimer;
    NSTimer *timer;
    weakTimer = timer = [self timerWithTimeInterval:timeInterval
                                             target:[NSBlockOperation blockOperationWithBlock:^{
        if (block) {
            block(weakTimer);
        }
    }]
                               selector:@selector(main)
                               userInfo:nil
                                repeats:yesOrNo];

    return timer;
}


@end
