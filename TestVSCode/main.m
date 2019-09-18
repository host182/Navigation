#include <Foundation/Foundation.h>
#include "getData.m"

int main(int argc, char *argv[])
{
    @autoreleasepool{

        //////////////////////////////////
        NSDictionary *bible = [GetData getDataAsDictionary];
        //////////////////////////////////


        ///////////////////////////////////
        // The data from this array will be used in the first page
        NSMutableArray *booksArray = [GetData getBooks:bible];
        // NSLog(@"%@",booksArray);
        ///////////////////////////////////


        ///////////////////////////////////
        int bookIndex = 0;          // Index of the tapped book

        NSString *bookKey = [[NSString alloc] initWithFormat:@"%d",bookIndex+1];        //adding 1 as the book number starts from 1
        NSDictionary *choosenBook = [bible valueForKey:bookKey];

        // Getting the arguments for getChapters
        NSString *bookName = [choosenBook valueForKey:@"name"];
        NSDictionary *bookChapters = [choosenBook valueForKey:@"chapters"];

        // The data from this array will be used in the second page
        NSMutableArray *chaptersArray = [GetData getChapters:bookChapters :bookName];
        // NSLog(@"%@",chaptersArray);
        ///////////////////////////////////


        ///////////////////////////////////
        int chapterIndex = 0;       // Index of the tapped chapter

        NSString *chapterKey = [[NSString alloc] initWithFormat:@"%d",chapterIndex+1];  //same point as above

        // Arguments for getVerses
        NSString *prefix = [NSString stringWithFormat:@"%@",chaptersArray[chapterIndex]];
        NSString *choosenChapter = [bookChapters valueForKey:chapterKey];

        NSMutableArray *verseArray = [GetData getVerses:choosenChapter :prefix];
        // NSLog(@"%@",verseArray);
        ///////////////////////////////////

    }
    return 0;
}