class PuusController < ApplicationController

def show
  @puus = Puu.all
end

end
