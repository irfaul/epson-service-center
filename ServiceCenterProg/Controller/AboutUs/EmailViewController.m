//
//  EmailViewController.m
//  ServiceCenterProg
//
//  Created by iei19100004 on 27/08/21.
//

#import "EmailViewController.h"

@interface EmailViewController ()

@end

@implementation EmailViewController

@synthesize problemField,nameField,emailField,sendBtn, selectBtn, selectField;
@synthesize arrayLoc, selectedLoc, imageBtn;
@synthesize pickerImage, image, delImage;

UIColor *coloremail;
UIAlertController *alertAddImg;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"Email Us";
    //self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    coloremail = [[UIColor alloc] initWithRed:7.0/255.0 green:59.0/255.0 blue:158.0/255.0 alpha:1.0];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:coloremail,
    NSFontAttributeName:[UIFont boldSystemFontOfSize:22.0]}];
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    [self setInitComponent];
    
    problemField.delegate = self;
}

- (void) setInitComponent {
    problemField.layer.cornerRadius = 5;
    nameField.layer.cornerRadius = 5;
    emailField.layer.cornerRadius = 5;
    selectField.layer.cornerRadius = 5;
    problemField.layer.borderWidth = 1.0;
    nameField.layer.borderWidth = 1.0;
    emailField.layer.borderWidth = 1.0;
    selectField.layer.borderWidth = 1.0;
    problemField.layer.borderColor = coloremail.CGColor;
    nameField.layer.borderColor = problemField.layer.borderColor;
    emailField.layer.borderColor = problemField.layer.borderColor;
    selectField.layer.borderColor = problemField.layer.borderColor;
    sendBtn.layer.cornerRadius = 5;
    delImage.hidden = YES;
    
    arrayLoc = @[@"Bali",@"Bandung",@"Bekasi",@"Bogor",@"Solo",@"Semarang"];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
// Handle the selection
    NSLog(@"%@",[arrayLoc objectAtIndex:row]);
    selectedLoc = [NSString stringWithFormat:@"%@",[arrayLoc objectAtIndex:row]];
}
// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [arrayLoc count];
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {

    return [arrayLoc objectAtIndex: row];

}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    int sectionHeight = 40;

    return sectionHeight;
}

- (IBAction)addImageBtn:(id)sender {
    alertAddImg = [UIAlertController alertControllerWithTitle:@"Select image source"
                                  message:@""
                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    //Add cancel button on UIAlertView
    UIAlertAction *btnCancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertAddImg dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *btnCamera = [UIAlertAction actionWithTitle:@"Take a photo" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.pickerImage = [[UIImagePickerController alloc] init];
        self.pickerImage.delegate = self;
        [self.pickerImage setSourceType:UIImagePickerControllerSourceTypeCamera];
        [self presentViewController:self.pickerImage animated:YES completion:NULL];
    }];
    
    UIAlertAction *btnGallery = [UIAlertAction actionWithTitle:@"Choose from Gallery" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.pickerImage = [[UIImagePickerController alloc] init];
        self.pickerImage.delegate = self;
        [self.pickerImage setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:self.pickerImage animated:YES completion:NULL];
    }];
    
    [alertAddImg addAction:btnCancel];
    [alertAddImg addAction:btnCamera];
    [alertAddImg addAction:btnGallery];
    
    [self presentViewController:alertAddImg animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [imageBtn setBackgroundImage:image forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    delImage.hidden = NO;
}

- (IBAction)deleleImgBtn:(id)sender {
    image = nil;
    delImage.hidden = YES;
    [imageBtn setBackgroundImage:[UIImage imageNamed:@"addimage"] forState:UIControlStateNormal];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)selectAction:(id)sender {
    
    //Need to use an UIAlertController for iOS 8 instead of an action view
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Select Service Location"
                                  message:@"\n\n\n\n\n\n\n\n"
                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    //Make a frame for the picker & then create the picker
    CGFloat screenWidth = alert.view.layer.frame.size.width;
    //CGFloat screenHeight = alert.view.layer.frame.size.height;
    CGRect pickerFrame = CGRectMake(0, 50.0, screenWidth - 18.0, 150.0);
    UIPickerView *locationsPicker = [[UIPickerView alloc] initWithFrame:pickerFrame];

    //There will be 3 pickers on this view so I am going to use the tag as a way
    //to identify them in the delegate and datasource
    locationsPicker.tag = 1;

    //set the pickers datasource and delegate
    locationsPicker.dataSource = self;
    locationsPicker.delegate = self;

    //Add the picker to the alert controller
    [alert.view addSubview:locationsPicker];
    
    //Add cancel button on UIAlertView
    UIAlertAction *btnCancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    UIAlertAction *btnSelect = [UIAlertAction actionWithTitle:@"Select" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.selectBtn setTitle:self.selectedLoc
                        forState:UIControlStateNormal];
        [alert dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alert addAction:btnCancel];
    [alert addAction:btnSelect];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text rangeOfCharacterFromSet:[NSCharacterSet newlineCharacterSet]]. location == NSNotFound) {
        return YES;
    }
    
    [textView resignFirstResponder];
    
    return NO;
    
}


- (IBAction)sendBtnAction:(id)sender {
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
    [composer setMailComposeDelegate:self];
    
    if ([nameField.text  isEqual: @""] || [emailField.text  isEqual: @""] || [problemField.text  isEqual: @""] || [selectBtn.currentTitle isEqual:@""]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Can't process the email" message:@"Please complete the form" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
        
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
    } else if([MFMailComposeViewController canSendMail]) {
        
        [composer setToRecipients:@[@"ieiapplidesign@gmail.com"]];
        [composer setSubject:@"I'll need to repair my printer"];
        
        [composer setMessageBody:[NSString stringWithFormat:@"Name : %@ \nEmail : %@ \nService Location : %@  \n\nProblem : %@", nameField.text, emailField.text, selectBtn.currentTitle ,problemField.text] isHTML:NO];
        
        if (image) {
            NSData *data = UIImageJPEGRepresentation(image, 1);
            [composer addAttachmentData:data mimeType:@"image/jpeg" fileName:@"service.jpeg"];
        }
        
        [self presentViewController:composer animated:YES completion:nil];
        
    } else {
        NSLog(@"Can't send Mail");
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)dissmissKeyboard:(id)sender {
    [self resignFirstResponder];
}
@end
