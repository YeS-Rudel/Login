//
//  SignUpViewController.m
//  NewLogin
//
//  Created by Evgeny Knyazev on 29.03.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import "SignUpViewController.h"
#import "RegistratedPersons.h"

@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *registrationLoginTextField;
@property (weak, nonatomic) IBOutlet UITextField *registrationPasswordTextField;
@property (weak, nonatomic) IBOutlet UITextField *registrationCheckPasswordTextField;
@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)nextButtonPressed:(UIButton *)sender {
    if (![self.registrationLoginTextField.text isEqualToString:@""]){
        if(![self.registrationPasswordTextField.text isEqualToString:@""]&&[self.registrationPasswordTextField.text isEqualToString:self.registrationCheckPasswordTextField.text]){
            NSString *message = [NSString stringWithFormat:@"Ваш логин:%@ \n Пароль:%@",self.registrationLoginTextField.text ,self.registrationPasswordTextField.text];
            [self showAlertWithTitle:@"Спасибо за регистрацию!" andMassage:message actionTitle:@"OK"];
        }else{
            [self showAlertWithTitle:@"Не корректный ввод!" andMassage:@"Пароль должен совподать и быть не пустым!" actionTitle:@"Закрыть"];
        }
    }else{
        [self showAlertWithTitle:@"Не корректный ввод!" andMassage:@"Логин должен быть не пустым!" actionTitle:@"Закрыть"];
    }
}
- (void) showAlertWithTitle:(NSString*)title andMassage:(NSString*)message actionTitle:(NSString*)actionTitle {
    
    UIAlertController *allertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAktion = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action){
        
        
        if (![title isEqualToString:@"Не корректный ввод!"]){
            
            
            [[RegistratedPersons alloc] registrationNewLogin:self.registrationLoginTextField.text andPassword:self.registrationPasswordTextField.text];
            
            
            UIStoryboard *sb =[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];

            UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"Main"];

         [self.navigationController pushViewController:vc animated:YES];
        }
        
    }];
    [allertController addAction:okAktion];
    [self presentViewController:allertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
