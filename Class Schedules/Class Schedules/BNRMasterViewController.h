//
//  BNRMasterViewController.h
//  Class Schedules
//
//  Created by Brooklyn Copeland on 4/29/14.
//  Copyright (c) 2014 Brooklyn Copeland. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNRMasterViewController : UITableViewController
- (IBAction)unwindToList:(UIStoryboardSegue *)segue;
- (IBAction)cancel:(UIStoryboardSegue *)segue;
@end
