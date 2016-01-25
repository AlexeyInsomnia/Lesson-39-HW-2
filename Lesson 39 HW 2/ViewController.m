//
//  ViewController.m
//  Lesson 39 HW 2
//
//  Created by Alex on 25.01.16.
//  Copyright © 2016 Alex. All rights reserved.
//

#import "ViewController.h"

@interface UITableViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString* googleStringUrl =     @"http://www.apple.com";
    NSString* vkStringUrl =         @"http://www.vk.com/iosdevcourse";
    NSString* youtubeStringUrl =    @"http://www.google.com";
    NSString* ipadPdfString =       @"7habbits.pdf";
    NSString* securityPdfString =   @"guide.pdf";
    
    NSArray* arrayUrl = [[NSArray alloc] initWithObjects:googleStringUrl, vkStringUrl, youtubeStringUrl, nil];
    
    NSArray* arrayPdf = [[NSArray alloc] initWithObjects:ipadPdfString, securityPdfString, nil];
    
    self.arrayUrl = arrayUrl;
    self.arrayPdf = arrayPdf;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDataSource



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return @"URLs";
    } else {
        return @"Pdf files";
    }
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return [self.arrayUrl count];
    } else {
        return [self.arrayPdf count];
    }
    
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0) {
        cell.textLabel.text = [self.arrayUrl objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = [self.arrayPdf objectAtIndex:indexPath.row];
    }
    
    return cell;
    
}

#pragma mark - UITableViewDelegate

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    

    UIStoryboard *storyboard = self.storyboard;
    
    APWebViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"APWebViewController"];
    
    
    
    if (indexPath.section == 0) {
        vc.url = [NSURL URLWithString:[self.arrayUrl objectAtIndex:indexPath.row]];
        
    } else {
        vc.url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:[self.arrayPdf objectAtIndex:indexPath.row] ofType:nil]];;
    }
    
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end
