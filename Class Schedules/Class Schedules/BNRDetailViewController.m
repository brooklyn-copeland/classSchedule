//
//  BNRDetailViewController.m
//  Class Schedules
//
//  Created by Brooklyn Copeland on 4/29/14.
//  Copyright (c) 2014 Brooklyn Copeland. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRClass.h"


@interface BNRDetailViewController ()
- (void)configureView;
@end

@implementation BNRDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
        //add week arrays
        NSMutableArray *mArray = [BNRClass getClassStartAndEndTimeM:self.detailItem.classBlock];
        NSMutableArray *tArray = [BNRClass getClassStartAndEndTimeT:self.detailItem.classBlock];
        NSMutableArray *wArray = [BNRClass getClassStartAndEndTimeW:self.detailItem.classBlock];
        NSMutableArray *thArray = [BNRClass getClassStartAndEndTimeTH:self.detailItem.classBlock];
        NSMutableArray *fArray = [BNRClass getClassStartAndEndTimeF:self.detailItem.classBlock];
        //change monday label
        self.mST.text= [mArray objectAtIndex:0];
        self.mET.text = [mArray objectAtIndex:1];
        //change tues label
        self.tST.text= [tArray objectAtIndex:0];
        self.tET.text = [tArray objectAtIndex:1];
        //change wed label
        self.wST.text= [wArray objectAtIndex:0];
        self.wET.text = [wArray objectAtIndex:1];
        //change th label
        self.thST.text= [thArray objectAtIndex:0];
        self.thET.text = [thArray objectAtIndex:1];
        //change fri label
        self.fST.text= [fArray objectAtIndex:0];
        self.fET.text = [fArray objectAtIndex:1];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
