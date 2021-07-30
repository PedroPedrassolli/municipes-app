// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails, { formDisableSelector } from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'jquery'
import 'bootstrap'
import 'popper.js'
import 'inputmask'
require('packs/form')
require('packs/cep_search')

Rails.start()
Turbolinks.start()
ActiveStorage.start()
