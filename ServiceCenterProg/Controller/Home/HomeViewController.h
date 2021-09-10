//
//  HomeViewController.h
//  ServiceCenterProg
//
//  Created by iei19100004 on 25/08/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController {
    
    NSTimer *timer;
}

@property (strong, nonatomic) IBOutlet UIImageView *logoApp;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@end

NS_ASSUME_NONNULL_END
