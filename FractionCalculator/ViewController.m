//
//  ViewController.m
//  FractionCalculator
//
//  Created by MF839-018 on 2016. 5. 16..
//  Copyright © 2016년 SAMSUNG SDS. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()

@end

@implementation ViewController{
    char op;
    int currentNumber;
    BOOL firstOperand, isNumerator;
    Calculator *myCalculator;
    NSMutableString *displayString;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    firstOperand = YES;
    isNumerator = YES;
    displayString = [NSMutableString stringWithCapacity:40];
    myCalculator = [[Calculator alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickDigit:(id)sender{
    int digit = (int)[sender tag];
    [self processDigit:digit];
}

- (IBAction)clickOver:(id)sender {
    [self storeFracPart];
    isNumerator = NO;
    [displayString appendString:@"/"];
    _display.text = displayString;
}

- (IBAction)clickClear:(id)sender {
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString:@""];
    _display.text = displayString;
}

- (IBAction)clickEqual:(id)sender {
    if(firstOperand == NO){
        [self storeFracPart];
        [myCalculator performOperation:op];
        
        [displayString appendString:@" = "];
        [displayString appendString:[myCalculator.accumulator convertToString]];
        _display.text = displayString;
        
        currentNumber = 0;
        isNumerator = YES;
        firstOperand = YES;
        [displayString setString:@""];
    }
}

- (IBAction)clickMinus:(id)sender {
    [self processOps:'-'];
}

- (IBAction)clickPlus:(id)sender {
    [self processOps:'+'];
}

- (IBAction)clickMul:(id)sender {
    [self processOps:'*'];
}

- (IBAction)clickDiv:(id)sender {
    [self processOps:'/'];
}

- (IBAction)clickPercent:(id)sender {
//    [self processOps:'-'];
}

- (IBAction)clickDel:(id)sender {
}

- (void)processOps:(int)theOp{
    NSString *opStr;
    op = theOp;
    
    switch(theOp){
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '*':
            opStr = @" * ";
            break;
        case '/':
            opStr = @" / ";
            break;
        default:
            break;
    }
    [self storeFracPart];
    firstOperand = NO;
    isNumerator = YES;
    [displayString appendString:opStr];
    _display.text = displayString;
}

- (void)processDigit:(int)digit{
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendFormat:@"%d", digit];
    _display.text = displayString;
}

- (void)storeFracPart{
    if(firstOperand){
        if(isNumerator){
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        } else{
            myCalculator.operand1.denominator = currentNumber;
        }
    } else if(isNumerator) {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    } else {
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    
    currentNumber = 0;
}

@end
