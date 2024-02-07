/*
 * Generated by asn1c-0.9.28 (http://lionet.info/asn1c)
 * From ASN.1 module "Crypto-Conditions"
 * 	found in "CryptoConditions.asn"
 */

#ifndef	_Ed25519Sha512Fulfillment_H_
#define	_Ed25519Sha512Fulfillment_H_


#include "asn_application.h"

/* Including external dependencies */
#include <OCTET_STRING.h>
#include <constr_SEQUENCE.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Ed25519Sha512Fulfillment */
typedef struct Ed25519Sha512Fulfillment {
    OCTET_STRING_t	 publicKey;
    OCTET_STRING_t	 signature;

    /* Context for parsing across buffer boundaries */
    asn_struct_ctx_t _asn_ctx;
} Ed25519Sha512Fulfillment_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_Ed25519Sha512Fulfillment;

#ifdef __cplusplus
}
#endif

#endif	/* _Ed25519Sha512Fulfillment_H_ */
#include <asn_internal.h>
