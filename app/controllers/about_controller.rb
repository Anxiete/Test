class AboutController < ApplicationController
  def index
    @about_us = About.all
  end
end
