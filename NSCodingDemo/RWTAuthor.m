//
//  RWTAuthor.m
//  NSCodingDemo
//
//  Created by Brian Moakley on 5/18/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import "RWTAuthor.h"

@implementation RWTAuthor

//Need to implement two methods with NSCoding.

-(instancetype)initWithCoder:(NSCoder *)aDecoder{

    self = [super init];
    if (self) {

        _firstName = [aDecoder decodeObjectForKey:@"authorFirstName"];
         _lastName = [aDecoder decodeObjectForKey:@"authorLastName"];
        _authorId = [aDecoder decodeIntegerForKey:@"authorId"];
    }

    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder{

    [aCoder encodeObject:self.firstName forKey:@"authorFirstName"];
    [aCoder encodeObject:self.lastName forKey:@"authorLastName"];
    [aCoder encodeInteger: self.authorId forKey:@"authorId"];
}


-(instancetype) initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName authorId:(NSInteger)authorId
{
    self = [super init];
    if (self)
    {
        _firstName = firstName;
        _lastName = lastName;
        _authorId = authorId;
    }
    return self;
}

-(NSString *) description
{
    return [NSString stringWithFormat:@"Author: %@ %@", self.firstName, self.lastName];
}

@end
