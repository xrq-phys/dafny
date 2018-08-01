// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

function method {:simplifier} simp<T>(t: T): T { t }

function method {:opaque} Foo(x: int): int
{
  42
}

lemma {:simp} Foo_42(x: int)
  ensures Foo(7) == 42
{
  reveal Foo();
}

lemma {:simp} proj0_simp<S, T>(x: S, y: T)
  ensures (x, y).0 == x
{
}

ghost method letTest() {
  assert simp(Foo(var (a, b) := (7, 8); a)) == 42;
}