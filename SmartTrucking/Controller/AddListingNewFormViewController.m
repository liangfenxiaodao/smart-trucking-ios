#import "AddListingNewFormViewController.h"
#import "AddListingForm.h"

@implementation AddListingNewFormViewController {

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
  {
    //set up form
    self.formController.form = [[AddListingForm alloc] init];
    [self.navigationItem setTitle:@"Add Listing"];
  }
  return self;
}


@end