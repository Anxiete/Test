class AboutController < ApplicationController
  def index
    @aboutUs = About.all
  end
end
