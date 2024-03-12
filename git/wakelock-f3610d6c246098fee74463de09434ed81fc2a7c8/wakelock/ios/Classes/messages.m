// Autogenerated from Pigeon (v1.0.2), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "messages.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary<NSString *, id> *wrapResult(id result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = @{
        @"code": (error.code ? error.code : [NSNull null]),
        @"message": (error.message ? error.message : [NSNull null]),
        @"details": (error.details ? error.details : [NSNull null]),
        };
  }
  return @{
      @"result": (result ? result : [NSNull null]),
      @"error": errorDict,
      };
}

@interface FLTToggleMessage ()
+ (FLTToggleMessage *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end
@interface FLTIsEnabledMessage ()
+ (FLTIsEnabledMessage *)fromMap:(NSDictionary *)dict;
- (NSDictionary *)toMap;
@end

@implementation FLTToggleMessage
+ (FLTToggleMessage *)fromMap:(NSDictionary *)dict {
  FLTToggleMessage *result = [[FLTToggleMessage alloc] init];
  result.enable = dict[@"enable"];
  if ((NSNull *)result.enable == [NSNull null]) {
    result.enable = nil;
  }
  return result;
}
- (NSDictionary *)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.enable ? self.enable : [NSNull null]), @"enable", nil];
}
@end

@implementation FLTIsEnabledMessage
+ (FLTIsEnabledMessage *)fromMap:(NSDictionary *)dict {
  FLTIsEnabledMessage *result = [[FLTIsEnabledMessage alloc] init];
  result.enabled = dict[@"enabled"];
  if ((NSNull *)result.enabled == [NSNull null]) {
    result.enabled = nil;
  }
  return result;
}
- (NSDictionary *)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.enabled ? self.enabled : [NSNull null]), @"enabled", nil];
}
@end

@interface FLTWakelockApiCodecReader : FlutterStandardReader
@end
@implementation FLTWakelockApiCodecReader
- (nullable id)readValueOfType:(UInt8)type 
{
  switch (type) {
    case 128:     
      return [FLTIsEnabledMessage fromMap:[self readValue]];
    
    case 129:     
      return [FLTToggleMessage fromMap:[self readValue]];
    
    default:    
      return [super readValueOfType:type];
    
  }
}
@end

@interface FLTWakelockApiCodecWriter : FlutterStandardWriter
@end
@implementation FLTWakelockApiCodecWriter
- (void)writeValue:(id)value 
{
  if ([value isKindOfClass:[FLTIsEnabledMessage class]]) {
    [self writeByte:128];
    [self writeValue:[value toMap]];
  } else 
  if ([value isKindOfClass:[FLTToggleMessage class]]) {
    [self writeByte:129];
    [self writeValue:[value toMap]];
  } else 
{
    [super writeValue:value];
  }
}
@end

@interface FLTWakelockApiCodecReaderWriter : FlutterStandardReaderWriter
@end
@implementation FLTWakelockApiCodecReaderWriter
- (FlutterStandardWriter *)writerWithData:(NSMutableData *)data {
  return [[FLTWakelockApiCodecWriter alloc] initWithData:data];
}
- (FlutterStandardReader *)readerWithData:(NSData *)data {
  return [[FLTWakelockApiCodecReader alloc] initWithData:data];
}
@end

NSObject<FlutterMessageCodec> *FLTWakelockApiGetCodec() {
  static dispatch_once_t s_pred = 0;
  static FlutterStandardMessageCodec *s_sharedObject = nil;
  dispatch_once(&s_pred, ^{
    FLTWakelockApiCodecReaderWriter *readerWriter = [[FLTWakelockApiCodecReaderWriter alloc] init];
    s_sharedObject = [FlutterStandardMessageCodec codecWithReaderWriter:readerWriter];
  });
  return s_sharedObject;
}


void FLTWakelockApiSetup(id<FlutterBinaryMessenger> binaryMessenger, NSObject<FLTWakelockApi> *api) {
  {
    FlutterBasicMessageChannel *channel =
      [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.WakelockApi.toggle"
        binaryMessenger:binaryMessenger
        codec:FLTWakelockApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(toggleMsg:error:)], @"FLTWakelockApi api doesn't respond to @selector(toggleMsg:error:)");
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        NSArray *args = message;
        FLTToggleMessage *arg_msg = args[0];
        FlutterError *error;
        [api toggleMsg:arg_msg error:&error];
        callback(wrapResult(nil, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
  {
    FlutterBasicMessageChannel *channel =
      [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.WakelockApi.isEnabled"
        binaryMessenger:binaryMessenger
        codec:FLTWakelockApiGetCodec()];
    if (api) {
      NSCAssert([api respondsToSelector:@selector(isEnabledWithError:)], @"FLTWakelockApi api doesn't respond to @selector(isEnabledWithError:)");
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        FLTIsEnabledMessage *output = [api isEnabledWithError:&error];
        callback(wrapResult(output, error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}