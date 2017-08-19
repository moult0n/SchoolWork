program pb1
implicit none
integer, parameter :: N = 20-1
real, parameter :: pi = 3.141592653589793
real, parameter :: c = 10., k = 9., a = 0., b = 1., omega = 8*pi
integer, parameter :: itmax = 200
real, parameter :: tol = 1e-6
real :: u(N),y(N),dx,e(0:itmax),x(N+2),xi(N),f(N)
type sparse
	integer, allocatable, dimension(:) :: col_ind,row_ind
	real, allocatable, dimension(:) :: val
end type
type(sparse) :: S
integer :: M,i,j(3)

dx = 1.0/(N+1)
x = (/(i*dx,i=0,N+1)/)
xi = x(2:N+1)
f = rhs(xi,omega)
M = 3*N-2 ! storage for tridiagonal matrix
call allocate_sparse(M,S)
S%val((/1,2/)) = (/-2,1/)/dx**2+c*(/0,1/)/(2*dx)+k*(/1,0/)
S%row_ind((/1,2/)) = (/1,1/)
S%col_ind((/1,2/)) = (/1,2/)
f(1) = f(1)-a*(1/dx**2-c/(2*dx))
do i=2,N-1
	j = 3*i-(/3,2,1/)
	S%val(j) = (/1,-2,1/)/dx**2+c*(/-1,0,1/)/(2*dx)+k*(/0,1,0/)
	S%row_ind(j) = (/i,i,i/)
	S%col_ind(j) = (/i-1,i,i+1/)
end do
S%val(3*N-(/3,2/)) = (/1,-2/)/dx**2+c*(/-1,0/)/(2*dx)+k*(/0,1/)
S%row_ind(3*N-(/3,2/)) = (/N,N/)
S%col_ind(3*N-(/3,2/)) = (/N-1,N/)
f(N) = f(N)-b*(1/dx**2+c/(2*dx))

u = 0.0
call gs(S,f,u,tol,itmax,e)

open(unit=1,file="bvp_sol_f90.dat",action="write",status="replace")
write(1,*) 0.0,a ! BC at x=0
do i=1,size(u,1)
	write(1,*) xi(i),u(i)
end do
write(1,*) 1.0,b ! BC at x=1
close(1)
open(unit=1,file="bvp_gs_cv.dat",action="write",status="replace")
	do i=1,size(pack(e,e.ne.huge(1.0)),1)
write(1,*) e(i)
end do
close(1)
call deallocate_sparse(S)

contains

subroutine allocate_sparse(m,a)
implicit none
integer, intent(in) :: m
type(sparse), intent(inout) :: a
allocate(a%val(m))
allocate(a%row_ind(m))
allocate(a%col_ind(m))
end subroutine allocate_sparse

subroutine deallocate_sparse(a)
implicit none
type(sparse), intent(inout) :: a
deallocate(a%row_ind)
deallocate(a%col_ind)
deallocate(a%val)
end subroutine deallocate_sparse

real elemental function rhs(x,omega)
implicit none
real, intent(in) :: x, omega
rhs = 1
end function rhs

subroutine gs(a,b,x,tol,itmax,e)
implicit none
type(sparse), intent(in) :: a
real, intent(in) :: b(:)
real, intent(inout) :: x(:)
real, intent(in) :: tol
real, intent(out) :: e(0:itmax)
integer, intent(in) :: itmax
integer :: i,j,k,n,nn
real :: r(size(b,1)), x_old(size(x,1))
n = 0
nn = size(a%val,1)
e = huge(1.0)
do while (e(n)>tol .and. n<itmax)
	r = b
	x_old = x
	do k=1,nn
		i = a%row_ind(k); j = a%col_ind(k) ! a(k) = A(i,j)
		if (i .lt. j) r(i) = r(i)-a%val(k)*x_old(j)
	end do
	do k=1,nn
		i = a%row_ind(k); j = a%col_ind(k)
		if (i .gt. j) then
			r(i) = r(i)-a%val(k)*x(j)
		elseif (i .eq. j) then
			x(i) = r(i)/a%val(k)
		end if
	end do
	n = n+1
	e(n) = norm(x-x_old)/norm(x)
end do
if (n==itmax .and. e(n)>tol) print *, 'no convergence in gs'
end subroutine gs

real function norm(x)
implicit none
real, intent(in) :: x(:)
norm = sqrt(dot_product(x,x))
end function norm

end program pb1
