class ApplicationController < ActionController::Base
    helper :all

    include FinderHelper
end