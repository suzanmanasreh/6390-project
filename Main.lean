import RefinementBorrows

-- (λx : bool. λy : bool → string. (y x))
def test_term :=
  Term.abs "x" Ty.bool (Term.abs "y" (Ty.arrow Ty.bool Ty.string) (Term.app (Term.var "y") (Term.var "x")))

def main : IO Unit := do
  IO.println "Hello, Sailor!"
  IO.println (repr test_term)
