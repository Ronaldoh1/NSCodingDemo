//
//  RWTLibrary.m
//  NSCodingDemo
//
//  Created by Brian Moakley on 5/18/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import "RWTLibrary.h"

@interface RWTLibrary()

@property (strong, nonatomic) NSMutableArray * books;
//@property (strong, nonatomic) NSMutableArray * authors;

@end

@implementation RWTLibrary

//Need to implement two methods with NSCoding.

-(instancetype)initWithCoder:(NSCoder *)aDecoder{

    self = [super init];
    if (self) {

        _books = [aDecoder decodeObjectForKey:@"library"];

    }

    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{

    [aCoder encodeObject:self.books forKey:@"libaryBooks"];

}
-(void) addBook:(RWTBook *)book
{
    if (self.books == nil)
    {
        self.books = [[NSMutableArray alloc] init];
    }
    [self.books addObject:book];
}

//-(void) addAuthor:(RWTAuthor *)author
//{
//    if (self.authors == nil)
//    {
//        self.authors = [[NSMutableArray alloc] init];
//    }
//    [self.authors addObject:author];
//}


@end
