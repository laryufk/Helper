
#import "OthersViewController.h"
#import "OthersCell.h"

@interface OthersViewController ()

@end

@implementation OthersViewController
@synthesize collectionOthers;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//このコードはダイレクトリーotherを作成しています

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    allImagesArray = [[NSMutableArray alloc] init];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *location=@"Others";
    NSString *fPath = [documentsDirectory stringByAppendingPathComponent:location];
    NSArray *directoryContent = [[NSFileManager defaultManager] directoryContentsAtPath: fPath];
    collectionOthers.delegate =self;
    collectionOthers.dataSource=self;
    for(NSString *str in directoryContent){
        NSLog(@"i");
        NSString *finalFilePath = [fPath stringByAppendingPathComponent:str];
        NSData *data = [NSData dataWithContentsOfFile:finalFilePath];
        if(data)
        {
            UIImage *image = [UIImage imageWithData:data];
            [allImagesArray addObject:image];
            NSLog(@"array:%@",[allImagesArray description]);
        }}}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSLog(@"j");
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [allImagesArray count];
    
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseID = @"ReuseID";
    OthersCell *mycell = (OthersCell *) [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    UIImageView *imageInCell = (UIImageView*)[mycell viewWithTag:1];
    imageInCell.image = [allImagesArray objectAtIndex:indexPath.row];
    NSLog(@"a");
    return mycell;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
