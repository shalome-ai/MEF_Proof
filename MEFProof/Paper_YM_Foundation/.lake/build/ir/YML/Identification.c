// Lean compiler output
// Module: YML.Identification
// Imports: public import Init public import Mathlib.NumberTheory.Divisors public import Mathlib.Analysis.SpecialFunctions.Pow.Real
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
lean_object* l_List_reverse___redArg(lean_object*);
uint8_t lp_mathlib_Nat_instDecidablePredOdd(lean_object*);
LEAN_EXPORT lean_object* lp_YM__cleanroom_List_filterTR_loop___at___00Multiset_filter___at___00Finset_filter___at___00Identification_dodd_spec__0_spec__0_spec__1(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_YM__cleanroom_Multiset_filter___at___00Finset_filter___at___00Identification_dodd_spec__0_spec__0___redArg(lean_object*);
lean_object* lp_mathlib_Nat_divisors(lean_object*);
lean_object* l_List_lengthTR___redArg(lean_object*);
LEAN_EXPORT lean_object* lp_YM__cleanroom_Identification_dodd(lean_object*);
LEAN_EXPORT lean_object* lp_YM__cleanroom_Finset_filter___at___00Identification_dodd_spec__0___redArg(lean_object*);
LEAN_EXPORT lean_object* lp_YM__cleanroom_Finset_filter___at___00Identification_dodd_spec__0(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_YM__cleanroom_Multiset_filter___at___00Finset_filter___at___00Identification_dodd_spec__0_spec__0(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_YM__cleanroom_List_filterTR_loop___at___00Multiset_filter___at___00Finset_filter___at___00Identification_dodd_spec__0_spec__0_spec__1(lean_object* x_1, lean_object* x_2) {
_start:
{
if (lean_obj_tag(x_1) == 0)
{
lean_object* x_3; 
x_3 = l_List_reverse___redArg(x_2);
return x_3;
}
else
{
uint8_t x_4; 
x_4 = !lean_is_exclusive(x_1);
if (x_4 == 0)
{
lean_object* x_5; lean_object* x_6; uint8_t x_7; 
x_5 = lean_ctor_get(x_1, 0);
x_6 = lean_ctor_get(x_1, 1);
x_7 = lp_mathlib_Nat_instDecidablePredOdd(x_5);
if (x_7 == 0)
{
lean_free_object(x_1);
lean_dec(x_5);
x_1 = x_6;
goto _start;
}
else
{
lean_ctor_set(x_1, 1, x_2);
{
lean_object* _tmp_0 = x_6;
lean_object* _tmp_1 = x_1;
x_1 = _tmp_0;
x_2 = _tmp_1;
}
goto _start;
}
}
else
{
lean_object* x_10; lean_object* x_11; uint8_t x_12; 
x_10 = lean_ctor_get(x_1, 0);
x_11 = lean_ctor_get(x_1, 1);
lean_inc(x_11);
lean_inc(x_10);
lean_dec(x_1);
x_12 = lp_mathlib_Nat_instDecidablePredOdd(x_10);
if (x_12 == 0)
{
lean_dec(x_10);
x_1 = x_11;
goto _start;
}
else
{
lean_object* x_14; 
x_14 = lean_alloc_ctor(1, 2, 0);
lean_ctor_set(x_14, 0, x_10);
lean_ctor_set(x_14, 1, x_2);
x_1 = x_11;
x_2 = x_14;
goto _start;
}
}
}
}
}
LEAN_EXPORT lean_object* lp_YM__cleanroom_Multiset_filter___at___00Finset_filter___at___00Identification_dodd_spec__0_spec__0___redArg(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; 
x_2 = lean_box(0);
x_3 = lp_YM__cleanroom_List_filterTR_loop___at___00Multiset_filter___at___00Finset_filter___at___00Identification_dodd_spec__0_spec__0_spec__1(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_YM__cleanroom_Identification_dodd(lean_object* x_1) {
_start:
{
lean_object* x_2; lean_object* x_3; lean_object* x_4; 
x_2 = lp_mathlib_Nat_divisors(x_1);
x_3 = lp_YM__cleanroom_Multiset_filter___at___00Finset_filter___at___00Identification_dodd_spec__0_spec__0___redArg(x_2);
x_4 = l_List_lengthTR___redArg(x_3);
lean_dec(x_3);
return x_4;
}
}
LEAN_EXPORT lean_object* lp_YM__cleanroom_Finset_filter___at___00Identification_dodd_spec__0___redArg(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lp_YM__cleanroom_Multiset_filter___at___00Finset_filter___at___00Identification_dodd_spec__0_spec__0___redArg(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* lp_YM__cleanroom_Finset_filter___at___00Identification_dodd_spec__0(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lp_YM__cleanroom_Multiset_filter___at___00Finset_filter___at___00Identification_dodd_spec__0_spec__0___redArg(x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* lp_YM__cleanroom_Multiset_filter___at___00Finset_filter___at___00Identification_dodd_spec__0_spec__0(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lp_YM__cleanroom_Multiset_filter___at___00Finset_filter___at___00Identification_dodd_spec__0_spec__0___redArg(x_2);
return x_3;
}
}
lean_object* initialize_Init(uint8_t builtin);
lean_object* initialize_mathlib_Mathlib_NumberTheory_Divisors(uint8_t builtin);
lean_object* initialize_mathlib_Mathlib_Analysis_SpecialFunctions_Pow_Real(uint8_t builtin);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_YM__cleanroom_YML_Identification(uint8_t builtin) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_mathlib_Mathlib_NumberTheory_Divisors(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_mathlib_Mathlib_Analysis_SpecialFunctions_Pow_Real(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
