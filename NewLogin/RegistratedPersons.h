//
//  RegistratedPersons.h
//  NewLogin
//
//  Created by Evgeny Knyazev on 29.03.2018.
//  Copyright © 2018 home. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegistratedPersons : NSObject
@property(strong,nonatomic) NSMutableDictionary* cardOfLogin;





- (NSMutableDictionary*) registrationNewLogin:(NSString*)loginPerson andPassword:(NSString*)passwordPerson;


@end