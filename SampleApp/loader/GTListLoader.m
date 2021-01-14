//
//  GTListLoader.m
//  SampleApp
//
//  Created by shenwl on 2021/1/1.
//

#import "GTListLoader.h"
#import "GTListItem.h"

@implementation GTListLoader

- (void)loadListDataWithFinishBlock: (GTListLoaderFinishBlock)finishBlock {
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e";
    
    NSURL *listUrl = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    
    
    __weak typeof(self) weakSelf = self;
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:listUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;

        NSError *jsonError;
        
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
#warning 类型的检查
        NSArray *dataArray = [(NSDictionary *) [((NSDictionary *) jsonObj) objectForKey:@"result"] objectForKey:@"data"];
        
        NSMutableArray *listItemArray = @[].mutableCopy;
                
        for (NSDictionary *info in dataArray) {
            GTListItem *item = [[GTListItem alloc] init];
            [item configWithDictionary:info];
            [listItemArray addObject:item];
        }
        
        [strongSelf _archiveListData:listItemArray];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(finishBlock) {
                finishBlock(error == nil, listItemArray);
            }
        });
    }];
    [dataTask resume];
}

- (void)_archiveListData:(NSArray<GTListItem *> *)array {
    NSArray *pathArr = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    
    NSString *cachePath = [pathArr firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTData"];
    
    NSError *createError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];
    
    NSString *listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];

    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    
    NSData *readListData = [fileManager contentsAtPath:listDataPath];
    
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects: [NSArray class], [GTListItem class], nil] fromData:readListData error:nil];
    NSLog(@"");
}

@end
