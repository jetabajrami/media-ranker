class WorksController < ApplicationController
  # WORKS = [
  #   { title: "Hidden Figures", author: "Margot Lee Shetterly"},
  #   { title: "Practical Object-Oriented Design in Ruby", author: "Sandi Metz"},
  #   { title: "Kindred", author: "Octavia E. Butler"}
  # ]
   
  def index
   @works = Work.all
  end

end
