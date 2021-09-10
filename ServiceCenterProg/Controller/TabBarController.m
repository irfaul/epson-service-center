//
//  TabBarController.m
//  ServiceCenterProg
//
//  Created by iei19100004 on 25/08/21.
//

#import "TabBarController.h"
#import "AboutViewController.h"
#import "ServicesTableViewController.h"
#import "HomeViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor= [UIColor whiteColor];
    UIColor *appColor = [[UIColor alloc] initWithRed:7.0/255.0 green:59.0/255.0 blue:158.0/255.0 alpha:1.0];
    [[UITabBar appearance] setTintColor:appColor];
    
    AboutViewController *secondController = [[AboutViewController alloc] init];
    ServicesTableViewController *thirdController = [[ServicesTableViewController alloc] init];
    HomeViewController *fourthController = [[HomeViewController alloc] init];
    
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:secondController];
    UINavigationController *thirdNav = [[UINavigationController alloc] initWithRootViewController:thirdController];
    UINavigationController *fourthNav = [[UINavigationController alloc] initWithRootViewController:fourthController];
    
    secondNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"About Us" image:[UIImage imageNamed:@"Tab4"] tag:1];
    thirdNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Services" image:[UIImage imageNamed:@"Tab3"] tag:2];
    fourthNav.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:[UIImage imageNamed:@"Tab1"] tag:3];
    
    self.viewControllers = [NSArray arrayWithObjects:fourthNav, thirdNav, secondNav, nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
