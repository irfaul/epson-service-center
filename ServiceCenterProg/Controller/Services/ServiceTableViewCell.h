//
//  ServiceTableViewCell.h
//  ServiceCenterProg
//
//  Created by iei19100004 on 25/08/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ServiceTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *serviceName;
@property (weak, nonatomic) IBOutlet UILabel *serviceAddress;
@property (weak, nonatomic) IBOutlet UIImageView *serviceImage;
@property (weak, nonatomic) IBOutlet UIView *cardView;





@end

NS_ASSUME_NONNULL_END
