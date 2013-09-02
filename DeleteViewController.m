
#import "TrashViewController.h"
#import "TrashCell.h"

@interface TrashViewController ()

@end

@implementation TrashViewController {
    NSArray *Trash ;
}
@synthesize collectionTrash;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    allImagesArray = [[NSMutableArray alloc] init];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSArray *locations = [[NSArray alloc]initWithObjects:@"Bottoms", @"Dress", @"Coats", @"Others", @"hats", @"Tops",nil ];
    NSString *fPath = documentsDirectory;
    NSMutableArray *trashCan = [NSMutableArray array];
    NSArray *directoryContent;
    for(NSString *component in locations){
    NSString *TrashBin = [fPath stringByAppendingPathComponent:component];
    NSArray *directoryContent = [[NSFileManager defaultManager] directoryContentsAtPath: TrashBin];
    collectionTrash.delegate =self;
    collectionTrash.dataSource=self;
    for(NSString *str in directoryContent){
    NSLog(@"str:%@", str);
  NSString *finalFilePath = [TrashBin stringByAppendingPathComponent:str];
        NSData *data = [NSData dataWithContentsOfFile:finalFilePath];
        [trashCan addObject:finalFilePath];
        if(data)
        {
            UIImage *image = [UIImage imageWithData:data];
            [allImagesArray addObject:image];
            NSLog(@"array:%@",[allImagesArray description]);
        }}}
    Trash = trashCan;
    for(NSString *folder in locations) {
        
    for(NSString *file in directoryContent) {
            
            // load the image
            
        }
    }}

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
    TrashCell *mycell = (TrashCell *) [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    UIImageView *imageInCell = (UIImageView*)[mycell viewWithTag:1];
    imageInCell.image = [allImagesArray objectAtIndex:indexPath.row];
    NSLog(@"a");
    return mycell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"配列:%d", [Trash count]);
    NSString *trashBin = [Trash objectAtIndex:indexPath.row];
    NSLog(@"k%@l",trashBin);
    [allImagesArray removeObjectAtIndex:indexPath.row];
    [self.collectionTrash reloadData];
    [self deleteMyFiles:trashBin];
}
NSString *myFileName;
-(void) deleteMyFiles:(NSString*)filePath {
    NSError *error;
    
       if([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
