#import "AddListingNewFormViewController.h"
#import "CreateListingForm.h"

@implementation AddListingNewFormViewController {

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
  {
    //set up form
    self.formController.form = [[CreateListingForm alloc] init];
  }
  return self;
}


@end