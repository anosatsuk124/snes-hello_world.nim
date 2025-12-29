#ifndef NIMBASE_TCC_HELPER_H
#define NIMBASE_TCC_HELPER_H

/* Provide stdint-like typedefs for the 65c816 tcc toolchain. */
#if defined(__TINYC__)
#if !defined(__LONG_LONG_MAX__)
#define __INT64_TYPE__ signed long int
#define __UINT64_TYPE__ unsigned long int
#endif
#ifndef INT8_MAX
typedef signed char int8_t;
#endif
#ifndef UINT8_MAX
typedef unsigned char uint8_t;
#endif
#ifndef INT16_MAX
typedef signed short int int16_t;
#endif
#ifndef UINT16_MAX
typedef unsigned short int uint16_t;
#endif
#ifndef INT32_MAX
typedef signed int int32_t;
#endif
#ifndef UINT32_MAX
typedef unsigned int uint32_t;
#endif
#ifndef INT64_MAX
typedef signed long int int64_t;
#endif
#ifndef UINT64_MAX
typedef unsigned long int uint64_t;
#endif
#endif /* __TINYC__ */

#endif /* NIMBASE_TCC_HELPER_H */
