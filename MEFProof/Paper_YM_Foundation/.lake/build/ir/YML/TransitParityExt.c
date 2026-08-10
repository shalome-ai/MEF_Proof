// Lean compiler output
// Module: YML.TransitParityExt
// Imports: public import Init public import Mathlib.Algebra.Ring.Parity public import Mathlib.Algebra.Ring.Int.Parity public import Mathlib.Analysis.SpecialFunctions.Trigonometric.Basic
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
lean_object* lean_nat_to_int(lean_object*);
static lean_once_cell_t lp_YM__cleanroom_TransitParityExt_gmul___closed__0_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_YM__cleanroom_TransitParityExt_gmul___closed__0;
lean_object* lean_int_mul(lean_object*, lean_object*);
lean_object* lean_int_add(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_YM__cleanroom_TransitParityExt_gmul(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_YM__cleanroom_TransitParityExt_gmul___boxed(lean_object*, lean_object*);
static lean_once_cell_t lp_YM__cleanroom_TransitParityExt_chi___closed__0_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_YM__cleanroom_TransitParityExt_chi___closed__0;
lean_object* lean_int_neg(lean_object*);
static lean_once_cell_t lp_YM__cleanroom_TransitParityExt_chi___closed__1_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_YM__cleanroom_TransitParityExt_chi___closed__1;
uint8_t lp_mathlib_Int_instDecidablePredEven(lean_object*);
LEAN_EXPORT lean_object* lp_YM__cleanroom_TransitParityExt_chi(lean_object*);
LEAN_EXPORT lean_object* lp_YM__cleanroom_TransitParityExt_chi___boxed(lean_object*);
static lean_once_cell_t lp_YM__cleanroom_TransitParityExt_gamma12___closed__0_once = LEAN_ONCE_CELL_INITIALIZER;
static lean_object* lp_YM__cleanroom_TransitParityExt_gamma12___closed__0;
LEAN_EXPORT lean_object* lp_YM__cleanroom_TransitParityExt_gamma12;
static lean_object* _init_lp_YM__cleanroom_TransitParityExt_gmul___closed__0(void) {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(2u);
x_2 = lean_nat_to_int(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* lp_YM__cleanroom_TransitParityExt_gmul(lean_object* x_1, lean_object* x_2) {
_start:
{
uint8_t x_3; 
x_3 = !lean_is_exclusive(x_2);
if (x_3 == 0)
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; lean_object* x_12; lean_object* x_13; lean_object* x_14; lean_object* x_15; lean_object* x_16; lean_object* x_17; lean_object* x_18; lean_object* x_19; lean_object* x_20; lean_object* x_21; lean_object* x_22; lean_object* x_23; lean_object* x_24; lean_object* x_25; lean_object* x_26; 
x_4 = lean_ctor_get(x_1, 0);
x_5 = lean_ctor_get(x_1, 1);
x_6 = lean_ctor_get(x_1, 2);
x_7 = lean_ctor_get(x_1, 3);
x_8 = lean_ctor_get(x_2, 0);
x_9 = lean_ctor_get(x_2, 1);
x_10 = lean_ctor_get(x_2, 2);
x_11 = lean_ctor_get(x_2, 3);
x_12 = lean_int_mul(x_4, x_8);
x_13 = lean_obj_once(&lp_YM__cleanroom_TransitParityExt_gmul___closed__0, &lp_YM__cleanroom_TransitParityExt_gmul___closed__0_once, _init_lp_YM__cleanroom_TransitParityExt_gmul___closed__0);
x_14 = lean_int_mul(x_13, x_10);
x_15 = lean_int_mul(x_5, x_14);
lean_dec(x_14);
x_16 = lean_int_add(x_12, x_15);
lean_dec(x_15);
lean_dec(x_12);
x_17 = lean_int_mul(x_4, x_9);
x_18 = lean_int_mul(x_5, x_11);
x_19 = lean_int_add(x_17, x_18);
lean_dec(x_18);
lean_dec(x_17);
x_20 = lean_int_mul(x_6, x_8);
lean_dec(x_8);
x_21 = lean_int_mul(x_7, x_10);
lean_dec(x_10);
x_22 = lean_int_add(x_20, x_21);
lean_dec(x_21);
lean_dec(x_20);
x_23 = lean_int_mul(x_13, x_6);
x_24 = lean_int_mul(x_23, x_9);
lean_dec(x_9);
lean_dec(x_23);
x_25 = lean_int_mul(x_7, x_11);
lean_dec(x_11);
x_26 = lean_int_add(x_24, x_25);
lean_dec(x_25);
lean_dec(x_24);
lean_ctor_set(x_2, 3, x_26);
lean_ctor_set(x_2, 2, x_22);
lean_ctor_set(x_2, 1, x_19);
lean_ctor_set(x_2, 0, x_16);
return x_2;
}
else
{
lean_object* x_27; lean_object* x_28; lean_object* x_29; lean_object* x_30; lean_object* x_31; lean_object* x_32; lean_object* x_33; lean_object* x_34; lean_object* x_35; lean_object* x_36; lean_object* x_37; lean_object* x_38; lean_object* x_39; lean_object* x_40; lean_object* x_41; lean_object* x_42; lean_object* x_43; lean_object* x_44; lean_object* x_45; lean_object* x_46; lean_object* x_47; lean_object* x_48; lean_object* x_49; lean_object* x_50; 
x_27 = lean_ctor_get(x_1, 0);
x_28 = lean_ctor_get(x_1, 1);
x_29 = lean_ctor_get(x_1, 2);
x_30 = lean_ctor_get(x_1, 3);
x_31 = lean_ctor_get(x_2, 0);
x_32 = lean_ctor_get(x_2, 1);
x_33 = lean_ctor_get(x_2, 2);
x_34 = lean_ctor_get(x_2, 3);
lean_inc(x_34);
lean_inc(x_33);
lean_inc(x_32);
lean_inc(x_31);
lean_dec(x_2);
x_35 = lean_int_mul(x_27, x_31);
x_36 = lean_obj_once(&lp_YM__cleanroom_TransitParityExt_gmul___closed__0, &lp_YM__cleanroom_TransitParityExt_gmul___closed__0_once, _init_lp_YM__cleanroom_TransitParityExt_gmul___closed__0);
x_37 = lean_int_mul(x_36, x_33);
x_38 = lean_int_mul(x_28, x_37);
lean_dec(x_37);
x_39 = lean_int_add(x_35, x_38);
lean_dec(x_38);
lean_dec(x_35);
x_40 = lean_int_mul(x_27, x_32);
x_41 = lean_int_mul(x_28, x_34);
x_42 = lean_int_add(x_40, x_41);
lean_dec(x_41);
lean_dec(x_40);
x_43 = lean_int_mul(x_29, x_31);
lean_dec(x_31);
x_44 = lean_int_mul(x_30, x_33);
lean_dec(x_33);
x_45 = lean_int_add(x_43, x_44);
lean_dec(x_44);
lean_dec(x_43);
x_46 = lean_int_mul(x_36, x_29);
x_47 = lean_int_mul(x_46, x_32);
lean_dec(x_32);
lean_dec(x_46);
x_48 = lean_int_mul(x_30, x_34);
lean_dec(x_34);
x_49 = lean_int_add(x_47, x_48);
lean_dec(x_48);
lean_dec(x_47);
x_50 = lean_alloc_ctor(0, 4, 0);
lean_ctor_set(x_50, 0, x_39);
lean_ctor_set(x_50, 1, x_42);
lean_ctor_set(x_50, 2, x_45);
lean_ctor_set(x_50, 3, x_49);
return x_50;
}
}
}
LEAN_EXPORT lean_object* lp_YM__cleanroom_TransitParityExt_gmul___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lp_YM__cleanroom_TransitParityExt_gmul(x_1, x_2);
lean_dec_ref(x_1);
return x_3;
}
}
static lean_object* _init_lp_YM__cleanroom_TransitParityExt_chi___closed__0(void) {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_unsigned_to_nat(1u);
x_2 = lean_nat_to_int(x_1);
return x_2;
}
}
static lean_object* _init_lp_YM__cleanroom_TransitParityExt_chi___closed__1(void) {
_start:
{
lean_object* x_1; lean_object* x_2; 
x_1 = lean_obj_once(&lp_YM__cleanroom_TransitParityExt_chi___closed__0, &lp_YM__cleanroom_TransitParityExt_chi___closed__0_once, _init_lp_YM__cleanroom_TransitParityExt_chi___closed__0);
x_2 = lean_int_neg(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* lp_YM__cleanroom_TransitParityExt_chi(lean_object* x_1) {
_start:
{
lean_object* x_2; uint8_t x_3; 
x_2 = lean_ctor_get(x_1, 2);
x_3 = lp_mathlib_Int_instDecidablePredEven(x_2);
if (x_3 == 0)
{
lean_object* x_4; 
x_4 = lean_obj_once(&lp_YM__cleanroom_TransitParityExt_chi___closed__1, &lp_YM__cleanroom_TransitParityExt_chi___closed__1_once, _init_lp_YM__cleanroom_TransitParityExt_chi___closed__1);
return x_4;
}
else
{
lean_object* x_5; 
x_5 = lean_obj_once(&lp_YM__cleanroom_TransitParityExt_chi___closed__0, &lp_YM__cleanroom_TransitParityExt_chi___closed__0_once, _init_lp_YM__cleanroom_TransitParityExt_chi___closed__0);
return x_5;
}
}
}
LEAN_EXPORT lean_object* lp_YM__cleanroom_TransitParityExt_chi___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lp_YM__cleanroom_TransitParityExt_chi(x_1);
lean_dec_ref(x_1);
return x_2;
}
}
static lean_object* _init_lp_YM__cleanroom_TransitParityExt_gamma12___closed__0(void) {
_start:
{
lean_object* x_1; lean_object* x_2; lean_object* x_3; 
x_1 = lean_obj_once(&lp_YM__cleanroom_TransitParityExt_chi___closed__1, &lp_YM__cleanroom_TransitParityExt_chi___closed__1_once, _init_lp_YM__cleanroom_TransitParityExt_chi___closed__1);
x_2 = lean_obj_once(&lp_YM__cleanroom_TransitParityExt_chi___closed__0, &lp_YM__cleanroom_TransitParityExt_chi___closed__0_once, _init_lp_YM__cleanroom_TransitParityExt_chi___closed__0);
x_3 = lean_alloc_ctor(0, 4, 0);
lean_ctor_set(x_3, 0, x_2);
lean_ctor_set(x_3, 1, x_1);
lean_ctor_set(x_3, 2, x_2);
lean_ctor_set(x_3, 3, x_1);
return x_3;
}
}
static lean_object* _init_lp_YM__cleanroom_TransitParityExt_gamma12(void) {
_start:
{
lean_object* x_1; 
x_1 = lean_obj_once(&lp_YM__cleanroom_TransitParityExt_gamma12___closed__0, &lp_YM__cleanroom_TransitParityExt_gamma12___closed__0_once, _init_lp_YM__cleanroom_TransitParityExt_gamma12___closed__0);
return x_1;
}
}
lean_object* initialize_Init(uint8_t builtin);
lean_object* initialize_mathlib_Mathlib_Algebra_Ring_Parity(uint8_t builtin);
lean_object* initialize_mathlib_Mathlib_Algebra_Ring_Int_Parity(uint8_t builtin);
lean_object* initialize_mathlib_Mathlib_Analysis_SpecialFunctions_Trigonometric_Basic(uint8_t builtin);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_YM__cleanroom_YML_TransitParityExt(uint8_t builtin) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_mathlib_Mathlib_Algebra_Ring_Parity(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_mathlib_Mathlib_Algebra_Ring_Int_Parity(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_mathlib_Mathlib_Analysis_SpecialFunctions_Trigonometric_Basic(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
lp_YM__cleanroom_TransitParityExt_gamma12 = _init_lp_YM__cleanroom_TransitParityExt_gamma12();
lean_mark_persistent(lp_YM__cleanroom_TransitParityExt_gamma12);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
