(autoload 'nvm-use "nvm" nil t)
(autoload 'nvm-use-for "nvm" nil t)

(my-after-init
  ;; (nvm-use "0.11")

  ;; Use Node.js version from ~/.nvmrc
  (nvm-use-for))