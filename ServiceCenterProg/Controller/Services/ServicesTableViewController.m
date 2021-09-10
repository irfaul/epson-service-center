//
//  ServicesTableViewController.m
//  ServiceCenterProg
//
//  Created by iei19100004 on 25/08/21.
//

#import "ServicesTableViewController.h"
#import "ServiceTableViewCell.h"
#import "DetailViewController.h"

@interface ServicesTableViewController ()

@end

@implementation ServicesTableViewController

NSString *identifier = @"ServiceCell";
UIColor *colorTitle;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 100;
    self.tableView.separatorColor = [UIColor clearColor];
    
    self.navigationItem.title = @"Services";
    colorTitle = [[UIColor alloc] initWithRed:7.0/255.0 green:59.0/255.0 blue:158.0/255.0 alpha:1.0];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:colorTitle,
    NSFontAttributeName:[UIFont boldSystemFontOfSize:22.0]}];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ServiceCenters" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    
    dataSource = dict[@"Places"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ServiceTableViewCell" bundle:nil] forCellReuseIdentifier:identifier];
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataSource.count;
}

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ServiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSDictionary *dict = dataSource[indexPath.row];
    
    cell.serviceName.text = dict[@"Title"];
    cell.serviceAddress.text = dict[@"Address"];
    cell.serviceImage.image = [UIImage imageNamed:dict[@"Image"]];
    cell.serviceImage.layer.cornerRadius = 5.0;
    
    cell.cardView.layer.shadowColor = [UIColor grayColor].CGColor;
    cell.cardView.layer.shadowOffset = CGSizeMake(1.0, 1.0);
    cell.cardView.layer.shadowOpacity = 1.0;
    cell.cardView.layer.masksToBounds = false;
    cell.cardView.layer.cornerRadius = 5.0;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetailViewController *serviceDetail = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:nil];
    NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
    
    NSDictionary *dict = dataSource[myIndexPath.row];
    
    serviceDetail.detailModel = @[dict[@"Title"],
                                  dict[@"Address"],
                                  dict[@"Image"],
                                  dict[@"Phone"],
                                  dict[@"Latitude"],
                                  dict[@"Longitude"]];
    
    [self.navigationController pushViewController:serviceDetail animated:YES];
    [[self navigationItem] setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil]];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
