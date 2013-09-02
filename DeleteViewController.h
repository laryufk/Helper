#import <UIKit/UIKit.h>

@interface TrashViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSMutableArray *allImagesArray;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionTrash;
- (BOOL)removeFilePath:(NSString*)path;

@end
