//
//  CustomSectionHeaderViewController.m
//  CustomSectionHeader
//
//  Created by Samuel Ryan Goodwin on 10/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CustomSectionHeaderViewController.h"

@implementation CustomSectionHeaderViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
	return 10;
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section{
	return 10;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	NSString *identifier = @"poop";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if(!cell){
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
	}
	
	cell.textLabel.text = [NSString stringWithFormat:@"%i,%i", indexPath.row, indexPath.section];
	return cell;
}

- (CGRect)sectionHeaderRectShowingIndex{
	BOOL isPortrait = UIDeviceOrientationIsPortrait([[UIApplication sharedApplication] statusBarOrientation]);
	if(isPortrait){
		return CGRectMake(0.0f, 0.0f, 740.0f, 30.0f);
	}
	return CGRectMake(0.0f, 0.0f, 996.0f, 30.0f);
}

- (CGRect)sectionHeaderRectNotShowingIndex{
	BOOL isPortrait = UIDeviceOrientationIsPortrait([[UIApplication sharedApplication] statusBarOrientation]);
	if(isPortrait){
		return CGRectMake(0.0f, 0.0f, 768.0f, 30.0f);
	}
	return CGRectMake(0.0f, 0.0f, 1080.0f, 30.0f);
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section 
{
	UIView *headerView = [[[UIView alloc] initWithFrame:CGRectMake(-32.0f, 0.0f, 736.0f, 30.0f)] autorelease]; // 
	headerView.clipsToBounds = YES;
	
	UIImageView *headerBackground = [[[UIImageView alloc] initWithImage:[[[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"table_divider" ofType:@"png"]] autorelease]] autorelease];
	[headerBackground setClipsToBounds:YES];
	
	// Set the width of the header image appropriately based on wether or not the index titles are displaying.
	UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(22,1,500, 22)] autorelease];
	label.text = [NSString stringWithFormat:@"Section: %i", section];
	[headerBackground setFrame:[self sectionHeaderRectNotShowingIndex]];
	
	label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
	label.shadowOffset = CGSizeMake(0, 1);
	label.shadowColor  = [UIColor colorWithRed:255.0 green:255.0 blue:255.0 alpha:0.8];
	[label setBackgroundColor:[UIColor clearColor]];
	
	// What does this do? If I comment it out, my fix above for the section header width works.
	//[[headerBackground layer] setTransform:CATransform3DMakeTranslation(-320, -4, 0)];
	
	//[headerView setBackgroundColor:[UIColor colorWithRed:0.5 green:0.4 blue:1.0 alpha:0.5]];
	[headerView setBackgroundColor:[UIColor clearColor]];
	[headerView addSubview:headerBackground];
	[headerView addSubview:label];
	return headerView;
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
