//
//  ViewController.h
//  BarCodeScannerDemo
//
//  Created by Dennis Charles Hackethal on 24.12.13.
//  Copyright (c) 2013 Stagelink GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface ViewController : UIViewController <ZBarReaderDelegate>

@property (weak, nonatomic) IBOutlet UITextView *resultTextView;
@property (weak, nonatomic) IBOutlet UIImageView *resultImageView;

- (IBAction)startScanning:(id)sender;

@end
