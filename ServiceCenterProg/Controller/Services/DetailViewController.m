//
//  DetailViewController.m
//  ServiceCenterProg
//
//  Created by iei19100004 on 25/08/21.
//

#import "DetailViewController.h"
#import "MapPin.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize detailName, detailAddress, detailPhone, detailImage, detailModel, locationManager ,btnView, detailMap;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"Detail";
    [self.navigationItem.backBarButtonItem setTitle:@""];
    btnView.layer.cornerRadius = 5;
    detailMap.layer.cornerRadius = 5;
    
    detailName.text = detailModel[0];
    detailAddress.text = detailModel[1];
    detailImage.image = [UIImage imageNamed:detailModel[2]];
    detailPhone.text = detailModel[3];
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    
    CLLocationCoordinate2D location;
    
    location.latitude = [detailModel[4] doubleValue];
    location.longitude = [detailModel[5] doubleValue];
    
    region.span = span;
    region.center = location;
    
    [detailMap setRegion:region animated:YES];
    
    MapPin *ann = [[MapPin alloc] init];
    ann.coordinate = location;
    
    [detailMap addAnnotation:ann];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnDirection:(id)sender {
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager requestAlwaysAuthorization];
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied ||
          [CLLocationManager authorizationStatus] == kCLAuthorizationStatusRestricted) {
        NSLog(@"Location disabled");
      } else {
          [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://maps.apple.com/?daddr=%@,%@",detailModel[4], detailModel[5]]] options:@{} completionHandler:nil];
          
          [locationManager startUpdatingLocation];
      }
}


@end
