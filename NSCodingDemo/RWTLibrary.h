//
//  RWTLibrary.h
//  NSCodingDemo
//
//  Created by Brian Moakley on 5/18/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RWTBook, RWTAuthor;
@interface RWTLibrary : NSObject<NSCoding>

@property (readonly, nonatomic) NSMutableArray * books;
//@property (readonly, nonatomic) NSMutableArray * authors;

-(void) addBook: (RWTBook *) book;
//-(void) addAuthor: (RWTAuthor *) author;


@end
