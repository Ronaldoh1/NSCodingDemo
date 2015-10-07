//
//  RWTAuthor.h
//  NSCodingDemo
//
//  Created by Brian Moakley on 5/18/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RWTAuthor : NSObject <NSCoding>

@property (strong, nonatomic) NSString * firstName;
@property (strong, nonatomic) NSString * lastName;
@property (assign, nonatomic) NSInteger authorId;

-(instancetype) initWithFirstName: (NSString *) firstName lastName: (NSString *) lastName authorId: (NSInteger) authorId;

@end
