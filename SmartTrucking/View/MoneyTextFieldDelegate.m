#import "MoneyTextFieldDelegate.h"


@implementation MoneyTextFieldDelegate {

}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
  NSString *fullCandidateString = [textField.text stringByReplacingCharactersInRange:range withString:string];
  return [fullCandidateString digitsNoMoreThan:2];
}

@end