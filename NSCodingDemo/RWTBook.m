//
//  RWTBook.m
//  NSCodingDemo
//
//  Created by Brian Moakley on 5/18/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import "RWTBook.h"

@implementation RWTBook

-(instancetype) initWithTitle:(NSString *)title publicationDate:(NSDate *)publicationDate numberOfPages:(NSInteger)numberOfPages
{
    self = [super init];
    if (self)
    {
        _title = title;
        _publicationDate = publicationDate;
        _numberOfPages = numberOfPages;
    }
    return self;
}
//Need to implement two methods with NSCoding.

-(instancetype)initWithCoder:(NSCoder *)aDecoder{

    self = [super init];
    if (self) {

        _title = [aDecoder decodeObjectForKey:@"bookTitle"];
        _publicationDate = [aDecoder decodeObjectForKey:@"bookPublicationDate"];
        _author = [aDecoder decodeObjectForKey:@"bookAuthor"];
        _numberOfPages = [aDecoder decodeIntegerForKey:@"bookNumberOfPages"];

    }

    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{

    [aCoder encodeObject:self.title forKey:@"bookTitle"];
   [aCoder encodeObject:self.publicationDate forKey:@"bookPublicationDate"];
   [aCoder encodeObject:self.author forKey:@"bookAuthor"];
   [aCoder encodeInteger:self.numberOfPages forKey:@"bookNumberOfPages"];
}
-(NSString *) description
{
    return [NSString stringWithFormat:@"Book: %@ - %d pages: Published on %@", self.title, self.numberOfPages, self.publicationDate];
}

@end
