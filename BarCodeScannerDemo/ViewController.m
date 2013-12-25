//
//  ViewController.m
//  BarCodeScannerDemo
//
//  Created by Dennis Charles Hackethal on 24.12.13.
//  Copyright (c) 2013 Stagelink GmbH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

@synthesize resultImageView;
@synthesize resultTextView;

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

- (IBAction)startScanning:(id)sender {
    
    NSLog(@"Scanning..");
    resultTextView.text = @"Scanning..";
    
    ZBarReaderViewController *codeReader = [ZBarReaderViewController new];
    codeReader.readerDelegate=self;
    codeReader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = codeReader.scanner;
    [scanner setSymbology: ZBAR_I25 config: ZBAR_CFG_ENABLE to: 0];
    
    [self presentViewController:codeReader animated:YES completion:nil];
    
}

- (void) imagePickerController: (UIImagePickerController*) reader didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    //  get the decode results
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
    
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        // just grab the first barcode
        break;
    
    // showing the result on textview
    resultTextView.text = symbol.data;
    NSLog(symbol.data);
    
    resultImageView.image = [info objectForKey: UIImagePickerControllerOriginalImage];
    
    // dismiss the controller
    [reader dismissViewControllerAnimated:YES completion:nil];
}
@end
