//
//  DetailViewController.h
//  ServiceCenterProg
//
//  Created by iei19100004 on 25/08/21.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) NSArray *detailModel;
@property (strong, nonatomic) CLLocationManager *locationManager;

@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@property (weak, nonatomic) IBOutlet UILabel *detailName;
@property (weak, nonatomic) IBOutlet UILabel *detailAddress;
@property (weak, nonatomic) IBOutlet UILabel *detailPhone;
@property (weak, nonatomic) IBOutlet MKMapView *detailMap;
@property (weak, nonatomic) IBOutlet UIButton *btnView;

- (IBAction)btnDirection:(id)sender;

@end

NS_ASSUME_NONNULL_END
