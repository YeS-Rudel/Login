//
//  ViewController.m
//  NewLogin
//
//  Created by Evgeny Knyazev on 26.03.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import "ViewController.h"
#import "HelloViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UIButton *facebookButton;

@property (weak,nonatomic) IBOutlet UIButton *googleLoginButton;
@property (weak,nonatomic) IBOutlet UITextField *loginTextField;
@property (weak,nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedController;






@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)forgoPasswordPressed:(UIButton *)sender {
    
//    BOOL nowIsHidden = self.facebookButton.isHidden;
//    BOOL willBeHidden = !nowIsHidden; // меняем бул значение на обратное
//
    
    [self.facebookButton setHidden:!self.facebookButton.isHidden];
    self.facebookButton.tintColor = [UIColor redColor];
}
- (IBAction)googlePressed:(UIButton *)sender {
}

- (IBAction)nextButtonPressed:(UIButton *)sender {
    
    
    NSString *login = @"myname";
    NSString *password = @"mypass";
    
    if ([self.loginTextField.text isEqualToString:login]&&[self.passwordTextField.text isEqualToString:password]){
            NSString *message = [NSString stringWithFormat:@"Ваш логин - %@", self.loginTextField.text];
            
            [self showAlertWithTitle:@"Приветствие" andMassage:message actionTitle:@"Войти"];
            
        } else{
            [self showAlertWithTitle:@"Ошибка" andMassage:@"Неверный логин или пароль" actionTitle:@"Закрыть"];
        }
        
    }


- (void) showAlertWithTitle:(NSString*)title andMassage:(NSString*)message actionTitle:(NSString*)actionTitle {
    
    UIAlertController *allertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAktion = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){
        
        
        if (![title isEqualToString:@"Ошибка"]){
        
        UIStoryboard *sb =[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        
        HelloViewController *vc = [sb instantiateViewControllerWithIdentifier:@"HelloSBID"];
        
        [self.navigationController pushViewController:vc animated:YES];
        }
        
        
    }];
    
    [allertController addAction:okAktion];
    
    [self presentViewController:allertController animated:YES completion:nil];
    
}

- (IBAction)segmentedControllerValueChange:(UISegmentedControl *)sender {
}


@end
