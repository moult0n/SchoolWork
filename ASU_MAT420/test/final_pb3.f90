program pb3
implicit none
integer, parameter :: lda=50,ldb=lda,ldvl=1,ldvr=ldvl,n=6,lwork=-1
integer :: info
real::a(lda,n),b(ldb,n),alphar(n),alphal(n),beta(n),vl(ldvl,n),vr(ldvr,n),work(MAX(1,lwork))
character(30) :: jobvl,jobvr


jobvl = 'N'
jobvr = 'N'
a(1:n,1:n) = reshape((/0.0,1.,0.,0.,0.,0.,.3333,0.,.666667,0.,0.,0.,0.,.4,0.,.6,0.,0.,0.,0.,.42857,0.,.57143,0.,0.,0.,0.,.4444,0.,.5556,0.,0.,0.,0.,.545455,0./),(/6,6/))
b(1:n,1:1) = reshape((/1.,1.,1.,1.,1.,1./),(/6,1/))

call sggev(jobvl,jobvr,n,a,lda,b,ldb,alphar,alphal,beta,vl,ldvl,vr,ldvr,work,lwork,info)

write(*,*) 'alphar = ', alphar
write(*,*) 'alphal = ', alphal
write(*,*) 'beta = ', beta
end program pb3

