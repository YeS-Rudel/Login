//
//  RegistratedPersons.m
//  NewLogin
//
//  Created by Evgeny Knyazev on 29.03.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import "RegistratedPersons.h"

@implementation RegistratedPersons

- (NSMutableDictionary*) registrationNewLogin:(NSString*)loginPerson andPassword:(NSString*)passwordPerson{
        NSMutableDictionary *cardOfLogin = [NSMutableDictionary dictionaryWithObjectsAndKeys:loginPerson, @"e-mail", passwordPerson, @"Password", nil];

    NSLog(@"%@",cardOfLogin);
    
        return cardOfLogin;
    
}

@end
