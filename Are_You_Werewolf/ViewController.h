//
//  ViewController.h
//  Are_You_Werewolf
//
//  Created by ucuc on 2014/05/09.
//  Copyright (c) 2014年 ucuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSMutableArray *myLabelArray;
    CGPoint firstLocation;
}

@property (weak, nonatomic) IBOutlet UILabel *myLabel1;
@end
