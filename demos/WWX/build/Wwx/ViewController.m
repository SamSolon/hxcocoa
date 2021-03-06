//
//  ViewController
//  Wwx
//
//  Source generated by Haxe Objective-C target
//

#import "ViewController.h"

@implementation ViewController

@synthesize assetslibrary;
@synthesize navigationController;
@synthesize currentStep;
@synthesize currentAlbumName;
@synthesize stepsView;
@synthesize albumPicker;
@synthesize photosPicker;
@synthesize leftGesture;
@synthesize rightGesture;
@synthesize currentPath;
- (void) loadView{
	
	CGRect frame = [UIScreen mainScreen].bounds;
	self.view = [[UIView alloc] init];
	self.view.frame = frame;
	
	UIImage *pattern = [UIImage imageNamed:@"BackgroundPattern"];
	self.view.backgroundColor = [UIColor colorWithPatternImage:pattern];
}
- (void) viewDidLoad{
	
	[super viewDidLoad];
	self.assetslibrary = [[ALAssetsLibrary alloc] init];
	self.currentStep = 0;
	self.stepsView = [[StepsView alloc] init];
	[self.stepsView _initWithFrame:CGRectMake(0,20,self.view.frame.size.width,40)];
	self.stepsView.delegate = self;
	self.stepsView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	[self.stepsView setStep:self.currentStep];
	self.albumPicker = [[AlbumPickerController alloc] init];
	self.albumPicker.delegate = self;
	self.albumPicker.hx_dyn_localAlbumPicked = ^(ALAssetsGroup *album){ [self localAlbumPicked:album]; };
	self.albumPicker.hx_dyn_facebookAlbumPicked = ^(FBAlbum *album){ [self facebookAlbumPicked:album]; };
	self.navigationController = [[UINavigationController alloc] init];
	self.navigationController.navigationBarHidden = YES;
	self.navigationController.view.backgroundColor = [UIColor clearColor];
	[self.navigationController pushViewController:self.albumPicker animated:YES];
	[self.view addSubview:self.navigationController.view];
	self.leftGesture = [[UISwipeGestureRecognizer alloc] init];
	[self.leftGesture addTarget:self action:@selector(leftGestureActioned)];
	self.leftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
	[self.navigationController.view addGestureRecognizer:self.leftGesture];
	self.rightGesture = [[UISwipeGestureRecognizer alloc] init];
	[self.rightGesture addTarget:self action:@selector(rightGestureActioned)];
	self.rightGesture.direction = UISwipeGestureRecognizerDirectionRight;
	[self.navigationController.view addGestureRecognizer:self.rightGesture];
	
	Wwx *appDelegate = (Wwx*)[UIApplication sharedApplication].delegate;
}
- (void) leftGestureActioned{
	
	[Log trace:@"swipe left" infos:@{@"fileName":@"ViewController.hx", @"lineNumber":@"94", @"className":@"ViewController", @"methodName":@"leftGestureActioned"}];
	{
		
		
		ViewController *_g = self;
		switch (_g.currentStep){
			case 1:{
				[self photosPicked:nil];
			}
			break;
			case 2:{
				[self addExporter];
			}
			break;
		}
	}
}
- (void) rightGestureActioned{
	
	[Log trace:@"swipe right" infos:@{@"fileName":@"ViewController.hx", @"lineNumber":@"108", @"className":@"ViewController", @"methodName":@"rightGestureActioned"}];
	{
		
		
		UIViewController *p = [self.navigationController popViewControllerAnimated:YES];
		[p.view removeFromSuperview];
		p = nil;
		[self setStep:self.currentStep - 1];
	}
}
- (void) setStep:(int)j{
	
	self.currentStep = j;
	[self.stepsView setStep:j];
}
- (void) stepTouched:(int)i{
	
	[Log trace:@">> touch step " infos:@{@"fileName":@"ViewController.hx", @"lineNumber":@"127", @"className":@"ViewController", @"methodName":@"stepTouched"}];
	if (i < self.currentStep) {
		[self rightGestureActioned];
	}
	else {
		if (i > self.currentStep) {
			[self leftGestureActioned];
		}
	}
}
- (void) enableSteps:(BOOL)b{
	
	if (b) {
		[self.view addSubview:self.stepsView];
	}
	else {
		[self.view insertSubview:self.stepsView atIndex:0];
	}
}
- (void) localAlbumPicked:(ALAssetsGroup*)album{
	
	[Log trace:@"local album picked" infos:@{@"fileName":@"ViewController.hx", @"lineNumber":@"148", @"className":@"ViewController", @"methodName":@"localAlbumPicked"}];
	self.photosPicker = [[PhotosPickerController alloc] init];
	self.photosPicker.delegate = self;
	[self.navigationController pushViewController:self.photosPicker animated:YES];
	[self.photosPicker loadLocalAlbum:album];
	self.currentAlbumName = [album valueForProperty:ALAssetsGroupPropertyName];
	[self setStep:1];
}
- (void) facebookAlbumPicked:(FBAlbum*)album{
	
	[Log trace:@"facebook album picked" infos:@{@"fileName":@"ViewController.hx", @"lineNumber":@"160", @"className":@"ViewController", @"methodName":@"facebookAlbumPicked"}];
	self.photosPicker = [[PhotosPickerController alloc] init];
	self.photosPicker.delegate = self;
	[self.navigationController pushViewController:self.photosPicker animated:YES];
	[self.photosPicker loadFacebookAlbum:album.albumId];
	self.currentAlbumName = album.name;
	[self setStep:1];
}
- (void) photosPicked:(NSMutableArray*)urls{
	
}
- (void) selectMovieAtPath:(NSString*)path{
	
	self.currentPath = path;
	
	UIAlertView *alert = [[UIAlertView alloc]  initWithTitle:@"My Videos" message:@"You've selected a movie, what next?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Play"];
	[alert show];
}
- (NSMutableArray*) selectedImagesUrls{
	
	return [self.photosPicker selectedImagesUrls];
}
- (void) addExporter{
	
	[self setStep:3];
}
- (BOOL) shouldAutorotate{
	
	return YES;
}
- (void) pause{
	
}
- (void) resume{
	
}
- (void) applicationDidEnterBackground{
	
}
- (void) applicationWillEnterForeground{
	
}

@end
