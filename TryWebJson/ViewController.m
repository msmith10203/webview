//
//  ViewController.m
//  TryWebJson
//
//  Created by Mike Smith on 6/10/13.
//  Copyright (c) 2013 Mike Smith. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    // Return YES for supported orientations
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
    
}


// implement loadView to create a view hierarchy programmatically without using a nib.
- (void) loadView
{
	//NSBundle *bundle = [NSBundle mainBundle];
	//NSString *fileName = [bundle pathForResource: @"Home/GetSurveyData" ofType: @""];
    
    NSURL *url = [NSURL URLWithString: @"https://www.corpmergers.com/Home/GetSurveyData"];
	NSData *data = [NSData dataWithContentsOfURL: url];
	if (data == nil) {
		NSLog(@"could not load URL %@", url);
		return;
	}
    
	//No reason to create the UIWebView if we couldn't create the NSData.
	UIWebView *webView =
    [[UIWebView alloc] initWithFrame: [UIScreen mainScreen].applicationFrame];
	webView.scalesPageToFit = NO;	//Can user zoom in and out?
	webView.contentMode = UIViewContentModeRedraw;
    
    
	[webView loadData: data
             MIMEType: @"application/json"
     textEncodingName: @"NSUTF8StringEncoding"
              baseURL: url
     ];
    
//	webView.alpha = 0;
	self.view = webView;
    
/*
	NSData *data = [[NSData alloc]init];//[NSData dataWithContentsOfFile: fileName];
	
	UIWebView *webView = [[UIWebView alloc] initWithFrame: [UIScreen mainScreen].applicationFrame];
	webView.delegate = self;
    
	if (data == nil) {
		[webView loadHTMLString: @"Could not load page." baseURL: nil];
	} else {
		[webView loadData: data
                 MIMEType: @"application/json"
         textEncodingName: @"utf-8"
                  baseURL: [NSURL URLWithString: @"https://www.corpmergers.com/Home/GetSurveyData"]
         ];
	}
    
	self.view = webView;
*/
}

#pragma mark -
#pragma mark method of protocol UIWebViewDelegate

- (void) webViewDidFinishLoad: (UIWebView *) v {
    NSLog(@"webViewDidFinishLoad");
/*
	NSString *javaScript = [NSString stringWithFormat:
                            @"showmap(%.15g, %.15g, %d);",
                            //7 East 12th Street, New York, NY  10003
                            40.73454291744775,    //latitude
                            -73.99410576491357,   //longitude
                            18             			//zoom level
                            ];
	NSLog(@"javaScript == \"%@\"", javaScript);
	
	if ([v stringByEvaluatingJavaScriptFromString: javaScript] == nil) {
		NSLog(@"stringByEvaluatingJavaScriptFromString: failed.");
	}
*/
}

@end
