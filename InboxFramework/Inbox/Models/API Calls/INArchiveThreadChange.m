//
//  INArchiveThreadChange.m
//  InboxFramework
//
//  Created by Ben Gotow on 5/20/14.
//  Copyright (c) 2014 Inbox. All rights reserved.
//

#import "INArchiveThreadChange.h"
#import "INUnarchiveThreadChange.h"
#import "INTag.h"

@implementation INArchiveThreadChange

- (id)initWithModel:(INModelObject *)model
{
    self = [super initWithModel: model];
    if (self) {
        [[self tagIDsToRemove] addObject: INTagIDInbox];
        [[self tagIDsToAdd] addObject: INTagIDArchive];
    }
    return self;
}


- (BOOL)canCancelPendingChange:(INModelChange*)other
{
    if ([[other model] isEqual: self.model] && [other isKindOfClass: [INArchiveThreadChange class]])
        return YES;
    if ([[other model] isEqual: self.model] && [other isKindOfClass: [INUnarchiveThreadChange class]])
        return YES;
    return NO;
}

@end