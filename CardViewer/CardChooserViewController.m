//
//  CardChooserViewController.m
//  CardViewer
//
//  Created by 方振鹏 on 13-12-8.
//  Copyright (c) 2013年 方振鹏. All rights reserved.
//

#import "CardChooserViewController.h"
#import "CardDisplayViewController.h"

@interface CardChooserViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *suitSegmentedControl;
@property (weak, nonatomic) IBOutlet UILabel *rankLabel;
@property (nonatomic, readonly) unsigned int rank;
@property (nonatomic, strong, readonly) NSString * suit;
@end

@implementation CardChooserViewController

#pragma mark - Delegate Implementation

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"ShowCard"]
        && [segue.destinationViewController isKindOfClass:[CardDisplayViewController class]]) {
        CardDisplayViewController * cardDisplayViewController = (CardDisplayViewController *) segue.destinationViewController;
        cardDisplayViewController.rank = self.rank;
        cardDisplayViewController.suit = self.suit;
        cardDisplayViewController.title = [[self rankAsString][self.rank] stringByAppendingString:self.suit];
    }
}

#pragma mark - Getter and Setter

- (NSArray *) rankAsString{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

- (void) setRank:(unsigned int)rank{
    _rank = rank;
    self.rankLabel.text = [self rankAsString][_rank];
}

- (NSString *) suit{
    return [self.suitSegmentedControl titleForSegmentAtIndex:self.suitSegmentedControl.selectedSegmentIndex];
}

#pragma mark - IBAction

- (IBAction)changeRank:(UISlider *)sender {
    self.rank = (unsigned int)sender.value;
}


#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
