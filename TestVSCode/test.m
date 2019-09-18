#include <Foundation/Foundation.h>
#include "getData.m"

int main(int argc, char *argv[])
{
    @autoreleasepool{


        NSDictionary *bible = [GetData getDataAsDictionary];
        // "%tu" assigns the NSInteger as unsigned, which can be used to log
        NSMutableArray *books = [GetData getBooks:bible];
        NSLog(@"%@",books);

        // NSDictionary *allChapters = [indiBook valueForKey:@"chapters"];
        // NSString *indiChapter = [allChapters valueForKey:@"3"];
        // // NSLog(@"%@",indiChapter);
        // NSInteger verse = [indiChapter integerValue];
        // NSLog(@"%tu",verse);

    }
    return 0;
}