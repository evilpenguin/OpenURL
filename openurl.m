/*
 * Project: OpenURL
 * Version: 0.5.0
 * Author:	EvilPenguin|
 *
 *
 * Enjoy (<>..<>)
 */

#import <Foundation/Foundation.h>
#import <AppSupport/CPDistributedMessagingCenter.h>
#import <stdio.h>

int main(int argc, char **argv, char **envp) {
    if(!argv[1]) {
        fprintf(stderr, "Usage: openurl http://evilpengu.in\n");
        return 1;
    }
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    NSString *url = [[[NSString alloc] initWithUTF8String:argv[1]] autorelease];
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:url forKey:@"url"];

    CPDistributedMessagingCenter *messagingCenter = [CPDistributedMessagingCenter centerNamed:@"com.understruction.openurl.notification"];
    [messagingCenter sendMessageAndReceiveReplyName:@"openurl" userInfo:userInfo];
    [pool release];
    return 1;
}