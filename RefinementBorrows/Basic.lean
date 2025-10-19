-- Simple translation of STLC code from PLF


-- TODO: First pass at modelling a lifetime
-- In a lambda calculus numerical program points might not make much sense
structure Lifetime where
  start : Nat
  finish : Nat
  sound : start ≤ finish
  deriving Repr

inductive Ty : Type where
  | unit : Ty
  | bool : Ty
  | nat : Ty
  | string : Ty -- NOTE: Introducing this as a concrete example of a type that is not trivially copyable.
  | arrow : Ty → Ty → Ty
  | ref : Lifetime → Ty → Ty -- NOTE: First pass, will probably delete once I read RustBelt or Oxide more closely.
  | ref_mut : Lifetime → Ty → Ty
  deriving Repr

inductive Term : Type where
  | var : String → Term
  | abs : String → Ty → Term → Term
  | app : Term → Term → Term
  | true : Term
  | false : Term
  | nat_const : Nat → Term
  | string_const : String → Term
  | if_then_else : Term → Term → Term
  -- TODO: Define constructors for `ref`
  deriving Repr

inductive Value : Term → Prop where
  | abs : ∀ x T₂ t₁,
      Value (Term.abs x T₂ t₁)
  | true : Value Term.true
  | false : Value Term.false
  | nat_const : ∀ n,
      Value (Term.nat_const n)
  | string_const : ∀ s,
      Value (Term.string_const s)

def owned : Ty → Prop
  | Ty.ref _ _ => False
  | Ty.ref_mut _ _ => False
  | _ => True


