// Deserializing json objects
// https://stackoverflow.com/questions/36893062/deserialize-json-using-objective-c-into-a-custom-object
#import <Foundation/Foundation.h>

@interface GetData: NSObject

+(NSDictionary *) getDataAsDictionary;
+(NSArray *) getBooks: (NSDictionary *) bible;

@end

@implementation GetData{}

+(NSDictionary *) getDataAsDictionary
{
    NSString *urlString = [NSString stringWithFormat: @"https://www.dropbox.com/s/y24kzlvu1lh5f12/BibleJson.json?dl=1"];
    NSURL *url = [[NSURL alloc] initWithString:urlString];

    NSData *jsonData = [NSData dataWithContentsOfURL: url];

    NSString *stringData = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    // Coverts the json object as a dictionary object
    // The dictionary has multiple objects 
    NSDictionary *bible = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];

    return bible;
}

+(NSMutableArray *) getBooks: (NSDictionary *) bible;
{
    NSMutableArray *allBooks = [NSMutableArray array];

    // for (id key in bible)
    //     {
    //         NSDictionary *thisBook = [bible valueForKey:key];
    //         [allBooks addObject:[thisBook valueForKey:@"name"]];
    //     }

    for (int i = 1; i<=66 ;i++)
        {
            NSString *key = [NSString stringWithFormat:@"%d",i];
            NSDictionary *thisBook = [bible valueForKey:key];
            [allBooks addObject:[thisBook valueForKey:@"name"]];
        }


    return allBooks;
}

@end