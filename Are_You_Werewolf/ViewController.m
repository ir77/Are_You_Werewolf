//
//  ViewController.m
//  Are_You_Werewolf
//
//  Created by ucuc on 2014/05/09.
//  Copyright (c) 2014年 ucuc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    myLabelArray  = [NSMutableArray array];

    [self.view addSubview:[self makeLabel:50 labelLocationX:20 labelLocationY:20 withName:@"人狼"]];
    [self.view addSubview:[self makeLabel:50 labelLocationX:20 labelLocationY:120 withName:@"狂人"]];

    [self.view addSubview:[self makeLabel:50 labelLocationX:250 labelLocationY:20 withName:@"占師"]];
    [self.view addSubview:[self makeLabel:50 labelLocationX:250 labelLocationY:70 withName:@"霊媒師"]];
    [self.view addSubview:[self makeLabel:50 labelLocationX:250 labelLocationY:120 withName:@"狩人"]];

    
    NSArray *arr = @[@"hoge1", @"hoge2",
                     @"hoge3", @"hoge4",
                     @"hoge5", @"hoge6",
                     @"hoge7", @"hoge8",
                     @"hoge9",];
    for (int i=0; i<[arr count]; i++) {
        if (i<[arr count]/2) {
            [self makeLabelDrag:
             [self makeLabel:50 labelLocationX:100
              labelLocationY:120+i*35 withName:arr[i]]];
        }else {
            [self makeLabelDrag:
             [self makeLabel:50 labelLocationX:300
              labelLocationY:120+(i-(int)([arr count]/2))*35 withName:arr[i]]];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// --------------------------- ラベルの動的な生成 ---------------------------
#pragma mark - making dynamic label
-(UILabel *)makeLabel:(int)labelSize
       labelLocationX:(int)locationX labelLocationY:(int)locationY withName:(NSString *)name
{
    UILabel* label = [[UILabel alloc]
                      initWithFrame:CGRectMake(locationX, locationY, labelSize, labelSize)];
    label.text = name;
    label.font = [UIFont systemFontOfSize:30];
    
    // テキストの内容によりラベルの大きさを変える
    [label sizeToFit];
    
    return label;
}

-(void)makeLabelDrag:(UILabel *)label
{
    label.userInteractionEnabled = true;
    [[label layer] setBackgroundColor:
     [[UIColor colorWithRed:204/255 green:204/255 blue:204/255 alpha:0.1] CGColor]];
    [[label layer] setCornerRadius:12.0]; //丸角具合
    
    label.tag = 10 + (unsigned long)[myLabelArray count];
    [myLabelArray addObject:label];
    [self.view addSubview:[myLabelArray lastObject]];
}


// ---------------------------ドラッグ関係のメソッド------------------------------------
#pragma mark - drag
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    if ([[touch view] tag] >= 10) {
        UILabel *label = [myLabelArray objectAtIndex:[[touch view] tag]-10];
        // ドラッグ前の位置情報の保持
        firstLocation = label.center;
        if ([label.textColor isEqual:[UIColor blackColor]]) {
            label.textColor = [UIColor redColor];
        } else {
            label.textColor = [UIColor blackColor];
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    if ([[touch view] tag] >= 10) {
        UILabel *label = [myLabelArray objectAtIndex:[[touch view] tag]-10];
        label.center = location;
        [[touch view] setCenter:location];
    }
}

/*
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.view];
}*/

@end
