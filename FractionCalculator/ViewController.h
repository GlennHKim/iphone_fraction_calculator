//
//  ViewController.h
//  FractionCalculator
//
//  Created by MF839-018 on 2016. 5. 16..
//  Copyright © 2016년 SAMSUNG SDS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *display;

- (IBAction)clickDigit:(id)sender;
- (IBAction)clickOver:(id)sender;
- (IBAction)clickClear:(id)sender;
- (IBAction)clickEqual:(id)sender;
- (IBAction)clickMinus:(id)sender;
- (IBAction)clickPlus:(id)sender;
- (IBAction)clickMul:(id)sender;
- (IBAction)clickDiv:(id)sender;
- (IBAction)clickPercent:(id)sender;
- (IBAction)clickDel:(id)sender;

- (void)processDigit:(int)digit;
- (void)processOps:(int)theOp;
- (void)storeFracPart;

@end

