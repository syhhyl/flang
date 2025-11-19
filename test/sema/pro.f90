module m1
interface
  function if()
  end function
end interface
contains
subroutine s1(p1,d1,p2,d2,k1,k2)
procedure(if)::d1,d2
procedure(if),pointer::p1,p2
optional p2,d2
end subroutine
end

subroutine xx
use m1
procedure(if)::d1,d2
procedure(if),pointer::p1,p2
p1=>if
p2=>if
call s1(p1,d1,p2,d2,k1=1,k2=1)
nullify(p1,p2)
end

call xx
print *,'pass'
end

function if()
  entry d1()
  entry d2()
  integer d1,d2
  if=1
end function
