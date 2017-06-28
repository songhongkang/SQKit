//
//  SQViewController.m
//  SQKit
//
//  Created by wsong on 06/26/2017.
//  Copyright (c) 2017 wsong. All rights reserved.
//

#import "SQViewController.h"
#import "SQKit-umbrella.h"

@interface SQViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation SQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.label.text = [NSJSONSerialization JSONObjectWithData:[@"{\"name\":null}" dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableContainers error:nil][@"name"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

@end
