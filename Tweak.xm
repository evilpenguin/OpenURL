/*
 * Project: OpenURL
 * Version: 0.5.0
 * Author:	EvilPenguin|
 *
 *
 * Enjoy (<>..<>)
 */
 
#import <AppSupport/CPDistributedMessagingCenter.h>
 
@interface SpringBoard 
- (void)applicationOpenURL:(id)url publicURLsOnly:(BOOL)only animating:(BOOL)animating;
- (NSDictionary *)openURLCommand:(NSString *)name withUserInfo:(NSDictionary *)userInfo;
@end
 
%hook SpringBoard 
- (id)init {
	CPDistributedMessagingCenter *messagingCenter = [CPDistributedMessagingCenter centerNamed:@"com.understruction.openurl.notification"];
	[messagingCenter runServerOnCurrentThread];
	[messagingCenter registerForMessageName:@"openurl" 
									 target:self 
								   selector:@selector(openURLCommand:withUserInfo:)];
	return %orig;
}

%new
- (NSDictionary *)openURLCommand:(NSString *)name withUserInfo:(NSDictionary *)userInfo {
    NSString *url = [userInfo objectForKey:@"url"];
	if (![url hasPrefix:@"http://"]) url = [NSString stringWithFormat:@"http://%@", url];
    [self applicationOpenURL:[NSURL URLWithString:url] publicURLsOnly:NO animating:YES];
	return [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:1] forKey:@"returnStatus"];
}

%end