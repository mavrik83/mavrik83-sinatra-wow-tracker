# frozen_string_literal: true

require './config/environment'

use UserController
use CharacterController
run ApplicationController
