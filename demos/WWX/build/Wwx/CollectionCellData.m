//
//  CollectionCellData
//  Wwx
//
//  Source generated by Haxe Objective-C target
//

#import "CollectionCellData.h"

@implementation CollectionCellData

@synthesize indexPath;
@synthesize selected;
@synthesize isLoading;
@synthesize type;
@synthesize localurl;
@synthesize thumbUrl;
@synthesize sourceUrl;
@synthesize image;
@synthesize delegate;
// Dynamic method defined with an objc method and a block property
- (void) loadFinishedForIndexPath:(NSIndexPath*)indexPath{
	if ( hx_dyn_loadFinishedForIndexPath ) { hx_dyn_loadFinishedForIndexPath(indexPath); return; }
}
@synthesize hx_dyn_loadFinishedForIndexPath;

- (void) loadImageFromLibrary:(NSURL*)url{
	
	self.isLoading = YES;
	[NSThread detachNewThreadSelector:@selector(loadImageCG:) toTarget:self withObject:url];
}
- (void) loadImageCG:(NSURL*)url{
	
	
	CollectionCellData *_g = self;
	id resultblock = ^(ALAsset *myasset){
		
		
		UIImage *img = [UIImage imageWithCGImage:[myasset thumbnail]];
		[_g performSelectorOnMainThread:@selector(loadFinished:) withObject:img waitUntilDone:NO];
	};
	id failureblock = ^(NSError *myerror){
		
		[Log trace:[@"Cant get image - %@" stringByAppendingString:[myerror localizedDescription]] infos:@{@"fileName":@"CollectionCellData.hx", @"lineNumber":@"39", @"className":@"CollectionCellData", @"methodName":@"loadImageCG"}];
	};
	
	ALAssetsLibrary *assetslibrary = [[ALAssetsLibrary alloc] init];
	[assetslibrary assetForURL:url resultBlock:resultblock failureBlock:failureblock];
}
- (void) loadImageFromUrl:(NSString*)url{
	
	self.isLoading = YES;
	[NSThread detachNewThreadSelector:@selector(loadImageData:) toTarget:self withObject:url];
}
- (void) loadImageData:(NSString*)url{
	
	
	NSData *imageData = [[NSData alloc]  initWithContentsOfURL:[NSURL URLWithString:url]];
	
	UIImage *img = [[UIImage alloc]  initWithData:imageData];
	[self performSelectorOnMainThread:@selector(loadFinished:) withObject:img waitUntilDone:NO];
}
- (void) loadFinished:(UIImage*)image{
	
	if (self.isLoading) {
		
		self.isLoading = NO;
		self.image = image;
	}
	[self loadFinishedForIndexPath:self.indexPath];
}

@end
