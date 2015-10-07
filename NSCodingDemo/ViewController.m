//
//  ViewController.m
//  NSCodingDemo
//
//  Created by Brian Moakley on 5/18/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

#import "ViewController.h"
#import "RWTAuthor.h"
#import "RWTBook.h"
#import "RWTLibrary.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray * authors;
@property (strong, nonatomic) NSMutableArray * books;
@property (strong, nonatomic) RWTLibrary * library;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadFromPlist];

    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *documentDirectory = [fileManager URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
    NSURL *saveFile = [documentDirectory URLByAppendingPathComponent:@"library.bin"];

    NSData *libraryData = [NSData dataWithContentsOfURL:saveFile options:NSDataReadingMappedIfSafe error:nil];
    self.library = [NSKeyedUnarchiver unarchiveObjectWithData:libraryData];

    for (RWTBook *book in self.library.books){
        NSLog(@"book: %@", book);
        NSLog(@"author: %@", book.author);
        NSLog(@"-----------");
    }

//    NSData *libaryData =[NSKeyedArchiver archivedDataWithRootObject:self.library];
//
//    //write out to disk
//
//    BOOL success = [libaryData writeToURL:saveFile options:NSDataWritingAtomic error:nil];
//
//    NSLog(@"wrote to disk!!! %d", success);
}

-(void) loadFromPlist
{
 
    NSString * path = [[NSBundle mainBundle] pathForResource:@"LibraryData" ofType:@"plist"];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSData * plistData = [fileManager contentsAtPath:path];
    
    NSDictionary * plist = [NSPropertyListSerialization propertyListFromData:plistData mutabilityOption:NSPropertyListImmutable format:nil errorDescription:nil];
    
    NSArray * authors = plist[@"Authors"];
    if (self.library == nil)
    {
        self.library = [[RWTLibrary alloc] init];
    }
    
    for (NSDictionary * author in authors)
    {
        if (self.authors == nil)
        {
            self.authors = [[NSMutableArray alloc] initWithCapacity:authors.count];
        }
        RWTAuthor * newAuthor = [[RWTAuthor alloc] initWithFirstName:author[@"First Name"] lastName:author[@"Last Name"] authorId:[(NSNumber *)author[@"Author ID"] integerValue]];
        [self.authors addObject:newAuthor];
    }
    
    NSArray * books = plist[@"Books"];
    for (NSDictionary * book in books)
    {
        RWTBook * newBook = [[RWTBook alloc] initWithTitle:book[@"Title"] publicationDate:book[@"Publication Date"] numberOfPages:[(NSNumber *)book[@"Page Count"] integerValue]];
        newBook.author = self.authors[[(NSNumber *) book[@"Author ID"] integerValue]];
        [self.library addBook:newBook];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
