//
//  RWTBook.h
//  NSCodingDemo
//
//  Created by Brian Moakley on 5/18/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import <Foundation/Foundation.h>


@class RWTAuthor;

@interface RWTBook : NSObject <NSCoding>

@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSDate * publicationDate;
@property (assign, nonatomic) NSInteger numberOfPages;
@property (weak, nonatomic) RWTAuthor * author;

-(instancetype) initWithTitle: (NSString *) title publicationDate: (NSDate *) publicationDate numberOfPages: (NSInteger) numberOfPages;

@end
