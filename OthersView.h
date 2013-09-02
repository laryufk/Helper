#import <UIKit/UIKit.h>


@interface OthersViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSMutableArray *allImagesArray;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionOthers;

@end
