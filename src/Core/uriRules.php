<?php

return [
    '/home' => 'site/home',
    '/about' => 'site/about',
    '/login' => 'site/loginform',

    '/usergroup/page{page}' => 'usergroup/show',
    '/usergroup/edit{id}' => 'usergroup/showeditform',
    '/usergroup/add' => 'usergroup/showaddform',
    '/usergroup/delete{id}' => 'usergroup/delete',

    '/remarks/page{page}' => 'remarks/show',
    '/remarks/edit{id}' => 'remarks/showeditform',
    '/remarks/add' => 'remarks/showaddform',
    '/remarks/delete{id}' => 'remarks/delete',

    '/users/page{page}' => 'users/show',
    '/users/edit{id}' => 'users/showeditform',
    '/users/add' => 'users/showaddform',
    '/users/delete{id}' => 'users/delete',

    '/workshops/page{page}' => 'workshops/show',
    '/workshops/edit{id}' => 'workshops/showeditform',
    '/workshops/add' => 'workshops/showaddform',
    '/workshops/delete{id}' => 'workshops/delete',

    '/remarktype/page{page}' => 'remarktype/show',
    '/remarktype/edit{id}' => 'remarktype/showeditform',
    '/remarktype/add' => 'remarktype/showaddform',
    '/remarktype/delete{id}' => 'remarktype/delete',

    '/signup' => 'signup/showform'
];
