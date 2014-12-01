//
//  BNDConcreteViewSpec.m
//  BIND
//
//  Created by Marko Hlebar on 30/11/2014.
//  Copyright 2014 Marko Hlebar. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "BNDConcreteView.h"
#import "BNDBinding.h"
#import "BNDViewModel.h"

@interface ViewModel : NSObject <BNDViewModel>
@property (nonatomic, strong) NSString *text;
@end

@implementation ViewModel
@end

@interface TableViewCell : BNDTableViewCell
- (void)unbind;
@end

@implementation TableViewCell

- (void)unbind {
    for (BNDBinding *binding in self.bindings) {
        [binding unbind];
    }
}

@end

SPEC_BEGIN(BNDConcreteViewSpec)

describe(@"BNDTableViewCell", ^{
    
    __block TableViewCell *cell = nil;
    __block BNDBinding *binding = nil;
    beforeEach(^{
        cell = [[TableViewCell alloc] init];
        binding = [BNDBinding bindingWithBIND:@"viewModel.text -> textLabel.text"];
        cell.bindings = @[binding];
    });
    
    context(@"when using a BNDTableViewCell", ^{
        it(@"should bind on view model update", ^{
            ViewModel *viewModel = [ViewModel new];
            cell.viewModel = viewModel;
            
//            [cell unbind];
            cell = nil;
        });
    });
});

SPEC_END