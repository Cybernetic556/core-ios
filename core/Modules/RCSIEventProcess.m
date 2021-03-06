//
//  MyClass.m
//  RCSIphone
//
//  Created by kiodo on 02/03/12.
//  Copyright 2012 HT srl. All rights reserved.
//

#import "RCSIEventProcess.h"
#import "RCSICommon.h"

@implementation _i_EventProcess

@synthesize processName;

- (id)init
{
  self = [super init];
  if (self) 
    {
      eventType = EVENT_PROCESS;
    }
  
  return self;
}

- (void)dealloc
{
  [processName release];
  [super dealloc];
}

- (BOOL)readyToTriggerStart
{
  return findProcessWithName(processName);
}

- (BOOL)readyToTriggerEnd
{
  return !findProcessWithName(processName);
}

@end
