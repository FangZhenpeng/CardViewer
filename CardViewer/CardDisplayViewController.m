//
//  CardDisplayViewController.m
//  CardViewer
//
//  Created by 方振鹏 on 13-12-8.
//  Copyright (c) 2013年 方振鹏. All rights reserved.
//

#import "CardDisplayViewController.h"
#import "PlayingCardView.h"

@interface CardDisplayViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;

@end

@implementation CardDisplayViewController


- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.playingCardView.rank = self.rank;
    self.playingCardView.suit = self.suit;
    self.playingCardView.faceUp = YES;
}
@end
