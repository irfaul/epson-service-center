//
//  HomeViewController.m
//  ServiceCenterProg
//
//  Created by iei19100004 on 25/08/21.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

UIButton *btnService;
UIButton *btnAbout;
UIColor *colorApp;

@synthesize logoApp, timeLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    colorApp = [[UIColor alloc] initWithRed:7.0/255.0 green:59.0/255.0 blue:158.0/255.0 alpha:1.0];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:colorApp,
    NSFontAttributeName:[UIFont boldSystemFontOfSize:22.0]}];
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    
    [self setInitComponent];
}

-(void) updateTime {
    NSDateFormatter *formatDate =[[NSDateFormatter alloc] init];
    [formatDate setDateFormat:@"E, d MMM yyyy HH:mm:ss"];
    timeLabel.text = [formatDate stringFromDate:[NSDate date]];
}

-(void) setInitComponent {
    
    //Image Logo
    logoApp = [[UIImageView alloc] init];
    logoApp.image = [UIImage imageNamed:@"logo"];
    [logoApp.heightAnchor constraintEqualToConstant:99].active = true;
    [logoApp.widthAnchor constraintEqualToConstant:240].active = true;
    
    //StackView Logo
    UIStackView *stackViewLogo = [[UIStackView alloc] init];
    
    stackViewLogo.axis = UILayoutConstraintAxisVertical;
    stackViewLogo.distribution = UIStackViewDistributionEqualSpacing;
    stackViewLogo.alignment = UIStackViewAlignmentCenter;
    stackViewLogo.spacing = 0;
    
    [stackViewLogo addArrangedSubview:logoApp];
    
    //Button Service
    btnService = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnService setTitle:@"Services" forState:UIControlStateNormal];
    [btnService setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnService setBackgroundColor:colorApp];
    [btnService.heightAnchor constraintEqualToConstant:55].active = true;
    [btnService.widthAnchor constraintEqualToConstant:240].active = true;
    btnService.layer.cornerRadius = 5;
    [btnService addTarget:self action:@selector(btnServicesAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //Button About
    btnAbout = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnAbout setTitle:@"About Us" forState:UIControlStateNormal];
    [btnAbout setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnAbout setBackgroundColor:colorApp];
    [btnAbout.heightAnchor constraintEqualToConstant:55].active = true;
    [btnAbout.widthAnchor constraintEqualToConstant:240].active = true;
    btnAbout.layer.cornerRadius = 5;
    [btnAbout addTarget:self action:@selector(btnAboutAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIFont *customFont = [UIFont fontWithName:@"Avenir Next" size:17];
    timeLabel =[[UILabel alloc] init];
    timeLabel.font = customFont;
    timeLabel.adjustsFontSizeToFitWidth = YES;
    timeLabel.textAlignment = NSTextAlignmentCenter;
    
    //StackView Button
    UIStackView *stackViewButton = [[UIStackView alloc] init];
    
    stackViewButton.axis = UILayoutConstraintAxisVertical;
    stackViewButton.distribution = UIStackViewDistributionFillEqually;
    stackViewButton.alignment = UIStackViewAlignmentFill;
    stackViewButton.spacing = 33;
    
    [stackViewButton addArrangedSubview:btnService];
    [stackViewButton addArrangedSubview:btnAbout];
    [stackViewButton addArrangedSubview:timeLabel];
    
    //StackView All
    UIStackView *stackView = [[UIStackView alloc] init];
    
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionFill;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.spacing = 70;
    
    [stackView addArrangedSubview:stackViewLogo];
    [stackView addArrangedSubview:stackViewButton];
    
    stackView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:stackView];
 
 //Layout for Stack View
     [stackView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
     [stackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = true;
    
}

- (void)btnServicesAction:(UIButton *) sender{
    [(UITabBarController *) self.tabBarController setSelectedIndex:1];
}

- (void)btnAboutAction:(UIButton *) sender{
    [(UITabBarController *) self.tabBarController setSelectedIndex:2];
}


@end
