//
//  AboutViewController.m
//  ServiceCenterProg
//
//  Created by iei19100004 on 25/08/21.
//

#import "AboutViewController.h"
#import "EmailViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController


UIButton *btnContactUs;
UIColor *colorAppKit;

@synthesize logoApp, textView, imageView1, imageView2, view1, view2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"About Us";
    colorAppKit = [[UIColor alloc] initWithRed:7.0/255.0 green:59.0/255.0 blue:158.0/255.0 alpha:1.0];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:colorAppKit,
    NSFontAttributeName:[UIFont boldSystemFontOfSize:22.0]}];
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    [self setInitComponent];
    
}

-(void) setInitComponent {
    
    //Image Logo
    logoApp = [[UIImageView alloc] init];
    logoApp.image = [UIImage imageNamed:@"logo"];
    [logoApp.heightAnchor constraintEqualToConstant:80].active = true;
    [logoApp.widthAnchor constraintEqualToConstant:200].active = true;
    
    //StackView Logo
    UIStackView *stackViewLogo = [[UIStackView alloc] init];
    
    stackViewLogo.axis = UILayoutConstraintAxisVertical;
    stackViewLogo.distribution = UIStackViewDistributionEqualSpacing;
    stackViewLogo.alignment = UIStackViewAlignmentCenter;
    stackViewLogo.spacing = 0;
    
    [stackViewLogo addArrangedSubview:logoApp];
    
    //Teks About Us
    textView = [[UITextView alloc] init];
    textView.text = @"Epson always continues to exceed customer expectations with its wide range of high-precision, energy-efficient products in the region. We will give you the best services if you need advice on how to troubleshoot a faulty product. Our trained technicians can either walk you through the resolution process or advice if you have to bring it in for repair.";
    textView.textAlignment = NSTextAlignmentJustified;
    textView.editable = NO;
    textView.selectable = NO;
    [textView setFont:[UIFont fontWithName:@"Avenir Next" size:15]];
    [textView.heightAnchor constraintEqualToConstant:250].active = true;
    [textView.widthAnchor constraintEqualToConstant:250].active = true;
    
    //StackView TeksView
    UIStackView *stackViewText = [[UIStackView alloc] init];
    
    stackViewText.axis = UILayoutConstraintAxisVertical;
    stackViewText.distribution = UIStackViewDistributionEqualSpacing;
    stackViewText.alignment = UIStackViewAlignmentCenter;
    stackViewText.spacing = 0;
    
    [stackViewText addArrangedSubview:textView];
    
    
    //Button Contact
    btnContactUs = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnContactUs setTitle:@"Contact Us" forState:UIControlStateNormal];
    [btnContactUs setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnContactUs setBackgroundColor:colorAppKit];
    [btnContactUs.heightAnchor constraintEqualToConstant:55].active = true;
    [btnContactUs.widthAnchor constraintEqualToConstant:240].active = true;
    btnContactUs.layer.cornerRadius = 5;
    [btnContactUs addTarget:self action:@selector(btnContactUsAction:) forControlEvents:UIControlEventTouchUpInside];
     
    //StackView Button
    UIStackView *stackViewButton = [[UIStackView alloc] init];
    
    stackViewButton.axis = UILayoutConstraintAxisVertical;
    stackViewButton.distribution = UIStackViewDistributionEqualSpacing;
    stackViewButton.alignment = UIStackViewAlignmentCenter;
    stackViewButton.spacing = 0;
    
    [stackViewButton addArrangedSubview:btnContactUs];
    
    //StackView All
    UIStackView *stackView = [[UIStackView alloc] init];
    
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.distribution = UIStackViewDistributionFill;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.spacing = 20;
    
    [stackView addArrangedSubview:stackViewLogo];
    [stackView addArrangedSubview:stackViewText];
    [stackView addArrangedSubview:stackViewButton];
    
    stackView.translatesAutoresizingMaskIntoConstraints = false;
    [self.view addSubview:stackView];
 
 //Layout for Stack View
     [stackView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = true;
     [stackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = true;
    
}

-(void) btnContactUsAction:(UIButton *)sender {
    EmailViewController *emailItem = [[EmailViewController alloc] initWithNibName:@"EmailViewController" bundle:nil];
    //emailItem.delegate = self;

    [self.navigationController pushViewController:emailItem animated:YES];
    [[self navigationItem] setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]];
}


@end
