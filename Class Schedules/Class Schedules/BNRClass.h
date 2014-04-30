//
//  BNRClass.h
//  Class Schedules
//
//  Created by Brooklyn Copeland on 4/29/14.
//  Copyright (c) 2014 Brooklyn Copeland. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRClass : NSObject


@property (nonatomic, strong) NSString *className;
@property (nonatomic, strong) NSString *classBlock;

+(NSMutableArray *)getClassStartAndEndTimeM:(NSString *) block;
+(NSMutableArray *)getClassStartAndEndTimeT:(NSString *) block;
+(NSMutableArray *)getClassStartAndEndTimeW:(NSString *) block;
+(NSMutableArray *)getClassStartAndEndTimeTH:(NSString *) block;
+(NSMutableArray *)getClassStartAndEndTimeF:(NSString *) block;


- (id)initWithName:(NSString *)className andBlock:(NSString *)block;
@end
