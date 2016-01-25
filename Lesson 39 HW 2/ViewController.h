//
//  ViewController.h
//  Lesson 39 HW 2
//
//  Created by Alex on 25.01.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APWebViewController.h"

@interface ViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *arrayUrl;
@property (strong, nonatomic) NSArray *arrayPdf;
@end

