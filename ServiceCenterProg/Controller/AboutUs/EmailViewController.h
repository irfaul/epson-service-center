//
//  EmailViewController.h
//  ServiceCenterProg
//
//  Created by iei19100004 on 27/08/21.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import <MessageUI/MessageUI.h>

NS_ASSUME_NONNULL_BEGIN

@interface EmailViewController : UIViewController <MFMailComposeViewControllerDelegate, UITextViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate> {

NSArray *arrayLoc;
NSString *selectedLoc;
UIImagePickerController *pickerImage;
UIImage *image;

}

@property (nonatomic, retain) UIPickerView *picker;
@property (nonatomic, retain) UIImagePickerController *pickerImage;
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) NSArray *arrayLoc;
@property (nonatomic, retain) NSString *selectedLoc;

@property (weak, nonatomic) IBOutlet UIStackView *selectField;
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextView *problemField;
- (IBAction)dissmissKeyboard:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *sendBtn;
@property (weak, nonatomic) IBOutlet UIButton *imageBtn;
@property (weak, nonatomic) IBOutlet UIButton *delImage;

- (IBAction)sendBtnAction:(id)sender;
- (IBAction)selectAction:(id)sender;
- (IBAction)addImageBtn:(id)sender;
- (IBAction)deleleImgBtn:(id)sender;




@end

NS_ASSUME_NONNULL_END
