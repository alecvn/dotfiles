;; Python debugger
(fset 'pdb
   "import pdb; pdb.set_trace()")
(global-set-key (kbd "C-x , p") 'pdb )
