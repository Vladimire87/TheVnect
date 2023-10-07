// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from './application'

import TextareaAutogrow from 'stimulus-textarea-autogrow'
application.register('textarea-autogrow', TextareaAutogrow)

import HelloController from './hello_controller'
application.register('hello', HelloController)

import Dropdown from 'stimulus-dropdown'
application.register('dropdown', Dropdown)

import PasswordVisibility from 'stimulus-password-visibility'
application.register('password-visibility', PasswordVisibility)
