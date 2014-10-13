svnadmin create --fs-type fsfs ./svn_rep

svn_rep=file://$PWD/svn_rep
svn_rep=file:///home/sergio/man/git/from_svn/svn_rep

svn2git $svn_rep
git remote add origin URL
git push --all
git push --tags
