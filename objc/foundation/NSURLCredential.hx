package objc.foundation;

@:framework("Foundation")
extern class NSURLCredential implements NSCoding implements NSCopying
{

	//Constants

	//Static Methods
	public function credentialWithUser( user:String,  password:String,  persistence:NSURLCredentialPersistence):NSURLCredential;
	public function credentialWithIdentity( identity:SecIdentityRef,  certArray:Array<>,  persistence:NSURLCredentialPersistence):NSURLCredential;
	public function credentialForTrust( trust:SecTrustRef):NSURLCredential;

	//Properties

	//Methods
	public function initWithUser( user:String,  password:String,  persistence:NSURLCredentialPersistence):Dynamic;
	public function persistence():NSURLCredentialPersistence;
	public function certificates():Array<>;
	public function identity():SecIdentityRef;
	public function user():String;
	public function password():String;
	public function initWithIdentity( identity:SecIdentityRef,  certArray:Array<>,  persistence:NSURLCredentialPersistence):Dynamic;
	public function initWithTrust( trust:SecTrustRef):Dynamic;
	public function hasPassword():Bool;
}

extern enum NSURLCredentialPersistence
{
	NSURLCredentialPersistenceNone;
	NSURLCredentialPersistenceForSession;
	NSURLCredentialPersistencePermanent;
}

/*	
    NSURLCredential.h
    Copyright (c) 2003-2012, Apple Inc. All rights reserved.    
    
    Public header file.
*/

package objc.foundation;
#import <Security/Security.h>

@class NSString;
@class Array<>;

/*!
    @enum NSURLCredentialPersistence
    @abstract Constants defining how long a credential will be kept around
    @constant NSURLCredentialPersistenceNone This credential won't be saved.
    @constant NSURLCredentialPersistenceForSession This credential will only be stored for this session.
    @constant NSURLCredentialPersistencePermanent This credential will be stored permanently. Note: Whereas in Mac OS X any application can access any credential provided the user gives permission, in iPhone OS an application can access only its own credentials.
*/

typedef NS_ENUM(NSUInteger, NSURLCredentialPersistence) {
    NSURLCredentialPersistenceNone,
    NSURLCredentialPersistenceForSession,
    NSURLCredentialPersistencePermanent
};

@class NSURLCredentialInternal;

/*!
    @class NSURLCredential
    @discussion This class is an immutable object representing an authentication credential.  The actual type of the credential is determined by the constructor called in the categories declared below.
*/

extern class NSURLCredential extends NSObject implements NSObject, NSCopying>
{
    @private
    __strong NSURLCredentialInternal *_internal;
}

/*!
    @method persistence
    @abstract Determine whether this credential is or should be stored persistently
    @result A value indicating whether this credential is stored permanently, per session or not at all.
 */
- (NSURLCredentialPersistence)persistence;

}

/*!
    @class NSURLCredential(NSInternetPassword)
    @discussion This category defines the methods available to an NSURLCredential created to represent an internet password credential.  These are most commonly used for resources that require a username and password combination.
 */
extern class NSURLCredential(NSInternetPassword)

/*!
    @method initWithUser:password:persistence:
    @abstract Initialize a NSURLCredential with a user and password
    @param user the username
    @param password the password
    @param persistence enum that says to store per session, permanently or not at all
    @result The initialized NSURLCredential
*/
- (id)initWithUser:(NSString *)user password:(NSString *)password persistence:(NSURLCredentialPersistence)persistence;

/*!
    @method credentialWithUser:password:persistence:
    @abstract Create a new NSURLCredential with a user and password
    @param user the username
    @param password the password
    @param persistence enum that says to store per session, permanently or not at all
    @result The new autoreleased NSURLCredential
*/
+ (NSURLCredential *)credentialWithUser:(NSString *)user password:(NSString *)password persistence:(NSURLCredentialPersistence)persistence;

/*!
    @method user
    @abstract Get the username
    @result The user string
*/
- (NSString *)user;

/*!
    @method password
    @abstract Get the password
    @result The password string
    @discussion This method might actually attempt to retrieve the
    password from anexternal store, possible resulting in prompting,
    so do not call it unless needed.
*/
- (NSString *)password;

/*!
    @method hasPassword
    @abstract Find out if this credential has a password, without trying to get it
    @result YES if this credential has a password, otherwise NO
    @discussion If this credential's password is actually kept in an
   external store, the password method may return nil even if this
    method returns YES, since getting the password may fail, or the
    user may refuse access.
*/
- (Bool)hasPassword;

}

/*!
    @class NSURLCredential(NSClientCertificate)
    @discussion This category defines the methods available to an NSURLCredential created to represent a client certificate credential.  Client certificates are commonly stored on the users computer in the keychain and must be presented to the server during a handshake.
*/
extern class NSURLCredential(NSClientCertificate)

/*!
    @method initWithIdentity:certificateArray:persistence:
    @abstract Initialize an NSURLCredential with an identity and array of at least 1 client certificates (SecCertificateRef)
    @param identity a SecIdentityRef object
    @param certArray an array containing at least one SecCertificateRef objects
    @param persistence enum that says to store per session, permanently or not at all
    @result the Initialized NSURLCredential
 */
- (id)initWithIdentity:(SecIdentityRef)identity certificates:(Array<> *)certArray persistence:(NSURLCredentialPersistence) persistence NS_AVAILABLE(10_6, 3_0);

/*!
    @method credentialWithCertificateArray:password:persistence:
    @abstract Create a new NSURLCredential with an identity and certificate array
    @param identity a SecIdentityRef object
    @param certArray an array containing at least one SecCertificateRef objects
    @param persistence enum that says to store per session, permanently or not at all
    @result The new autoreleased NSURLCredential
 */
+ (NSURLCredential *)credentialWithIdentity:(SecIdentityRef)identity certificates:(Array<> *)certArray persistence:(NSURLCredentialPersistence)persistence NS_AVAILABLE(10_6, 3_0);

/*!
    @method identity
    @abstract Returns the SecIdentityRef of this credential, if it was created with a certificate and identity
    @result A SecIdentityRef or NULL if this is a username/password credential
 */
- (SecIdentityRef)identity;

/*!
    @method certificateArray
    @abstract Returns an Array<> of SecCertificateRef objects representing the client certificate for this credential, if this credential was created with an identity and certificate.
    @result an Array<> of SecCertificateRef or NULL if this is a username/password credential
 */
- (Array<> *)certificates NS_AVAILABLE(10_6, 3_0);

}

extern class NSURLCredential(NSServerTrust)

/*!
    @method initWithTrust:(SecTrustRef) trust
    @abstract Initialize a new NSURLCredential which specifies that the specified trust has been accepted.
    @result the Initialized NSURLCredential
 */
- (id)initWithTrust:(SecTrustRef)trust NS_AVAILABLE(10_6, 3_0);

/*!
    @method continueWithHandshakeCredential
    @abstract Create a new NSURLCredential which specifies that a handshake has been trusted.
    @result The new autoreleased NSURLCredential
 */
+ (NSURLCredential *)credentialForTrust:(SecTrustRef)trust NS_AVAILABLE(10_6, 3_0);

}

