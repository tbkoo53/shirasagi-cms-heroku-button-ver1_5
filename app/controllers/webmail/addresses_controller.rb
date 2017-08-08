class Webmail::AddressesController < ApplicationController
  include Webmail::BaseFilter
  include Sns::CrudFilter

  model Webmail::Address

  private

  def set_crumbs
    @crumbs << [t("mongoid.models.webmail/address"), { action: :index } ]
  end

  def fix_params
    { cur_user: @cur_user }
  end

  public

  def index
    @items = @model.
      user(@cur_user).
      search(params[:s]).
      page(params[:page]).
      per(50)
  end
end